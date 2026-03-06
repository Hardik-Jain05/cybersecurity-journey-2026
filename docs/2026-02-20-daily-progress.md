# Daily Progress – 2026-02-20

## Schedule Reality Check

- **Planned**  
  Complete Bandit levels 10–14 (with documentation / notes for each level)  
  Work on remaining user administration topics in RHCSA  
  Solve one C program + one SQL query  
  Work on Bash log parser  
  Update weekly progress + daily progress  
  Sleep goal: 7–7.5 hours

- **Actual work times**  
  09:00–14:00 — college  
  15:00–19:00 — RHCSA (remaining admin topics: sudo wheel group, managing command access for users, /etc/shadow format)  
  ~21:00–23:00 — Bandit levels 10–14 + 15 min for lab report / daily progress

- **Sleep**  
  7.5 hours last night. Felt fresh and active, good focus overall.

## What I Completed

- Bandit levels 10–14: all finished (notes and walkthrough pushed to markdown)  
- RHCSA: completed remaining user administration topics (sudoers, wheel group, command restrictions, /etc/shadow format)  
- Documentation: updated Bandit levels 10–14 lab report  
- Daily progress report: written now  
- Other planned items (C program, SQL query, Bash log parser progress, weekly update): not completed today

## Key Learnings

- Typos and not reading command output carefully enough caused avoidable confusion and re-runs  
- Mistook file extension (.tar instead of .gz) and tried gunzip on a plain tar archive → wrong tool, learned the difference the hard way  
- Linux gives powerful, granular freedom to customize exactly which commands a user or group can run (via sudoers / wheel / command allow-lists) — huge for security hardening

## Struggles / Blockers

- Slowed down the most by Bandit level 12 → 13: many chained decompression steps (tar, gunzip, bzip2 / bz2) made it tedious and error-prone  
- Roughly 2 hours unproductive / wasted (went out — unsure if truly unproductive or just a break)

## Market Tie-In

Levels 10–14 teach encoding/decoding (base64, rot13), basic network client usage (netcat/nc), private key authentication (SSH without password), and layered file compression/archive handling (tar, gzip, bzip2). These are daily tools in real pentest engagements, CTF-style privesc, initial access credential hunting, lateral movement, and analyzing exfiltrated or dropped artifacts during red-team and incident response work.

RHCSA user administration (sudoers configuration, wheel group, command-specific restrictions, /etc/shadow format) directly maps to hardening Linux systems, enforcing least privilege, auditing privileged access, and preventing privilege escalation — core responsibilities for blue-team sysadmins, SOC engineers, and compliance roles in enterprise environments.

## Tomorrow’s Targets

- Finish Bandit levels 15–19  
- Complete RHCSA labs  
- TryHackMe room  
- First mini-project: Bash script to detect/count failed SSH logins in sample log  
- Sleep goal: 7–8 hours

## Proof

- [Bandit levels 10–14 report/notes](/labs/overthewire-bandit/2026-02-20-levels-10-to-14.md)  

![Level 10-->11](/labs/overthewire-bandit/images/2026-02-20-bandit10.png)

![Level 11-->12](/labs/overthewire-bandit/images/2026-02-20-bandit11.png)

![Level 12-->13](/labs/overthewire-bandit/images/2026-02-20-bandit12.png)

![Level 13-->14](/labs/overthewire-bandit/images/2026-02-20-bandit13.1.png)

![Level 13-->14](/labs/overthewire-bandit/images/2026-02-20-bandit13.2.png)

![Level 14-->15](/labs/overthewire-bandit/images/2026-02-20-bandit14.png)