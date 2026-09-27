---
name: ystack-ship
description: Prepare a reviewed change in one selected repository for a PR or handoff, using current revision-specific evidence and an explicit ship card. Use after acceptance criteria are met; do not interpret PR preparation as permission to merge or deploy.
---

# Prepare a clear handoff

1. Confirm selected repository, branch, diff, and accepted outcome. Respect existing branch protections and target. Inspect for unrelated changes, secret patterns, conflicts, and parallel edits. Don't blindly rebase an old branch.
2. Read current, exact-revision verification results; run a focused check if needed. Old READY files and previous-head tests are not current proof.
3. Build the ship card below. Distinguish changed-code evidence from real Preview/provider/database release gates, including unknowns and approvals.
4. Draft a precise PR title/body and test instructions. Open a PR **only if explicitly authorized** and GitHub write access is available. Otherwise leave an actionable draft.
5. Release separately: preparing a PR grants no permission to merge, deploy, change production environments, apply destructive migrations, or send externally.

## Ship card

- Project / branch / revision:
- Outcome and acceptance criteria:
- Files changed and reason:
- Change proof: exact commands, results, environment:
- Unrun checks or failed checks:
- Release-target proof (Preview, auth, storage, providers):
- Conflicts / risks:
- PR or handoff link (only if actually created):
- Human approval needed and the next action:

Finish at the first honest completion point. Blocked releases remain blocked even when local verification is green.
