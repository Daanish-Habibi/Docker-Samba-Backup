#!/bin/bash
set -e  # Exit if any command fails

# Paths
ENTRYPOINT="./samba/entrypoint.sh"
CONFIG="./samba/config.txt"

# 🔧 Ensure entrypoint.sh is executable
if [ ! -x "$ENTRYPOINT" ]; then
  echo "🔧 Fixing permissions for $ENTRYPOINT..."
  chmod +x "$ENTRYPOINT"
fi

# ⚠️ Warn if config.txt is missing
if [ ! -f "$CONFIG" ]; then
  echo "⚠️  Warning: config.txt not found in ./samba. A default share will be used."
fi

# Handle optional "all" argument
RUN_ALL="$1"

if [ "$RUN_ALL" = "all" ]; then
  echo "🔁 Starting ALL containers (samba + watcher)..."
  docker compose up -d samba secondary_watcher
else
  echo "🔍 Checking if 'samba' is running..."
  if docker ps --filter "name=samba" --format '{{.Names}}' | grep -Fxq "samba"; then
    echo "⏩ 'samba' is already running. Skipping..."
  else
    echo "▶️ Starting 'samba'..."
    docker compose up -d samba
  fi
fi