#!/bin/bash

LOGDIR=logs
REPORT=$LOGDIR/patch_report_$(date +%F_%H%M).txt

echo "Linux Server Patch Report" > $REPORT
echo "=========================" >> $REPORT
echo "Hostname: $(hostname)" >> $REPORT
echo "Date: $(date)" >> $REPORT
echo "" >> $REPORT

echo "Kernel Version:" >> $REPORT
uname -r >> $REPORT
echo "" >> $REPORT

echo "Disk Usage:" >> $REPORT
df -h >> $REPORT
echo "" >> $REPORT

echo "Reboot Status:" >> $REPORT
cat $LOGDIR/reboot_status.txt >> $REPORT
echo "" >> $REPORT

echo "Service Changes (if any):" >> $REPORT
cat $LOGDIR/service_diff.txt >> $REPORT

echo "" >> $REPORT
echo "Patch report generated successfully."
