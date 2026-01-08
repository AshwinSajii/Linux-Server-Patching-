#1/bin/bash
echo "====POST CHECK===="
echo "kernal"
uname -r
echo

echo "uptime"
uptime
echo

echo "failed services"
systemctl --failed
echo

echo "critical logs"
journalctl -p 3 -xb --no-pager | head -20

