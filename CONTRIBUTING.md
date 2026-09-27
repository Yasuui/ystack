# Contributing to ystack

Welcome! Keep this starter small, bounded, and evidence-driven.

- vnext/skills/: improve one skill's triggers, contract, or safety.
- scripts/bootstrap-project.sh: keep installation selected-repo-only, opt-in, and non-destructive.
- docs/: short practical notes with reproducible evidence and limitations.
- swarmstack/: historical v1 material. Propose changes there only for an explicit legacy use case.

## Pull requests

1. Define the concrete problem, small scope, and observable result.
2. Run `bash scripts/validate-vnext.sh` for public starter changes. Report exact tests; static validation does not prove a live model or provider works.
3. Never commit personal global configs, tokens, private workspace files, or customer data.
4. Open a focused PR against `dev`. Promotion from `dev` to `main` is a separate release decision.

Report vulnerabilities privately using GitHub's security reporting, not public issue text.
