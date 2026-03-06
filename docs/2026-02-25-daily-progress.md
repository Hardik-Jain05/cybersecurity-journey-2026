# Daily Progress – 2025-02-25

## Schedule Reality Check
**Planned:**  
- Finish Bandit levels 23–27 (at minimum reach 23–25).  
- Hands-on review/practice of SUID/SGID + sticky bit use-cases (RHCSA-style or OverTheWire).  
- Sleep goal: 7.5–8 hours.

**Actual:**  
- RHCSA lab + study 8:30–11:30 (networking basics: IP/subnets, nmcli commands, adding virtual WiFi adapter) + lab report.  
- Bandit: redid level 22, completed level 23 (detailed report written).  
- No SUID/SGID/sticky bit practice done.

**Sleep hours + focus impact:**  
5 hours — felt tired after RHCSA, no energy, still pushed through level 22 and 23.

## What I Completed
- **Bandit levels:** Finished level 22 (redo after variable oversight) and level 23. Did not attempt level 24.  
- **Other tasks:** RHCSA networking basics (IP addressing, subnets, nmcli usage, virtual WiFi adapter config) + lab session/report.  
- **Code/scripts:** No new scripts authored; created small test.sh for level 23 exploit and analyzed cronjob scripts.  
- **Documentation:** Full markdown report for Bandit levels 22→23 (commands, debug/errors, screenshots, SOC relevance, lessons) saved as `2026-02-25-levels-22-to-23.md` in `/labs/overthewire-bandit/`.

## Key Learnings
- Always verify variable values (like `$myname` / `whoami`) in scripts before assuming execution context — overlooking this cost 4+ hours across days on level 22/23 and led to repeated failed attempts thinking it was a bug.  
- Directory permissions matter as much as file permissions — `chmod` on the parent dir (not just files) was the missing step for level 23 exploit; jumping straight to `cat` without checking `ls -ld` wasted ~20 min.  
- Low sleep (5 hours) kills sustained focus — felt drained after RHCSA session, yet still forced Bandit progress; quality dropped and energy never recovered.

## Struggles / Blockers
- Severe fatigue from only 5 hours sleep — drained after 3-hour RHCSA lab, zero energy left, but still forced through Bandit 22 redo + 23; progress felt slow and low-quality.  
- Repeated debugging loops on level 22 due to overlooking script variable context (cost ~4 hours total across sessions, including today).  
- Context switching between RHCSA networking study + lab report and Bandit cron exploits fragmented focus; hard to deep-dive into either.  
- Minor time sink: 20–30 min on level 23 directory permission oversight before realizing `chmod` needed on parent folder.

## Market Tie-In
- Bandit 22–23: Directly maps to real-world Linux endpoint analysis in SOC/IR — enumerating cron jobs (`/etc/cron.d`, `/etc/crontab`), tracing scheduled task abuse (MITRE T1053), spotting predictable filename generation via hashing (common in credential dumping or persistence), and exploiting/auditing world-writable paths or insecure temp file handling (T1070, T1552). These are bread-and-butter skills for detecting privilege escalation via automation, auditing scheduled tasks during incident response, and hunting for attacker persistence on compromised hosts.  
- RHCSA networking (nmcli, IP/subnet config, virtual adapters): Core sysadmin/blue-team fundamentals — configuring and troubleshooting network interfaces on production Linux servers (RHEL/CentOS/AlmaLinux), managing static/dynamic IPs, understanding subnetting for segmentation, and adding virtual interfaces (e.g., for labs, containers, or monitoring taps). In cybersecurity, this translates to firewall rule placement, network segmentation validation during pentests/red teaming, and forensic network artifact analysis (interface states, routing tables) post-breach.

## Tomorrow’s Targets
- College + RHCSA study/practice (networking or next scheduled topic).  
- Bandit levels 24 to 29 (with detailed lab report/markdown write-up).  
- Sleep goal: 7–8 hours.

## Proof
- [Lab report](/labs/overthewire-bandit/2026-02-25-levels-22-to-23.md)
- Screenshots referenced in report 


