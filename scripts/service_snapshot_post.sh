#!/bin/bash

LOGDIR=logs
mkdir -p $LOGDIR

echo "Collecting running services AFTER patching..."
systemctl list-units --type=service --state=running > $LOGDIR/services_after.txt

echo "Comparing pre and post patch services..."
diff $LOGDIR/services_before.txt $LOGDIR/services_after.txt > $LOGDIR/service_diff.txt

echo "Service comparison completed."
