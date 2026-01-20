#!/bin/bash

LOGDIR=logs
mkdir -p $LOGDIR

echo "Collecting running services BEFORE patching..."
systemctl list-units --type=service --state=running > $LOGDIR/services_before.txt

echo "Service snapshot (pre-patch) saved."
