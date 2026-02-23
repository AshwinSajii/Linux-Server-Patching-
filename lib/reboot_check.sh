#!/bin/bash

LOGDIR=logs
mkdir -p $LOGDIR

if [ -f /var/run/reboot-required ]; then
  echo "Reboot REQUIRED after patching" | tee $LOGDIR/reboot_status.txt
else
  echo "Reboot NOT required after patching" | tee $LOGDIR/reboot_status.txt
fi
