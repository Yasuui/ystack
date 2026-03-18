# Contributing to ystack ⚡

Thank you for your interest in contributing to ystack! We are committed to making this the best free, open-source multi-agent development swarm.

---

## ── Open Source Ethos 🌍

ystack is designed to be accessible to all. We welcome developers of all skill levels to help improve the individual agents, the core orchestrator, and the living skills system.

### How to Help
1.  **Bug reports**: If an agent produces wrong output or "vibecodes" slop.
2.  **New Agents**: Specialized agents for specialized domains (e.g. `ios-agent`, `terraform-agent`).
3.  **Better Prompts**: Refining the `agents/*.md` files for more reliable outputs.
4.  **Skills**: Adding common design patterns to the living skills library.

---

## ── PR Guidelines 📝

To maintain high quality, all contributions must follow this standard:

1.  **Read the Patterns**: Before touching code, read the existing agents in `swarmstack/agents/`.
### Branch Strategy
- `main`: The frozen, stable production branch. **Direct pushes are locked out.**
- `dev`: The active development and staging branch where features are integrated.
- Create feature branches originating from `dev` (e.g., `feature/new-agent`, `fix/marketing-prompt`).
- Create your Pull Requests targeting `dev` for integration, never `main`.

2.  **Modular Changes**: Keep pull requests focused on a single logical change.
3.  **Conventional Commits**: Use `feat:`, `fix:`, `chore:`, etc.
4.  **Agent Audit**: Every PR must be reviewed by the **Review Agent** and checked for breaking changes by the **QA Agent**.

### Commit Message Example:
`feat(agents): add python-test agent for pytest generation`

---

## ── Setting Up 🏰

```bash
# Clone the repository
git clone https://github.com/Yasuui/ystack.git
cd ystack

# Install dependencies for local testing
npm install
pip install -r requirements-dev.txt
```

---

## ── Reporting Security Issues 🔒

If you discover a security vulnerability, please do NOT create a public issue. Instead, report it through the standard GitHub security advisory channel or contact the maintainer directly.

### Maintainer
Yonis Diriye — [Developer Profile](https://github.com/Yasuui)

---

*ystack is built by the community for the community.*
