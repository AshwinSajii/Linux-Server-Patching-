# Linux Server Patching – Production Style (End-to-End Guide)

Author: Ashwin  
Scope: Linux Admin / Cloud Ops / SRE  
OS Focus: Ubuntu / Debian based systems (apt)

==================================================
SECTION 1: WHAT IS SERVER PATCHING
==================================================

Server patching is the controlled process of applying vendor-provided
security patches, bug fixes, and stability updates to a Linux system
with minimal risk and controlled downtime.

Server patching INCLUDES:
- Security updates
- OS package updates
- Library updates (openssl, libc, etc.)
- Kernel updates (when approved)
- Service restarts
- System reboot (if required)

Server patching DOES NOT INCLUDE:
- OS version upgrades
- Feature upgrades without approval
- Blind updates without validation

==================================================
SECTION 2: PRE-PATCHING CHECKS (MANDATORY)
==================================================

2.1 Identify system and environment

cat /etc/os-release
uname -r
uptime
hostname

Questions to answer:
- OS and version?
- Current kernel?
- Uptime?
- PROD / UAT / DEV?

--------------------------------------------------

2.2 Disk space checks (MOST COMMON FAILURE CAUSE)

df -h

Minimum safe values:
- /        → 2–5 GB free
- /var     → 1–2 GB free
- /boot    → 300–500 MB free

DO NOT PATCH IF:
- Any filesystem is >90% full
- /boot is almost full

--------------------------------------------------

2.3 Memory and swap check

free -h
swapon --show

Minimum safe values:
- ≥500 MB free RAM
- Swap enabled (any size)

--------------------------------------------------

2.4 Check existing failed services BEFORE patching

systemctl --failed

If critical services are failed → STOP and fix first.

==================================================
SECTION 3: CHECK AVAILABLE UPDATES (NO INSTALL YET)
==================================================

Update package metadata:

sudo apt update

List upgradable packages:

apt list --upgradable

Check if kernel updates are pending:

apt list --upgradable | grep linux-image

==================================================
SECTION 4: DECIDE WHAT TO PATCH
==================================================

Package risk classification:

LOW RISK (safe anytime):
- curl, wget, bash, sudo, ca-certificates
- most lib* packages

MEDIUM RISK (monitor closely):
- systemd
- dbus
- network-manager
- openssh-server

HIGH RISK (planned window only):
- linux-image*
- linux-headers*
- nvidia drivers
- database engines (mysql, postgres)

==================================================
SECTION 5: APPLY PATCHES (CONTROLLED)
==================================================

Apply standard patches (no OS upgrade):

sudo apt upgrade

If prompted:
- Config file changes → keep local version
- Service restart → YES

If kernel updates are NOT approved, hold them:

sudo apt-mark hold linux-image-generic

Verify held packages:

apt-mark showhold

==================================================
SECTION 6: HANDLE FAILED UPGRADES
==================================================

If upgrade fails, NEVER reboot immediately.

Fix broken dependencies:

sudo apt --fix-broken install

Reconfigure partially installed packages:

sudo dpkg --configure -a

Clean package cache:

sudo apt clean
sudo apt autoremove

Retry upgrade:

sudo apt upgrade

==================================================
SECTION 7: REBOOT DECISION
==================================================

Check if reboot is required:

ls /var/run/reboot-required

OR check kernel mismatch:

uname -r
apt list --installed | grep linux-image

Reboot ONLY if:
- Kernel updated
- libc updated
- Vendor advisory requires reboot

Reboot command:

sudo reboot

==================================================
SECTION 8: POST-PATCH VALIDATION (CRITICAL)
==================================================

After reboot or patch completion:

Check kernel:

uname -r

Check uptime:

uptime

Check failed services:

systemctl --failed

Check logs for critical errors:

journalctl -p 3 -xb

==================================================
SECTION 9: DISK SPACE CLEANUP (SCOM ALERTS)
==================================================

Identify large directories:

du -xh / --max-depth=1 | sort -h
du -xh /var --max-depth=1 | sort -h

Check log usage:

du -sh /var/log/*
journalctl --disk-usage

Clean old journal logs:

sudo journalctl --vacuum-time=7d

Clean apt cache:

sudo apt clean
sudo apt autoclean
sudo apt autoremove

Clean old rotated logs (SAFE):

sudo rm -f /var/log/*.gz
sudo rm -f /var/log/*.[0-9]

==================================================
SECTION 10: PRODUCTION DOs AND DON’Ts
==================================================

DO:
- Patch during maintenance windows
- Take snapshot/backup before kernel updates
- Validate services after patching
- Document actions and findings

DON’T:
- Blindly run apt full-upgrade
- Patch during peak business hours
- Delete application data without approval
- Reboot during active upgrades

==================================================
SECTION 11: INTERVIEW-READY SUMMARY
==================================================

"I follow a controlled Linux patching workflow that includes
pre-patch system health checks, selective package upgrades,
kernel patch planning, post-patch service validation,
and rollback preparedness."

==================================================
END OF DOCUMENT
==================================================
