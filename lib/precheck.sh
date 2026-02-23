#!/bin/bash

set -euo pipefail

# Ensure LOG_DIR exists (comes from patchmgr)
LOG_FILE="$LOG_DIR/precheck_$(date +%F_%H%M).log"

# Logger function
log() {
    LEVEL=$1
    MESSAGE=$2
    echo "$(date '+%Y-%m-%d %H:%M:%S') [$LEVEL] $MESSAGE" | tee -a "$LOG_FILE"
}

log INFO "==== PRE-PATCH CHECKS STARTED ===="

log INFO "Hostname: $(hostname)"
log INFO "Date: $(date)"

echo
log INFO "Uptime:"
uptime | tee -a "$LOG_FILE"
echo

log INFO "Disk Usage:"
df -h | tee -a "$LOG_FILE"
echo

log INFO "Memory Usage:"
free -h | tee -a "$LOG_FILE"
echo

log INFO "Failed Services:"
systemctl --failed | tee -a "$LOG_FILE"
echo

log INFO "==== PRE-PATCH CHECKS COMPLETED ===="
