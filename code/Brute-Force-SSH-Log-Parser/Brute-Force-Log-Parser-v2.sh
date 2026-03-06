#!/bin/bash

#================================================
# SSH Brute-Force Historical Log Parser (v2)
# Author: Hardik Jain
#================================================

set -euo pipefail

#------------------------------------------------
# Default Configuration
#------------------------------------------------
THRESHOLD="${1:-5}"
TIME_WINDOW="${2:-24 hours ago}"


#------------------------------------------------
# Validate Threshold
#------------------------------------------------
if ! [[ "$THRESHOLD" =~ ^[0-9]+$ ]]; then
    echo "Error: Threshold must be positive integer."
    exit 1
fi

#------------------------------------------------
# Detect SSH Service Name
#------------------------------------------------
SERVICE=$(systemctl list-unit-files | \
grep -E '^ssh\.service|^sshd\.service' | \
awk '{print $1}' | head -n1)

if [[ -z "${SERVICE:-}" ]]; then
    echo "Error: Could not detect ssh or sshd service."
    exit 1
fi

#------------------------------------------------
# Header Output
#------------------------------------------------
echo "================================================"
echo "SSH Brute-Force Historical Log Analysis (v2)"
echo "Service      : $SERVICE"
echo "Threshold    : $THRESHOLD attempts"
echo "Time Window  : Since \"$TIME_WINDOW\""
echo "Timestamp    : $(date '+%F %T')"
echo "================================================"
echo 

#------------------------------------------------
# Journal Check
#------------------------------------------------
if ! journalctl -u "$SERVICE" --since "$TIME_WINDOW" --no-pager >/dev/null 2>&1; then
    echo "Error reading journal."
    exit 1
fi

#------------------------------------------------
# Parse Logs
#------------------------------------------------

FOUND=0

while read -r count ip
do
    if [[ "$count" -ge "$THRESHOLD" ]]; then
        echo "[ALERT] $(date '+%F %T') | $ip | $count failed attempts"
        FOUND=1
    fi
done < <(
        journalctl -u "$SERVICE" --since "$TIME_WINDOW" --no-pager 2>/dev/null | \
        (grep -oP 'Failed password.*from \K\S+' 2>/dev/null || true) | \
        sort | uniq -c | sort -nr 
)
echo
if [[ "$FOUND" -eq 0 ]]; then
    echo "No brute-force attempts detected."
fi
echo "Analysis Complete."