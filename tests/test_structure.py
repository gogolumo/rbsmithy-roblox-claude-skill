import importlib.util
from pathlib import Path
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("validator", ROOT / "skills/rbsmithy/scripts/validate_skill.py")
validator = importlib.util.module_from_spec(spec)
spec.loader.exec_module(validator)


class StructureTests(unittest.TestCase):
    def root(self, tmp, body=""):
        root = Path(tmp).resolve() / "rbsmithy"
        root.mkdir()
        (root/"SKILL.md").write_text("---\nname: rbsmithy\ndescription: Roblox development review.\n---\n"+body,encoding="utf-8")
        return root

    def test_actual_repository(self):
        self.assertEqual(validator.inspect(ROOT)["errors"], [])

    def test_missing_entry(self):
        with tempfile.TemporaryDirectory() as tmp:
            self.assertTrue(validator.inspect(Path(tmp))["errors"])

    def test_missing_link(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=self.root(tmp,"[Guide](missing.md)")
            self.assertEqual(validator.inspect(root)["errors"][0]["message"],"missing internal reference")

    def test_valid_heading(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=self.root(tmp,"# Example\n[Jump](#example)")
            self.assertFalse(validator.inspect(root)["errors"])

    def test_invalid_heading(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=self.root(tmp,"[Jump](#missing)")
            self.assertEqual(validator.inspect(root)["errors"][0]["message"],"missing heading anchor")

    def test_escape_link(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=self.root(tmp,"[Other](../secret.md)")
            self.assertEqual(validator.inspect(root)["errors"][0]["message"],"internal link escapes selected root")

    def test_code_template_links_ignored(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=self.root(tmp,chr(96)*3+"markdown\n[Generated](future.md)\n"+chr(96)*3+"\n")
            self.assertFalse(validator.inspect(root)["errors"])

    def test_skill_reference_is_checked(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=self.root(tmp,"Read reference/missing.md")
            self.assertTrue(validator.inspect(root)["errors"])

    def test_wrong_name_metadata(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=self.root(tmp)
            p=root/"SKILL.md";p.write_text(p.read_text().replace("name: rbsmithy","name: other"))
            self.assertEqual(validator.inspect(root)["errors"][0]["message"],"invalid skill metadata")

    def test_reference_links_checked(self):
        for body in ("[Guide][ref]\n\n[ref]: missing.md", "[ref][]\n\n[ref]: missing.md",
                     "[ref]\n\n[ref]: missing.md"):
            with tempfile.TemporaryDirectory() as tmp, self.subTest(body=body):
                root = self.root(tmp, body)
                self.assertTrue(any(e["message"] == "missing internal reference" for e in validator.inspect(root)["errors"]))

    def test_reference_label_case_whitespace_and_heading(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self.root(tmp, "# Example\n[Guide][ MY   REF ]\n\n[my ref]: <#example>")
            self.assertFalse(validator.inspect(root)["errors"])

    def test_unresolved_reference_is_plain_text(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self.root(tmp, "[not a defined link][missing]")
            self.assertFalse(validator.inspect(root)["errors"])

    def test_link_line_after_code_fence(self):
        with tempfile.TemporaryDirectory() as tmp:
            body=chr(96)*3+"python\nignored()\n"+chr(96)*3+"\n[Guide][ref]\n\n[ref]: missing.md\n"
            root=self.root(tmp,body)
            finding=validator.inspect(root)["errors"][0]
            self.assertEqual(finding["line"],8)

    def test_free_license_and_boundary(self):
        self.assertTrue((ROOT/"LICENSE").read_text().startswith("MIT License"))
        self.assertFalse(any(p.name=="rbsmithy-pro" for p in (ROOT/"skills").rglob("*")))


if __name__ == "__main__":
    unittest.main()
