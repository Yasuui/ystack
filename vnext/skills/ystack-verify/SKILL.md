---
name: ystack-verify
description: Verify one selected repository's change with risk-proportionate checks and report exact evidence separately from live Preview, OAuth, storage, or provider release gates. Use for bug verification, focused PR checks, and blocked tests.
---

# Verify the change, not every possible test

Inputs: selected repository, exact change/revision, acceptance criteria, and intended environment. If the change is unclear, inspect only that repo's current diff or ask what to check.

1. **Pick relevant checks:** docs edits may need only a diff/link check; small code changes need targeted tests and relevant type/lint checks; UI changes should be observed in the affected view; auth, payments, migrations, or sends need deeper failure/boundary checks.
2. **Use existing infrastructure:** use the repo's own test/CI commands. Do not install a second test runner, force a browser check for documentation, or run exhaustive suites without a risk-based reason.
3. **Capture change proof:** record exact revision, commands, passing/failing outputs, environment, screenshots *only if actually taken*, and checks not run. Re-observe effects; do not blindly trust another agent's status.
4. **Capture separate release proof:** actual Preview identity, OAuth/provider connection, durable database and migration state, send receipts, and approvals are VERIFIED, UNVERIFIED, BLOCKED, or NOT APPLICABLE for the release target. Local mocks and synthetic data do not prove them.
5. **Stop at useful evidence:** report a reproducible blocker and minimal next fix on failure. Do not loop indefinitely or reuse stale READY files.

Output: short evidence record stating revision, exact test results, acceptance status, live gates, and next action. Do not merge, deploy, or send real messages during verification.
