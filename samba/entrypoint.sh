#!/bin/sh

CONFIG_FILE="$(dirname "$0")/config.txt"

if [ -f "$CONFIG_FILE" ]; then
  echo "⚙️ Using config from: $CONFIG_FILE"
  CMD=$(cat "$CONFIG_FILE")
else
  echo "⚠️ No config.txt found. Using default public share."
  CMD="-s 'public;/mount/backup;yes;no;no;guest'"
fi

echo "🚀 Running: smbd -F $CMD"
exec /usr/sbin/smbd -F $CMD