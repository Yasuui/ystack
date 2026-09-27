#!/usr/bin/env bash
# Historical entry point is now a safe opt-in wrapper.
# The old v1 script automatically installed global tools and MCPs.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
printf '%s\n' 'ystack now uses an opt-in, selected-project bootstrap. No global settings will change.'
exec bash "$HERE/scripts/bootstrap-project.sh" "$@"
