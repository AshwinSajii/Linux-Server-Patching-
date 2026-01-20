#!/bin/bash

echo "====POST CHECK===="

echo ""
echo "kernel"
uname -r

echo ""
echo "uptime"
uptime

echo ""
echo "==== FAILED SERVICES (POST-PATCH ANALYSIS) ===="

# Extract FAILED service names correctly (column 2)
FAILED_NOW=$(systemctl list-units --state=failed --no-legend | awk '{print $2}')
KNOWN_FILE="scripts/known_failed_services.txt"

if [ -f "$KNOWN_FILE" ]; then
    NEW_FAILURES=$(comm -23 \
        <(echo "$FAILED_NOW" | sort) \
        <(sort "$KNOWN_FILE"))
else
    NEW_FAILURES="$FAILED_NOW"
fi

if [ -z "$NEW_FAILURES" ]; then
    echo "✅ No NEW service failures detected after patching."
else
    echo "❌ NEW service failures detected:"
    echo "$NEW_FAILURES"
fi

echo ""
echo "critical logs"
journalctl -p err -xb --no-pager | tail -n 20
