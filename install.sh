#!/bin/bash

# ystack — Project Bootstrap Script ⚡

echo "--- Initializing ystack swarm system ---"

# Step 1: Copy global configuration templates
if [ ! -f AGENTS.global.md ]; then
  echo "→ Copying AGENTS.global.md..."
  cp config/AGENTS.global.md AGENTS.global.md
else
  echo "→ AGENTS.global.md already exists, skipping."
fi

if [ ! -f bootstrap.md ]; then
  echo "→ Copying bootstrap.md..."
  cp config/bootstrap.md bootstrap.md
else
  echo "→ bootstrap.md already exists, skipping."
fi

# Step 2: Create local agent directories
echo "→ Creating .agents/brain/..."
mkdir -p .agents/brain
touch .agents/brain/.gitkeep

# Step 3: Create living skills directory (if not exists)
if [ ! -d swarmstack/skills ]; then
  echo "→ Creating swarmstack/skills/..."
  mkdir -p swarmstack/skills
  touch swarmstack/skills/living-skills.md
fi

echo "--- ystack swarm system initialized ---"
echo "Instructions:"
echo "1. Paste the content of bootstrap.md into your Antigravity Agent Manager."
echo "2. Your agent swarm is now ready to work!"
