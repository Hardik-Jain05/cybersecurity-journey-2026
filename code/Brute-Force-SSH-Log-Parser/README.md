# SSH Brute-Force Log Parser

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](../../LICENSE)
[![Language: Bash](https://img.shields.io/badge/language-bash-blue.svg)](https://www.gnu.org/software/bash/)
[![Version: v2](https://img.shields.io/badge/version-v2-brightgreen.svg)]

**Lightweight, production-ready Bash detection tool** that parses systemd journal logs (or `/var/log/auth.log` fallback) to detect SSH brute-force attacks.

Flags source IPs exceeding a configurable threshold of failed login attempts.

**Directly implements detection logic for MITRE ATT&CK T1110 (Brute Force)** — one of the most common Initial Access techniques used by ransomware groups, bots, and credential-stuffing campaigns in 2026.

---

## Versions

- **v1** — Original historical + basic live mode (kept for reference)
- **v2 (Current — Recommended)** — Historical mode only:
  - Strict error handling (`set -euo pipefail`)
  - Input validation on threshold
  - Dynamic service detection (`ssh.service` vs `sshd.service`)
  - Time-window support via `journalctl --since`
  - Cleaner, timestamped, SOC-ready output
  - Ready for ticket handoff

> Live mode still on v1 (upgrade to v2 live coming next).

---

## SOC / Blue Team Tie-in :-

It simulates real SIEM rule logic:

- Maps to **T1110.001** (Password Guessing)
- Maps to **T1110.003** (Password Spraying)
- Demonstrates threshold-based detection engineering
- Output format is SOC ticket-ready (TheHive / Splunk style)
- Shows progression: one-liner → validated, versioned tool with documentation

---

## Usage

### Make scripts executable

```bash
chmod +x Brute-Force-Log-Parser*.sh
```

---

## Historical Mode (v2 — Recommended)

### Default: ≥5 attempts in last 24 hours

```bash
sudo ./Brute-Force-Log-Parser-v2.sh
```

### Custom threshold + time window

```bash
sudo ./Brute-Force-Log-Parser-v2.sh 10 "3 days ago"
```

### Pipe to report / Slack / ticket

```bash
sudo ./Brute-Force-Log-Parser-v2.sh 8 "1 week ago" | tee brute-report-$(date +%F).txt
```

---

## Example v2 Output

```
================================================
SSH Brute-Force Historical Log Analysis (v2)
Service      : sshd.service
Threshold    : 8 attempts
Time Window  : Since "1 week ago"
Timestamp    : 2026-03-01 23:45:12
================================================

[ALERT] 2026-03-01 23:45:12 | 10.240.87.85 | 87 failed attempts

Analysis Complete.
```

---

## Live Mode (v1)

```bash
sudo ./Brute-Force-Log-Parser-Live.sh 5
```

Press `Ctrl+C` to stop.

---

## Screenshots

### v2 Historical Alert
- #### Default: ≥5 attempts in last 24 hours

![Default](/code/Brute-Force-SSH-Log-Parser/Screenshots/Default-Output-Brute-Force-Log-Parser-v2.png)

- #### Custom threshold + time window

![Custom](/code/Brute-Force-SSH-Log-Parser/Screenshots/Custom-Output-Brute-Force-Log-Parser-v2.png)

- #### Pipe to report / Slack / ticket

![Pipe to report](/code/Brute-Force-SSH-Log-Parser/Screenshots/Pipe-to-report-Output-Brute-Force-Log-Parser-v2.png)


### Live Detection Trigger
<img src="Screenshots/live-alert.png?raw=true" alt="Live Alert">



---

## Test Data

**Auth.log.sample** — Synthetic log with 87+ failed attempts from `10.240.87.85`  
→ [View sample](/code/Brute-Force-SSH-Log-Parser/Auth.log.samplecode)

### Tested Against

- Manual repeated SSH failures
- Hydra (lab only)
- Medusa (lab only)

---

## Limitations & Known Issues

- Depends on standard OpenSSH `"Failed password"` log format (locale-sensitive)
- No JSON output yet (planned for v3)
- Live mode can flood console under heavy load
- Detection-only (no auto-blocking — correct scope)
- Requires root or journal read permissions

---

## Future Plans

- v2 Live mode with proper tailing + JSON output
- Full Python rewrite (argparse + pandas + pytest)
- Sigma rule auto-generation from detected patterns
- Email/Slack alert stub
- Containerized version (Dockerfile)

---

## License

[MIT](/LICENSE)

---

Built as part of **#cybersecurity-journey-2026** — daily blue-team skill building.

Feedback, issues, or PRs are welcome!