# ystack-repo-setup-prompt.md — ystack ⚡

> **Example**: How to setup the ystack repo using the GitHub CLI.

This is the prompt and sequence of commands used to create the **ystack** open-source repository and initialize its issues and labels.

---

## ── Repo Setup Sequence 🧬

### Step 1: Initialize Git
```bash
git init
git add .
git commit -m "feat: initial bootstrap"
```

### Step 2: Create Repo with GH CLI
```bash
gh repo create younis-ali/ystack --public --description "Free multi-agent developer swarm for Antigravity IDE and Gemini CLI" --push --source .
```

### Step 3: Add Topics and Labels
```bash
gh repo edit younis-ali/ystack \
  --add-topic gemini-cli \
  --add-topic antigravity \
  --add-topic ai-tools \
  --add-topic mcp \
  --add-topic developer-tools \
  --add-topic productivity \
  --add-topic open-source

gh label create "good-first-issue" --color "7057ff" --description "Great for first contributors" --repo younis-ali/ystack
gh label create "new-agent" --color "0075ca" --description "Request for a new specialist agent" --repo younis-ali/ystack
gh label create "prompt-bug" --color "d93f0b" --description "Agent produces wrong output" --repo younis-ali/ystack
gh label create "living-skill" --color "e4e669" --description "Improvement to skills system" --repo younis-ali/ystack
```

### Step 4: Create Initial Issues
```bash
gh issue create --title "feat(agents): add /test:unit — generate unit tests from source files" --label "new-agent,good-first-issue" --body "Generate pytest/vitest tests for a given function or module." --repo younis-ali/ystack
gh issue create --title "feat(agents): add /deps — audit dependencies for CVEs and outdated packages" --label "new-agent,good-first-issue" --body "Scans requirements.txt or package.json." --repo younis-ali/ystack
```

---

*ystack - https://github.com/Yasuui/ystack.git*
*Maintainer: Yonis Diriye.*
