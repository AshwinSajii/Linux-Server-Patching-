# Changelog

All notable changes to PatchMgr will be documented in this file.

---

## [2.1.0] - 2026-02-23

### Added
- Proper argument parsing with support for:
  - `--dry-run`
  - `-y / --yes`
- Auto reboot detection
- Confirmation prompt before patching
- Full patch lifecycle mode (`patchmgr full`)
- Color-coded console output
- Man page integration

### Improved
- Centralized logging to `/var/log/patchmgr`
- Strict error handling using `set -euo pipefail`
- Structured command handling
- System-wide installation layout

### Fixed
- Library path resolution issue when installed system-wide
- Flag parsing bug for `--dry-run`

---

## [2.0.0] - 2026-02-23

### Added
- Modular CLI structure
- Precheck, apply, postcheck, report commands
- Logging system
- Root permission enforcement

---

## [1.0.0] - 2026-02-22

### Initial Release
- Basic patching script
- Manual execution model
- Basic service validation
## [v2.0] – 2026-01-20

### Added
- Service state snapshot before and after patching to detect real service impact
- Graceful handling of known pre-existing failed services
- Detection and reporting of **new service failures only**
- Reboot requirement validation after patching
- Post-patch report generation for audit and change evidence

### Improved
- Post-patch validation accuracy
- Noise reduction in failed service reporting
- Overall patching workflow aligned with enterprise practices

---

## [v1.1] – 2026-01-13

### Added
- SOP-aligned patching workflow
- Disk remediation and cleanup steps
- Improved pre-check and post-check structure

---

## [v1.0] – 2026-01-06

### Added
- Initial Linux server patching scripts
- Basic pre-patch and post-patch checks
- Manual patch execution workflow

