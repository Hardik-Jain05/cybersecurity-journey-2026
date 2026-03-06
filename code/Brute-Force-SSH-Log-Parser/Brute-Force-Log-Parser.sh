#!/bin/bash
THRESHOLD="${1:-5}"

echo "Checking SSH brute-force attempts from journal..."
echo "Threshold set to $THRESHOLD attempts"
echo "__________________________________________________"

sudo journalctl -u ssh --no-pager | \
grep "Failed password" | \
awk '
{
        for(i=1;i<= NF;i++)
                if ($i=="from")
                        print $(i+1)
}' | \
sort | uniq -c | sort -nr | \
while read count ip
do 
        if [ "$count" -ge "$THRESHOLD" ]; then
           echo "!! Possible brute-force attack from $ip ($count attempts)"
        fi
done