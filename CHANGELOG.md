# Changelog

All notable changes to this project are documented in this file.

---

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

