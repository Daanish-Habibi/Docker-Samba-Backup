#!/bin/sh

CONFIG_FILE="/etc/samba/config.txt"

if [ -f "$CONFIG_FILE" ]; then
  echo "⚙️ Using config from: $CONFIG_FILE"

  # Read each line into an array of arguments
  CMD_ARGS=""
  while IFS= read -r line || [ -n "$line" ]; do
    CMD_ARGS="$CMD_ARGS $line"
  done < "$CONFIG_FILE"
else
  echo "⚠️ No config.txt found. Using default public share."
  CMD_ARGS='-s "public;/mount/backup;yes;no;no;guest"'
fi

echo "🚀 Running: /init $CMD_ARGS"
# Use `eval` to preserve argument structure and quotes
eval exec /usr/bin/samba.sh $CMD_ARGS