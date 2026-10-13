#!/usr/bin/env python3
"""Read-only RBSmithy structural validator. Does not run game or template code."""
import argparse
import json
from pathlib import Path
import re
import sys
from urllib.parse import unquote


def inspect(root):
    root = Path(root).resolve()
    errors, advisory = [], []
    skill = root if (root / "SKILL.md").is_file() else root / "skills/rbsmithy"
    entry = skill / "SKILL.md"
    if not entry.is_file():
        return dict(errors=[dict(path="SKILL.md", message="missing entrypoint")], advisory=[], markdown_files=0)
    text = entry.read_text(encoding="utf-8")
    match = re.match(r"---\nname: ([a-z0-9-]+)\ndescription: ([^\n]+)\n---\n", text)
    if not match or match[1] != skill.name or not 1 <= len(match[2]) <= 1024:
        errors.append(dict(path=str(entry.relative_to(root)), message="invalid skill metadata"))
    files = sorted(p for p in root.rglob("*.md") if ".git" not in p.parts and not p.is_symlink())
    for file in files:
        text = file.read_text(encoding="utf-8")
        fence = chr(96)*3
        prose = re.sub(r"(?ms)^"+fence+r".*?^"+fence+r"\s*$", "", text)
        rel = file.relative_to(root).as_posix()
        if not text.strip():
            errors.append(dict(path=rel, message="empty Markdown file"))
        if "playbooks" in file.parts and len(text.split()) < 40:
            advisory.append(dict(path=rel, message="short workflow: inspect inputs, concrete checks and failure handling manually"))
        targets = [(m.group(1), m.start()) for m in re.finditer(r"\[[^\]]*\]\(([^)]+)\)", prose)]
        targets += [(m.group(1), m.start()) for m in re.finditer(r'href="([^"]+)"', prose)]
        if file == entry:
            targets += [(m.group(1), m.start()) for m in re.finditer(r"(?<!\w)((?:reference|playbooks|systems|templates|scripts)/[A-Za-z0-9_./-]+\.(?:md|py|luau))", prose)]
        for target, offset in targets:
            target = target.strip("<>")
            if re.match(r"^[a-zA-Z]+:", target):
                continue
            pathpart = unquote(target.split("#", 1)[0])
            resolved = (file.parent / pathpart).resolve() if pathpart else file
            line = prose.count("\n", 0, offset)+1
            if not resolved.is_relative_to(root):
                errors.append(dict(path=rel, line=line, message="internal link escapes selected root", target=target))
            elif not resolved.exists():
                errors.append(dict(path=rel, line=line, message="missing internal reference", target=target))
            elif "#" in target and resolved.suffix == ".md":
                contents = resolved.read_text(encoding="utf-8")
                contents = re.sub(r"(?ms)^"+fence+r".*?^"+fence+r"\s*$", "", contents)
                slugs, counts = set(), {}
                for heading in re.findall(r"(?m)^#{1,6}\s+(.+?)\s*#*\s*$", contents):
                    slug = re.sub(r"[^\w\s-]", "", heading.lower()).replace(" ", "-")
                    count = counts.get(slug, 0)
                    counts[slug] = count+1
                    slugs.add(slug if count == 0 else slug+"-"+str(count))
                slugs.update(re.findall(r'(?:id|name)="([^"]+)"', contents))
                if unquote(target.split("#", 1)[1]) not in slugs:
                    errors.append(dict(path=rel, line=line, message="missing heading anchor", target=target))
    return dict(errors=errors, advisory=advisory, markdown_files=len(files),
                limitations="Link targets and ordinary GitHub Markdown heading/HTML anchors; reference-style Markdown and exotic heading syntax remain unparsed. Semantic correctness, runtime APIs and template execution require manual review.")


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    args = p.parse_args()
    try:
        result = inspect(args.root)
    except (OSError, UnicodeError) as exc:
        print(json.dumps(dict(error=str(exc))), file=sys.stderr)
        return 2
    print(json.dumps(result, indent=2, sort_keys=True))
    return 1 if result["errors"] else 0


if __name__ == "__main__":
    sys.exit(main())
