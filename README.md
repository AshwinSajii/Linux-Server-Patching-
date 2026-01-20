# Linux Server Patching Framework (v2)

## Overview
This project demonstrates a **production-style Linux server patching workflow**
using shell scripts.  
It focuses on **safe patching**, **impact analysis**, and **post-patch validation**
rather than simply running package updates.

The framework is designed to closely simulate how patching is performed
in real enterprise Linux environments.

---

## Key Features (v2)

### Pre-Patch Validation
- Server uptime and hostname verification
- Disk usage and memory availability checks
- Detection of pre-existing failed services (baseline)

### Controlled Patch Execution
- OS package update and upgrade
- Secure handling of repositories
- No forced service restarts during patching

### Service State Snapshot
- Captures running services **before** patching
- Captures running services **after** patching
- Compares both states to detect real service impact

### Graceful Handling of Known Failed Services
- Known failed services are explicitly defined
- Pre-existing failures are excluded from validation
- Only **new failures introduced by patching** are reported

### Reboot Requirement Detection
- Detects whether a reboot is required after patching
- Prevents unnecessary downtime

### Post-Patch Validation
- Kernel version verification
- Uptime verification
- Critical system log scan
- Service failure impact analysis

### Patch Report Generation
- Timestamped patch report
- Disk usage summary
- Reboot requirement status
- Service impact summary
- Suitable for change ticket evidence

---

## Directory Structure

Linux-Server-Patching-/
├── scripts/
│   ├── precheck.sh
│   ├── patching.sh
│   ├── service_snapshot_pre.sh
│   ├── reboot_check.sh
│   ├── service_snapshot_post.sh
│   ├── report.sh
│   ├── postcheck.sh
│   └── known_failed_services.txt
├── logs/
│   ├── services_before.txt
│   ├── services_after.txt
│   ├── service_diff.txt
│   ├── reboot_status.txt
│   └── patch_report_YYYY-MM-DD_HHMM.txt
└── README.md

---

## Execution Flow

Run the scripts in the following order:

./scripts/precheck.sh  
./scripts/service_snapshot_pre.sh  
./scripts/patching.sh  
./scripts/reboot_check.sh  
./scripts/service_snapshot_post.sh  
./scripts/report.sh  
./scripts/postcheck.sh  

---

## Known Failed Services Handling

Pre-existing failed services are listed in:

scripts/known_failed_services.txt

These services are excluded from post-patch validation so that
only **newly introduced failures** are reported.

---

## Learning Outcomes

This project demonstrates:
- Safe Linux server patching practices
- Change impact analysis
- Reboot decision logic
- Service health validation
- Enterprise-style documentation and reporting

---

## Version History

v1 – Basic patching with pre and post checks  
v2 – Service impact analysis, graceful failure handling, reporting

---

## Disclaimer
This project is intended for learning and demonstration purposes
and should be adapted before use in production environments.
