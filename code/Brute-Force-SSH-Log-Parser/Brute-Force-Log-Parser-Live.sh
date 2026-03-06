#!/bin/bash

THRESHOLD="${1:-5}"

echo "Monitoring Possible SSH brute-force attempts (live)..."
echo "Threshold set to $THRESHOLD attempts"
echo "Press CTRL+C to STOP!"
echo "__________________________________________________"

declare -A ATTEMPTS
declare -A ALERTED

while read line
do
    if [[ "$line" == *"Failed password"* ]]; then

        # Extract IP safely using regex
        ip=$(echo "$line" | grep -oP 'from \K[0-9.]+')

        if [[ -n "$ip" ]]; then
            ((ATTEMPTS["$ip"]++))

            if [[ ${ATTEMPTS[$ip]} -ge $THRESHOLD && -z ${ALERTED[$ip]} ]]; then
                echo "!! Possible brute-force attack from $ip (${ATTEMPTS[$ip]} attempts)"
                ALERTED["$ip"]=1
            fi
        fi
    fi

done < <(sudo journalctl -u ssh -n 0 -f --no-pager)