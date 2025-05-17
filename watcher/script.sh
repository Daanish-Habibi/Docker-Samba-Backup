#!/bin/sh

echo "🚀 Starting Samba-to-M.2 watcher sync..."

# Install dependencies (only needed in Alpine or minimal container)
apk add --no-cache inotify-tools rsync

# Sanity checks
if [ ! -d /data/source ]; then
  echo "❌ ERROR: Source directory '/data/source' not found!"
  exit 1
fi

if [ ! -d /data/dest ]; then
  echo "❌ ERROR: Destination directory '/data/dest' not found!"
  exit 1
fi

# Initial sync
echo "🔄 Performing initial full sync..."
rsync -a --delete /data/source/ /data/dest/
echo "✅ Initial sync complete."

# Watch for file changes in source and re-sync on event
echo "👀 Watching for changes in /data/source..."
while true; do
  inotifywait -r -e modify,create,delete,move /data/source
  echo "📁 Change detected. Syncing now..."
  rsync -a --delete /data/source/ /data/dest/
  echo "✅ Sync complete."
  sleep 1
done