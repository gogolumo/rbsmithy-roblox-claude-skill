"""Build only the existing MIT Free tree; no Pro source or docs included."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "skills/rbsmithy/scripts"))
from validate_skill import inspect


def build():
    if subprocess.check_output(["git", "status", "--porcelain"], cwd=ROOT, text=True).strip():
        raise ValueError("build requires clean committed source")
    version = (ROOT / "VERSION").read_text(encoding="utf-8").strip()
    revision = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
    names = subprocess.check_output(["git", "ls-files", "skills/rbsmithy"], cwd=ROOT, text=True).splitlines()
    entries = {}
    for name in names:
        path = ROOT / name
        if path.is_symlink() or any(p.startswith(".") for p in path.relative_to(ROOT / "skills/rbsmithy").parts):
            raise ValueError("non-distributable file in skill tree")
        entries["rbsmithy/" + path.relative_to(ROOT / "skills/rbsmithy").as_posix()] = path.read_bytes()
    entries["rbsmithy/LICENSE"] = (ROOT / "LICENSE").read_bytes()
    if not entries["rbsmithy/LICENSE"].startswith(b"MIT License"):
        raise ValueError("Free license must remain MIT")
    entries["rbsmithy/VERSION"] = (version+"\n").encode()
    manifest = dict(product="rbsmithy-free", version=version, source_commit=revision,
                    files={n: hashlib.sha256(b).hexdigest() for n,b in sorted(entries.items())})
    entries["rbsmithy/RELEASE_MANIFEST.json"] = (json.dumps(manifest, sort_keys=True, indent=2)+"\n").encode()
    out = ROOT / "dist"
    out.mkdir(exist_ok=True)
    archive = out / f"rbsmithy-free-v{version}.zip"
    if archive.exists():
        raise ValueError("refusing to replace an existing versioned archive")
    with zipfile.ZipFile(archive, "w", compression=zipfile.ZIP_STORED) as z:
        for name, data in sorted(entries.items()):
            info = zipfile.ZipInfo(name, (2020,1,1,0,0,0))
            info.create_system = 3
            info.external_attr = 0o100644 << 16
            z.writestr(info, data)
    with tempfile.TemporaryDirectory() as tmp:
        dest = Path(tmp).resolve()
        with zipfile.ZipFile(archive) as z:
            if z.testzip():
                raise ValueError("ZIP CRC error")
            for name in z.namelist():
                if not name.startswith("rbsmithy/") or ".." in Path(name).parts or "\\" in name:
                    raise ValueError("unsafe generated archive path")
                p = dest/name
                p.parent.mkdir(parents=True, exist_ok=True)
                p.write_bytes(z.read(name))
        result = subprocess.run([sys.executable,"-I","-B",str(dest/"rbsmithy/scripts/validate_skill.py"),"--root",str(dest/"rbsmithy")],
                                capture_output=True,text=True,timeout=30)
        if result.returncode or json.loads(result.stdout)["errors"]:
            raise ValueError("clean-install structural smoke failed")
    digest = hashlib.sha256(archive.read_bytes()).hexdigest()
    (out/"SHA256SUMS.txt").write_text(f"{digest}  {archive.name}\n",encoding="utf-8")
    (out/"manifest.json").write_text(json.dumps(manifest,sort_keys=True,indent=2)+"\n",encoding="utf-8")
    print(json.dumps(dict(filename=archive.name,size=archive.stat().st_size,sha256=digest,source_commit=revision,clean_install="passed")))


if __name__ == "__main__":
    build()
