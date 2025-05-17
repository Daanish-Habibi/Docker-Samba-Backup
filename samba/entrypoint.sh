#!/bin/sh

# Default to open share
CMD="-s 'backup;/mount/backup;yes;no;no;guest'"

CONFIG_FILE="/config/config.txt"

if [ -f "$CONFIG_FILE" ]; then
  echo "⚙️ Using config file: $CONFIG_FILE"
  CMD="$(cat $CONFIG_FILE)"
else
  echo "⚠️ No config file found. Defaulting to public share."
fi

# Start Samba with proper options
exec /usr/bin/smbd -F $CMD