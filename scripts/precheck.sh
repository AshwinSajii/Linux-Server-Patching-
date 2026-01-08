#!/bin/bash
echo "====PRE-PATCH CHECKS===="
date
hostname
echo

echo "uptime:"
uptime
echo

echo "Disk usage"
df -h
echo

echo "memory usage"
free -h
echo

echo "failed services"
systemctl --failed
