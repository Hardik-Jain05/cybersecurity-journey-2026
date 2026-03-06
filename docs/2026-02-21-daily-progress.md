# Daily Progress – 2026-02-21

## Schedule Reality Check
- **Planned**: Finish Bandit levels 15–19, complete RHCSA labs, TryHackMe room, build first mini-project (Bash script to detect/count failed SSH logins in sample log)  
- **Actual work times**:  
  - ~12:00–16:00 → RHCSA revision and practice  
  - ~16:00–20:00 → log parser development  
  - ~21:00–00:00 → updates, testing and report on log parser  
- **Sleep**: ~7.5 hours (night of Feb 20 → morning of Feb 21) — morning block had noticeably lower focus, contributed to wasted time

## What I Completed
- Bandit levels: none finished  
- RHCSA: revision and practice only (no labs completed)  
- TryHackMe: none  
- Bash script (failed SSH logins / log parser): completed, tested (historical + live modes), pushed to repo with report  
- Other: wrote report/documentation for the parser

## Key Learnings
1. Time estimation for scripting/debugging is almost always optimistic — what I thought would take 2–3 hours (log parser + testing + report) stretched into 4–5 hours because of edge cases in log formats and small syntax mistakes that only showed up during real testing.  
2. Skipping Bandit / TryHackMe entirely when the day already feels full leads to zero progress on variety — focusing only on one big task (the parser) felt productive in the moment, but left other skill areas completely untouched and created a false sense of "good day".  
3. Starting work at 12:00 after sleeping only 7.5 hours meant the first 1–2 hours of RHCSA revision had noticeably lower focus — I probably would have retained more if I had started earlier or protected the morning block better.

## Struggles / Blockers
- Log parser testing took significantly longer than expected; output is functional but still not perfect and can be improved further (edge cases, formatting robustness)  
- Morning block (RHCSA revision) largely wasted → derailed the rest of the schedule and reduced overall momentum

## Market Tie-In
The bash script to detect and count failed SSH login attempts directly mirrors entry-level blue team / SOC analyst tasks: parsing auth logs (e.g. /var/log/secure or /var/log/auth.log) to identify brute-force attempts, credential stuffing, or scanning activity.  
In real environments this kind of script becomes part of:  
- Early-stage SIEM rule prototyping or custom log monitoring before full Splunk/ELK/QRadar deployment  
- Incident response triage (quickly quantifying "how many failed logins from this IP in the last 24h?")  
- Automated alerting in small-to-medium orgs or homelabs that can't afford commercial tools yet  
- Red team / pentest reporting (demonstrating weak lockout policies by showing volume of failed attempts during an engagement)  

Even though it's a simple parser, the core skill—extracting signal from noisy logs—is used daily by junior SecOps / sysadmin roles when investigating alerts, writing first-response playbooks, or hardening SSH configs after an incident.

## Tomorrow’s Targets (2026-02-22)
- Reflect on this week: review and go through lab reports from this week  
- Complete Bandit levels 15–19  
- Sleep goal: 7–7.5 hours

## Proof
- [SSH Brute-Force Log Parser project](/code/Brute-Force-SSH-Log-Parser/)  
  - [Historical mode](/code/Brute-Force-SSH-Log-Parser/Brute-Force-Log-Parser.sh)  
  - [Live mode](/code/Brute-Force-SSH-Log-Parser/Brute-Force-Log-Parser-Live.sh)  
  - Screenshots:  
    - Successful historical detection:
    ![Brute-Force-Log-Parser-Output.png](/code/Brute-Force-SSH-Log-Parser/Screenshots/Brute-Force-Log-Parser-Output.png)  


    - Live detection triggered: ![live-alert.png](/code/Brute-Force-SSH-Log-Parser/Screenshots/live-alert.png)  
  - Sample test log: [auth.log.sample](/code/Brute-Force-SSH-Log-Parser/Auth.log.sample)