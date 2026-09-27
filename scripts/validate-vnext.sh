#!/usr/bin/env bash
# Focused structural test for the public starter; does NOT test live AI.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
bash -n "$HERE/install.sh" "$HERE/scripts/bootstrap-project.sh" "$HERE/scripts/validate-vnext.sh"
python3 - "$HERE" <<'PY'
from pathlib import Path
import re
import sys
root = Path(sys.argv[1])
required = [
    'README.md', 'AGENTS.md', 'GEMINI.md',
    'docs/ARCHITECTURE.md', 'docs/MIGRATION.md',
    'vnext/GEMINI.project-template.md', 'scripts/bootstrap-project.sh',
]
for path in required:
    assert (root / path).is_file(), f'Missing {path}'
for name in ('ystack-bootstrap', 'ystack-verify', 'ystack-ship'):
    file = root / 'vnext' / 'skills' / name / 'SKILL.md'
    content = file.read_text()
    front = re.match(r'\A---\n(.*?)\n---\n', content, re.S)
    assert front, f'Missing frontmatter: {file}'
    assert re.search(rf'(?m)^name:\s*{re.escape(name)}\s*$', front.group(1)), f'Wrong skill name: {file}'
    assert re.search(r'(?m)^description:\s*\S.+$', front.group(1)), f'Missing description: {file}'
    assert len(content) < 6500, f'Overly long skill: {file}'
print('Public starter structure and skill metadata: PASS')
PY
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP/demo"
git -C "$TMP/demo" init -q
bash "$HERE/scripts/bootstrap-project.sh" --target "$TMP/demo" > "$TMP/preview.log"
test ! -e "$TMP/demo/.gemini" || { echo 'Dry-run wrote files' >&2; exit 1; }
bash "$HERE/scripts/bootstrap-project.sh" --target "$TMP/demo" --apply > "$TMP/apply.log"
for name in ystack-bootstrap ystack-verify ystack-ship; do
  cmp "$HERE/vnext/skills/$name/SKILL.md" "$TMP/demo/.gemini/skills/$name/SKILL.md"
done
printf '\n# local customization\n' >> "$TMP/demo/.gemini/skills/ystack-verify/SKILL.md"
bash "$HERE/scripts/bootstrap-project.sh" --target "$TMP/demo" --apply > "$TMP/reapply.log"
grep -q 'local customization' "$TMP/demo/.gemini/skills/ystack-verify/SKILL.md" || { echo 'Overwrite detected' >&2; exit 1; }
test ! -e "$TMP/demo/GEMINI.md"
test ! -e "$TMP/demo/AGENTS.md"
if bash "$HERE/scripts/bootstrap-project.sh" --target "$HERE" --apply >/dev/null 2>&1; then
  echo 'Self-install refusal failed' >&2
  exit 1
fi
echo 'Dry-run, selected installation, no-overwrite, and self-install refusal: PASS'
echo 'No AI model, live Antigravity session, remote provider, or MCP was exercised.'
