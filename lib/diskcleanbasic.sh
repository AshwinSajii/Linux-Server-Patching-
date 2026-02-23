#!/bin/bash
set -euo pipefail

# --- Root check ---
if [[ $EUID -ne 0 ]]; then
  echo "Please run as root (sudo)"
  exit 1
fi

# --- Capture BEFORE usage in BYTES ---
BEFORE=$(du -sb /var | awk '{print $1}')

echo "==== CACHE & LOG CLEANUP START ===="
date
echo

echo "[1/4] Cleaning APT cache..."
apt clean
apt autoclean
echo

echo "[2/4] Cleaning systemd journals..."
journalctl --disk-usage || true
journalctl --vacuum-time=7d || true
echo

echo "[3/4] Disk usage under /var (Top 20):"
du -xh /var | sort -h | tail -20
echo

echo "==== CLEANUP COMPLETED SUCCESSFULLY ===="
date

# --- Capture AFTER usage in BYTES ---
AFTER=$(du -sb /var | awk '{print $1}')

# --- Calculate freed space ---
FREED=$((BEFORE - AFTER))
if (( FREED < 0 )); then
  FREED=0
fi

# --- Convert to human readable ---
BEFORE_HR=$(numfmt --to=iec "$BEFORE")
AFTER_HR=$(numfmt --to=iec "$AFTER")
FREED_HR=$(numfmt --to=iec "$FREED")

echo
echo "==== DISK USAGE SUMMARY (/var) ===="
echo "Before cleanup: $BEFORE_HR"
echo "After cleanup:  $AFTER_HR"

echo
echo "==== DISK SPACE RECLAIMED ===="
echo "Freed space: $FREED_HR"
