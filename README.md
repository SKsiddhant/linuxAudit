# OSS Audit Project — Linux Kernel

## Student Details

| Field | Value |
|---|---|
| Name | Siddhant Kothiya |
| Roll Number | 24bce10109 |
| Course | Open Source Software (OSS NGMC) |
| Repository | oss-audit-24bce10109 |

## Chosen Software

**Linux Kernel** — Licensed under GNU General Public License v2 (GPL v2)

The Linux Kernel is the open-source operating system kernel that powers everything from Android phones to supercomputers. Created by Linus Torvalds in 1991 as a free Unix-like system, it is maintained by thousands of contributors worldwide and forms the foundation that all other open-source software in this project runs on.

---

## Scripts Description

### Script 1 — System Identity Report (`script1_system_identity.sh`)
Displays a formatted welcome screen with key Linux system information including the distribution name, kernel version, logged-in user, home directory, system uptime, and current date/time. Also prints the GPL v2 license that covers the OS.
**Concepts used:** variables, `echo`, command substitution `$()`, output formatting, reading `/etc/os-release`.

### Script 2 — FOSS Package Inspector (`script2_package_inspector.sh`)
Checks whether a specified package is installed on the system using `dpkg`, extracts its version and description using `dpkg-query`, and uses a `case` statement to print a philosophy note about well-known open-source packages including the Linux Kernel.
**Concepts used:** `if-then-else`, `case` statement, `dpkg`/`dpkg-query`, pipe with `grep`, command-line arguments (`$1`).

### Script 3 — Disk and Permission Auditor (`script3_disk_auditor.sh`)
Loops through a list of important system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`) and reports each directory's permissions, owner, group, and disk usage. Also specifically audits the Linux Kernel's `/boot` directory and lists installed kernel images.
**Concepts used:** `for` loop, arrays, `du -sh`, `ls -ld`, `awk`, `cut`, `if-then-else`.

### Script 4 — Log File Analyzer (`script4_log_analyzer.sh`)
Reads a log file line by line, counts how many lines contain a given keyword (default: `error`), includes a retry loop if the file is empty, and prints the last 5 matching lines.
**Concepts used:** `while read` loop, `if-then`, counter variables, command-line arguments (`$1`, `$2`), `tail` + `grep`, do-while style retry logic.

### Script 5 — Open Source Manifesto Generator (`script5_manifesto_generator.sh`)
Interactively asks the user three questions and composes a personalised open-source philosophy statement, saving it to a `.txt` file named after the current user.
**Concepts used:** `read` for user input, string concatenation, writing to a file with `>` and `>>`, `date` command, alias concept demonstrated via comment.

---

## How to Run

### Prerequisites
- Linux OS (Ubuntu/Debian recommended)
- Bash shell (pre-installed on all Linux systems)

### Setup — make all scripts executable
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

### Script 1 — System Identity Report
```bash
./script1_system_identity.sh
```

### Script 2 — FOSS Package Inspector
```bash
# Check the Linux kernel image (auto-detects installed version)
./script2_package_inspector.sh

# Or check a specific package by name
./script2_package_inspector.sh apache2
./script2_package_inspector.sh git
./script2_package_inspector.sh python3
```

### Script 3 — Disk and Permission Auditor
```bash
./script3_disk_auditor.sh
```

### Script 4 — Log File Analyzer
```bash
# Search for 'error' in syslog (default keyword)
./script4_log_analyzer.sh /var/log/syslog

# Search for a custom keyword
./script4_log_analyzer.sh /var/log/syslog warning

# Search kern.log for kernel-related messages
./script4_log_analyzer.sh /var/log/kern.log kernel
```

### Script 5 — Open Source Manifesto Generator
```bash
./script5_manifesto_generator.sh
# The script will prompt you with 3 questions interactively.
# Output is saved to: manifesto_<yourusername>.txt
```

---

## Dependencies

| Dependency | Purpose |
|---|---|
| Linux OS (Ubuntu/Debian) | Runtime environment |
| Bash shell | Script interpreter |
| `dpkg` / `dpkg-query` | Package inspection (Script 2) |
| `du`, `ls`, `awk`, `cut` | Disk & permission reporting (Script 3) |
| `grep`, `tail` | Log file analysis (Script 4) |
| `date`, `whoami` | System info & file naming (Scripts 1, 5) |

All dependencies are pre-installed on a standard Ubuntu/Debian system — no additional installation required.
