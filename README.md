# Linux Server Patching Automation (PatchMgr)

PatchMgr is a Linux patch management project that automates server updates using both **Bash scripting** and **Ansible automation**.

The project demonstrates how Linux administrators can perform **system patching, kernel updates, and automated reboot handling** across servers.

This repository combines **CLI-based patching tools** and **infrastructure automation with Ansible** to simulate real-world Linux maintenance workflows.

---

## Features

* Automated Linux system patching
* Kernel update detection
* Conditional reboot handling
* Ansible-based infrastructure automation
* Patch execution audit capability
* Modular project structure

---

## Technologies Used

* Linux (RHEL / CentOS / Rocky Linux)
* Bash scripting
* Ansible
* DNF package manager
* System administration tools

---

## Project Structure

```
Linux-Server-Patching
├── ansible/        # Ansible automation for patching multiple servers
│   ├── inventory
│   └── patch.yml
│
├── scripts/        # PatchMgr CLI patching tool
│   └── patchmgr
│
├── docs/           # Patch management documentation
│   └── linuxpatchsop-v1.pdf
│
├── man/            # Manual page for PatchMgr
│   └── patchmgr.1
│
├── lib/            # Supporting libraries for PatchMgr
│
├── CHANGELOG.md
└── README.md
```

---

## PatchMgr CLI Usage

Run the patching tool locally:

```
./scripts/patchmgr
```

The tool performs:

1. System update using the DNF package manager
2. Kernel update handling
3. Patch installation monitoring
4. Optional reboot after patching

---

## Ansible Automation

Ansible automation allows patching **multiple Linux servers simultaneously**.

### Run the Playbook

```
ansible-playbook -i ansible/inventory ansible/patch.yml -K
```

`-K` prompts for the sudo password required for privileged operations.

---

## Ansible Workflow

The playbook performs the following steps:

1. Gather system facts
2. Update package metadata
3. Apply available patches
4. Detect if a reboot is required
5. Reboot the server automatically if necessary

---

## Example Output

```
PLAY RECAP
localhost : ok=4 changed=0 failed=0 skipped=1
```

This indicates the system was already fully patched and no reboot was required.

---

## Use Cases

This project demonstrates patch automation for:

* Linux system administration
* Infrastructure automation
* DevOps environments
* Enterprise patch maintenance workflows

---

## Learning Objectives

This project helps demonstrate hands-on experience with:

* Linux patch management
* Configuration management using Ansible
* Automation of administrative tasks
* Infrastructure maintenance practices

---

## Author

Ashwin Saji
System Administrator | Linux | VMware | Automation
