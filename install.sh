#!/usr/bin/env bash
# ystack install.sh — v1.1
# Bootstraps the ystack swarm on a new machine.
# Safe to re-run — idempotent operations throughout.
#
# Requirements:
#   - Node.js >= 18 (for npx and Gemini CLI)
#   - Python >= 3.11 (for FastMCP-based MCPs)
#   - pip (for Python MCP servers)
#   - gemini CLI installed (npm install -g @google/gemini-cli)
#
# Usage:
#   chmod +x install.sh && ./install.sh

set -euo pipefail

# ── Colors ────────────────────────────────────────────────────────────────────
TEAL='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

log_info()  { echo -e "${TEAL}→${RESET} $1"; }
log_ok()    { echo -e "${GREEN}✓${RESET} $1"; }
log_warn()  { echo -e "${YELLOW}!${RESET} $1"; }
log_error() { echo -e "${RED}✗${RESET} $1"; }

echo ""
echo -e "${TEAL}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${TEAL}  ystack v1.1 — Antigravity Swarm System  ${RESET}"
echo -e "${TEAL}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""

# ── 1. Verify prerequisites ───────────────────────────────────────────────────
log_info "Checking prerequisites..."

if ! command -v node &>/dev/null; then
    log_error "Node.js not found. Install from https://nodejs.org (>= 18)"
    exit 1
fi
NODE_VERSION=$(node -v | sed 's/v//' | cut -d. -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    log_error "Node.js >= 18 required. Found: $(node -v)"
    exit 1
fi
log_ok "Node.js $(node -v)"

if ! command -v python3 &>/dev/null; then
    log_warn "Python 3 not found — some MCP servers may not work"
else
    log_ok "Python $(python3 --version)"
fi

if ! command -v gemini &>/dev/null; then
    log_warn "Gemini CLI not found. Installing globally..."
    npm install -g @google/gemini-cli
    log_ok "Gemini CLI installed"
else
    log_ok "Gemini CLI $(gemini --version 2>/dev/null || echo 'installed')"
fi

# ── 2. Create agent directories ───────────────────────────────────────────────
log_info "Creating agent state directories..."

mkdir -p .agents/brain
mkdir -p .agents/skills

# Write gitkeep with comment if not exists
if [ ! -f .agents/brain/.gitkeep ]; then
    cat > .agents/brain/.gitkeep <<'EOF'
# .agents/brain/ — shared state between swarm agents
# All subagent outputs are written here during a session.
# These files are .gitignored — they are session-scoped, not persistent.
# The orchestrator reads these files to consolidate results.
EOF
fi
log_ok ".agents/brain/ ready"

# ── 3. Install MCP servers ────────────────────────────────────────────────────
log_info "Installing MCP servers..."

# Determine Gemini settings file location
GEMINI_SETTINGS="$HOME/.gemini/settings.json"
if [ ! -f "$GEMINI_SETTINGS" ]; then
    mkdir -p "$HOME/.gemini"
    echo '{"mcpServers": {}}' > "$GEMINI_SETTINGS"
    log_info "Created $GEMINI_SETTINGS"
fi

# Function to add MCP server (idempotent)
add_mcp() {
    local name="$1"
    local command="$2"
    shift 2
    local args=("$@")

    # Check if already configured
    if python3 -c "import json; d=json.load(open('$GEMINI_SETTINGS')); exit(0 if '$name' in d.get('mcpServers',{}) else 1)" 2>/dev/null; then
        log_ok "MCP $name already configured"
        return
    fi

    log_info "Adding MCP: $name"
    # Use gemini mcp add if available, else write directly
    if gemini mcp add "$name" --command "$command" -- "${args[@]}" 2>/dev/null; then
        log_ok "MCP $name added via gemini mcp add"
    else
        # Fallback: write directly to settings.json via Python
        python3 - <<PYEOF
import json, sys
path = "$GEMINI_SETTINGS"
with open(path) as f:
    d = json.load(f)
d.setdefault("mcpServers", {})["$name"] = {
    "command": "$command",
    "args": [$(printf '"%s",' "${args[@]}" | sed 's/,$//')]
}
with open(path, "w") as f:
    json.dump(d, f, indent=2)
print(f"  wrote $name to settings.json")
PYEOF
        log_ok "MCP $name configured in settings.json"
    fi
}

# GitHub MCP — git operations, PRs, issues
add_mcp "github" "npx" "-y" "@modelcontextprotocol/server-github"

# Playwright MCP — browser automation, QA, screenshots
add_mcp "playwright" "npx" "-y" "@playwright/mcp@latest"

# Firecrawl MCP — web scraping, docs extraction (replaces context7)
# Requires FIRECRAWL_API_KEY env var — free tier available at firecrawl.dev
add_mcp "firecrawl" "npx" "-y" "firecrawl-mcp"

# Sequential Thinking MCP — multi-step reasoning chains
add_mcp "sequential-thinking" "npx" "-y" "@modelcontextprotocol/server-sequential-thinking"

# Filesystem MCP — explicit file operations with audit trail
add_mcp "filesystem" "npx" "-y" "@modelcontextprotocol/server-filesystem" "$(pwd)"

# Supabase MCP — DB management (requires SUPABASE_ACCESS_TOKEN)
add_mcp "supabase" "npx" "-y" "supabase-mcp-server"

log_ok "All MCP servers configured"

# ── 4. Copy global config to project root ────────────────────────────────────
log_info "Setting up project config files..."

# Copy GEMINI.md if not present
if [ ! -f GEMINI.md ]; then
    cp GEMINI.md GEMINI.md 2>/dev/null || true
    log_ok "GEMINI.md ready (Antigravity reads this automatically)"
else
    log_ok "GEMINI.md already exists"
fi

# Copy global AGENTS config if not present
if [ ! -f AGENTS.global.md ]; then
    cp config/AGENTS.global.md AGENTS.global.md 2>/dev/null || true
    log_ok "AGENTS.global.md ready"
fi

# ── 5. Verify MCP installation ─────────────────────────────────────────────
log_info "Verifying MCP configuration..."
python3 - <<'PYEOF'
import json, os

path = os.path.expanduser("~/.gemini/settings.json")
with open(path) as f:
    settings = json.load(f)

servers = settings.get("mcpServers", {})
expected = ["github", "playwright", "firecrawl", "sequential-thinking", "filesystem", "supabase"]
missing = [s for s in expected if s not in servers]

if missing:
    print(f"  ⚠ Missing: {', '.join(missing)}")
else:
    print(f"  ✓ All {len(expected)} MCP servers configured")
    for name in expected:
        print(f"    • {name}")
PYEOF

# ── 6. Environment variables check ───────────────────────────────────────────
echo ""
log_info "Checking optional environment variables..."

check_env() {
    local var="$1"
    local purpose="$2"
    if [ -n "${!var:-}" ]; then
        log_ok "$var set ($purpose)"
    else
        log_warn "$var not set — $purpose will not work"
        echo "       Set it with: export $var=your_key"
    fi
}

check_env "GITHUB_PERSONAL_ACCESS_TOKEN" "GitHub MCP (PRs, issues, commits)"
check_env "FIRECRAWL_API_KEY" "Firecrawl MCP (web scraping, docs lookup)"
check_env "SUPABASE_ACCESS_TOKEN" "Supabase MCP (DB management)"

# ── 7. Done ───────────────────────────────────────────────────────────────────
echo ""
echo -e "${TEAL}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN}  ystack v1.1 ready${RESET}"
echo -e "${TEAL}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo "  Next steps:"
echo "  1. Open your project in Antigravity"
echo "  2. Antigravity will auto-read GEMINI.md"
echo "  3. Paste config/bootstrap.md into Agent Manager for first run"
echo ""
echo "  Verify MCPs in Gemini CLI:"
echo "    gemini"
echo "    /mcp"
echo ""
echo "  Try the demo:"
echo "    Open promptvault/ and paste promptvault/task.md into Agent Manager"
echo ""
