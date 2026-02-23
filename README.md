# PatchMgr - Linux Patch Management Automation Tool

PatchMgr is a modular Linux patch automation utility designed to simulate a structured production patch lifecycle.

It performs pre-check validation, applies updates, validates post-patch system state, and generates structured reports.

This project demonstrates Linux administration, automation workflow design, and operational best practices suitable for L2 Linux Administration roles.

---

## 📌 Features

- Pre-patch system validation
- Disk usage and memory checks
- Failed service detection
- Automated patch application
- Post-patch validation
- Reboot requirement detection
- Structured reporting
- Dry-run simulation mode
- Confirmation safety prompts
- Full patch lifecycle automation (`patchmgr full`)
- Man page integration
- Centralized logging

---

## 🏗 Project Structure

```

Linux-Server-Patching-
├── bin/
│   └── patchmgr
├── lib/
│   ├── precheck.sh
│   ├── patching.sh
│   ├── postcheck.sh
│   ├── report.sh
│   ├── reboot_check.sh
│   ├── service_snapshot_pre.sh
│   └── service_snapshot_post.sh
├── CHANGELOG.md
├── patchmgr.1
├── README.md
└── tests/

```

---

## ⚙️ Installation (Development Mode)

Clone the repository:

```

git clone [https://github.com/AshwinSajii/Linux-Server-Patching-.git](https://github.com/AshwinSajii/Linux-Server-Patching-.git)
cd Linux-Server-Patching-

```

Run locally:

```

sudo ./bin/patchmgr full -y

```

---

## 🖥 System-wide Installation

Install as a system command:

```

sudo mkdir -p /usr/local/lib/patchmgr
sudo cp lib/*.sh /usr/local/lib/patchmgr/
sudo cp bin/patchmgr /usr/local/bin/
sudo chmod +x /usr/local/bin/patchmgr

```

Now run from anywhere:

```

sudo patchmgr full -y

```

---

## 📘 Usage

```

patchmgr precheck
patchmgr apply
patchmgr postcheck
patchmgr report
patchmgr full

```

### Optional Flags

```

-y / --yes      Skip confirmation prompts
--dry-run       Simulate patching without making changes

```

---

## 🔄 Patch Lifecycle Flow

1. Precheck
   - Hostname and uptime verification
   - Disk usage validation
   - Memory availability check
   - Failed services detection

2. Patch Apply
   - Update package index
   - Apply available upgrades
   - Safety confirmation before execution

3. Reboot Detection
   - Check `/var/run/reboot-required`
   - Prompt for reboot if required

4. Postcheck
   - Kernel version validation
   - Service health verification
   - Failure comparison

5. Report Generation
   - Structured patch summary
   - Centralized log storage

---

## 📂 Logging

All logs and reports are stored in:

```

/var/log/patchmgr/

```

Log types include:

- Precheck logs
- Patch execution logs
- Postcheck validation logs
- Patch summary reports

---

## 🛡 Operational Safety Controls

- Root privilege enforcement
- Confirmation prompt before patching
- Dry-run mode for simulation
- Strict error handling (`set -euo pipefail`)
- Structured logging for traceability

---

## 📘 Man Page

After system installation:

```

man patchmgr

```

---

## 🎯 Purpose

This project demonstrates:

- Structured Linux patch management workflow
- Bash scripting best practices
- CLI argument parsing
- Production-style logging
- Operational safety validation
- Change tracking using versioning and changelog

Designed to reflect real-world L2 Linux Administration patch management processes.

---

## 👤 Author

Ashwin Saji
```

---
