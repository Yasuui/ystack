# ystack repository instructions

These instructions apply to contributors editing **this public ystack repository**. Do not copy them into global configuration or unrelated projects.

- Entry points: README.md, docs/ARCHITECTURE.md, docs/MIGRATION.md.
- Current starter: vnext/skills/ and scripts/bootstrap-project.sh.
- Historical v1: swarmstack/, config/bootstrap.md, mcp/settings.json, scripts/full-run.js, scripts/parallel-dispatch.js. Do not present those as the current safe setup.
- The public starter is not an imported or fully field-tested copy of the maintainer's private local Antigravity setup.

## Work contract

1. Work in this repo only, unless the user explicitly selects another repo. Inspect relevant files, not sibling repositories or all GitHub projects.
2. Name the outcome and acceptance criteria. Make the smallest useful change; reuse existing CI, auth, deployment, and tooling.
3. Default to one implementation agent. Delegate only independent work with non-overlapping ownership/worktrees.
4. Verify proportionally, recording exact commands/results and skipped checks.
5. Keep **change evidence** separate from **release-target/provider proof**. A synthetic demo or local test cannot validate live OAuth, storage, external delivery, or production.
6. No blanket permissions: ask for consequential external actions including real sends, migrations, credential changes, deployment, merge, or deletion.
7. Finish when acceptance criteria are met and clearly report unknowns.

Conceptual model tiers: FAST, DEFAULT, HIGH, ESCALATE, STRONGEST. Map them locally; escalate when evidence, ambiguity, or risk warrants it, not automatically.

Only claim what has actually been run and verified.
