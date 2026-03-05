# PatchMgr — Linux Server Patching Automation

PatchMgr is a modular Linux patch lifecycle automation tool designed for Red Hat–based systems.
It automates the full patch workflow including **pre-patch health checks, package updates, reboot detection, post-patch validation, and reporting**.

The project also includes **Ansible automation** to demonstrate patch management across multiple servers.

---

## Features

* Automated Linux patch installation using `dnf`
* Pre-patch system health checks (disk, memory, uptime, failed services)
* Post-patch validation
* Kernel update detection
* Conditional reboot detection
* Patch execution reporting
* Modular Bash architecture
* Ansible playbook for multi-server patch automation

---

## Tech Stack

* Linux (RHEL / Rocky / AlmaLinux compatible)
* Bash scripting
* Ansible
* DNF package manager
* systemd service monitoring

---

## Project Structure

```
Linux-Server-Patching
│
├── scripts/
│   └── patchmgr            # Main CLI patching tool
│
├── lib/
│   ├── precheck.sh         # Pre-patch health checks
│   ├── patching.sh         # Patch execution
│   ├── postcheck.sh        # Post-patch validation
│   └── report.sh           # Patch report generation
│
├── ansible/
│   ├── inventory           # Target server list
│   └── patch.yml           # Ansible patch playbook
│
├── docs/
│   └── linuxpatchsop-v1.pdf
│
├── man/
│   └── patchmgr.1
│
├── CHANGELOG.md
└── README.md
```

---

## PatchMgr CLI Usage

Run the patch tool:

```
sudo ./scripts/patchmgr <command>
```

### Available Commands

```
patchmgr precheck
patchmgr apply
patchmgr postcheck
patchmgr report
patchmgr full
```

### Example

Run the full patch lifecycle:

```
sudo ./scripts/patchmgr full
```

This performs:

1. Pre-patch health checks
2. Package updates
3. Reboot requirement detection
4. Post-patch validation
5. Patch report generation

---

## Example Output

```
==== PRE-PATCH CHECKS ====
Hostname: server01
Disk Usage: 21%
Memory Usage: 5.5 GiB

==== PATCH EXECUTION ====
Applying system updates...

==== POST CHECK ====
Kernel: 6.x.x
No reboot required

==== PATCH SUMMARY REPORT ====
Report saved at:
/var/log/patchmgr/patch_report_<date>.txt
```

---

## Patch Reports

PatchMgr automatically generates a report after each run:

```
/var/log/patchmgr/patch_report_<timestamp>.txt
```

Reports contain:

* system details
* kernel version
* uptime
* failed services
* patch execution summary

---

## Ansible Automation

Ansible support demonstrates patching **multiple Linux servers simultaneously**.

### Inventory Example

```
[linux_servers]
localhost ansible_connection=local
```

### Run the Playbook

```
ansible-playbook -i ansible/inventory ansible/patch.yml -K
```

`-K` prompts for the sudo password required for privileged tasks.

---

## Learning Goals

This project demonstrates practical skills in:

* Linux system administration
* Patch management automation
* Infrastructure automation
* Bash scripting
* Ansible configuration management

---

## Version

PatchMgr v2.1

Includes:

* full patch lifecycle automation
* reporting
* Ansible integration

---

## Author

Ashwin Saji
System Administrator | Linux | VMware | Automation
