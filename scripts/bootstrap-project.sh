#!/usr/bin/env bash
# One explicitly selected Git repository; preview by default, never global.
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
TARGET=""
APPLY=false
usage() {
  cat <<'HELP'
ystack: add three opt-in Gemini CLI skills to ONE selected repository.

Usage:
  bash scripts/bootstrap-project.sh --target /absolute/path/to/repo
  bash scripts/bootstrap-project.sh --target /absolute/path/to/repo --apply

Dry-run unless --apply. Never modifies global settings, installed tools,
or existing skills / GEMINI.md / AGENTS.md.
HELP
}
while [ "$#" -gt 0 ]; do
  case "$1" in
    --target) [ "$#" -ge 2 ] || { echo "Missing --target value" >&2; exit 2; }; TARGET="$2"; shift 2 ;;
    --apply) APPLY=true; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage >&2; exit 2 ;;
  esac
done
if [ -z "$TARGET" ]; then usage; exit 0; fi
if [ ! -d "$TARGET" ]; then echo "Target directory not found: $TARGET" >&2; exit 2; fi
TARGET="$(cd "$TARGET" && pwd -P)"
if [ "$TARGET" = "$HERE" ]; then
  echo "Refusing to install into the ystack source repo. Select a separate project." >&2
  exit 2
fi
if ! command -v git >/dev/null 2>&1 || ! ROOT="$(git -C "$TARGET" rev-parse --show-toplevel 2>/dev/null)"; then
  echo "Select the root directory of an existing Git repository." >&2
  exit 2
fi
ROOT="$(cd "$ROOT" && pwd -P)"
if [ "$ROOT" != "$TARGET" ]; then
  echo "Target must be the selected repository ROOT: $ROOT" >&2
  exit 2
fi
printf 'Selected project: %s\n' "$TARGET"
printf 'Mode: %s\n' "$([ "$APPLY" = true ] && echo apply || echo preview-only)"

for name in ystack-bootstrap ystack-verify ystack-ship; do
  source="$HERE/vnext/skills/$name"
  dest="$TARGET/.gemini/skills/$name"
  if [ ! -f "$source/SKILL.md" ]; then echo "Missing bundled skill: $name" >&2; exit 1; fi
  if [ -e "$dest" ]; then
    printf 'SKIP existing: %s\n' "$dest"
  elif [ "$APPLY" = true ]; then
    mkdir -p "$(dirname "$dest")"
    cp -R "$source" "$dest"
    printf 'ADDED: %s\n' "$dest"
  else
    printf 'WOULD ADD: %s\n' "$dest"
  fi
done

if [ -e "$TARGET/GEMINI.md" ] || [ -e "$TARGET/AGENTS.md" ]; then
  echo 'Existing project instructions detected: preserved, not modified.'
else
  echo 'Project instructions missing: use ystack-bootstrap to draft a small local contract.'
  echo "Optional reference: $HERE/vnext/GEMINI.project-template.md"
fi

if [ "$APPLY" = true ]; then
  echo 'Done. Open ONLY this project in Gemini CLI; run /skills list or /skills reload.'
  echo 'Verify Antigravity discovery separately in your installed version.'
else
  echo 'Preview complete. Re-run with --apply only after checking the target.'
fi
