#!/bin/bash

set -euo pipefail

REPORT_FILE="$LOG_DIR/patch_report_$(date +%F_%H%M).txt"

echo "==== PATCH SUMMARY REPORT ====" | tee "$REPORT_FILE"
echo "Hostname: $(hostname)" | tee -a "$REPORT_FILE"
echo "Date: $(date)" | tee -a "$REPORT_FILE"
echo | tee -a "$REPORT_FILE"

echo "---- Kernel Version ----" | tee -a "$REPORT_FILE"
uname -r | tee -a "$REPORT_FILE"
echo | tee -a "$REPORT_FILE"

echo "---- Uptime ----" | tee -a "$REPORT_FILE"
uptime | tee -a "$REPORT_FILE"
echo | tee -a "$REPORT_FILE"

echo "---- Failed Services ----" | tee -a "$REPORT_FILE"
systemctl --failed | tee -a "$REPORT_FILE"
echo | tee -a "$REPORT_FILE"

echo "Report saved at: $REPORT_FILE"
