#!/bin/bash

# Handle optional "all" argument
RUN_ALL="$1"

if [ "$RUN_ALL" = "all" ]; then
  echo "🔁 Starting ALL containers (samba + watcher)..."
  docker compose up -d samba secondary_watcher
else
  echo "🔍 Checking if 'samba' is running..."
  if docker ps --filter "name=samba" --format '{{.Names}}' | grep -q "samba"; then
    echo "⏩ 'samba' is already running. Skipping..."
  else
    echo "▶️ Starting 'samba'..."
    docker compose up -d samba
  fi
fi