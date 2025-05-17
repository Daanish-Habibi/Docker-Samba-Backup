#!/bin/sh

echo "🚀 Starting M.2 backup watcher container..."

# Install inotify and rsync (only needed once, kept here for container rebuilds)
apk add --no-cache inotify-tools rsync

# Sanity check
if [ ! -d /data/source ]; then
  echo "❌ Source folder /data/source does not exist. Exiting."
  exit 1
fi

if [ ! -d /data/dest ]; then
  echo "❌ Destination folder /data/dest does not exist. Exiting."
  exit 1
fi

echo "✅ Watching /data/source for changes..."

# Main watcher loop
while true; do
  inotifywait -r -e modify,create,delete,move /data/source
  echo "📁 Change detected. Syncing..."
  rsync -a --delete /data/source/ /data/dest/
  echo "✅ Sync complete."
  sleep 1
done