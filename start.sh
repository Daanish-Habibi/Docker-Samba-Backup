#!/bin/bash

# Services to check
SERVICES=("primary_samba" "secondary_watcher")

# Start services conditionally
for SERVICE in "${SERVICES[@]}"; do
  if docker ps --filter "name=$SERVICE" --format '{{.Names}}' | grep -q "$SERVICE"; then
    echo "⏩ $SERVICE already running, skipping."
  else
    echo "▶️ Starting $SERVICE..."
    docker compose up -d $SERVICE
  fi
done