# Linux Server Manual Patching – Project

## Project Definition
This project demonstrates **manual Linux server patching** using a **production-style approach**.  
It follows real enterprise practices such as **pre-checks, disk remediation, controlled patching, post-validation, and logging**.

A detailed **Standard Operating Procedure (SOP)** is maintained separately.  
This repository focuses on **structure, execution artifacts, and evidence**.

---

## Project Structure

linux-server-patching/
├── scripts/
│ ├── diskcleanbasic.sh # Pre-patch disk cleanup & space validation
│ ├── precheck.sh # Pre-patching health checks
│ ├── patching.sh # Manual patch execution
│ └── postcheck.sh # Post-patching validation
│
├── logs/
│ ├── precheck.log # Pre-check output logs
│ └── postcheck.log # Post-check output logs
│
├── screenshots/ # Execution evidence & screenshots
└── README.md


---

## Workflow Overview

1. **Disk Cleanup & Space Validation**
   - Safely cleans APT cache and systemd journal logs
   - Captures `/var` disk usage before and after cleanup
   - Calculates reclaimed disk space for audit visibility

2. **Pre-Patching Checks**
   - Disk space, memory, OS version, uptime validation
   - Ensures system readiness before patching

3. **Manual Patch Execution**
   - Controlled package updates using native package manager
   - No automation tools used (enterprise manual change model)

4. **Post-Patching Validation**
   - Confirms system health after patching
   - Verifies no pending updates
   - Captures execution evidence

---

## Summary
- Mirrors **real-world Linux server patching**
- Manual patching (no automation tools)
- Production-style validation & logging
- SOP-driven execution
- Version-controlled operational scripts
