# Hardik's Cybersecurity Journey 2026

Daily documented hands-on progress toward SOC Analyst / Blue Team entry roles in India (focus: monitoring, log analysis, incident triage, endpoint forensics).

Goal: 365+ consistent commits, quality write-ups with debug process + real-world ties — recruiters want proof I can think under pressure, not just lists of tools.

Current focus: Linux command-line mastery (OverTheWire Bandit) → networking basics → scripting for log/alert automation.

## Repo Structure
- **labs/** → Write-ups for wargames/rooms (commands, errors, screenshots, SOC/IR ties)
- **docs/** → Daily reflections, resume versions, self-assessments
- **code/** → Scripts & tools built
- **resources/** → Cheat sheets & curated notes.

## Week 1 

**Day 1 – Feb 18**
- Bandit Levels 0–4 solved & documented (SSH login, special filenames "-", spaces, hidden files/dotdirs, file command for type detection).
- File: [Bandit Level (0-->4)](labs/overthewire-bandit/2026-02-18-levels-0-to-4.md)
- Daily reflection: [Day 1](docs/2026-02-18-daily-progress.md) 
- Key learnings: Redirection tricks (< -), ls -a, quoting/escaping — essential for hunting hidden persistence in /tmp or user homes during incident response.
- Commits: Repo setup + folders + first report.

**Day 2 – Feb 19**
- Bandit Levels 5–9 solved & documented (find by size/type/human-readable, grep patterns, base64 decoding, etc.).
- File: [Bandit Level (5-->9)](labs/overthewire-bandit/2026-02-19-levels-5-to-9.md)
- Daily reflection: [Day 2](docs/2026-02-19-daily-progress.md) 
- Screenshots: Added to images/ folder (command outputs referenced in report).
- Key learnings: Grep/pipes for filtering — direct prep for parsing auth.log or journalctl in brute-force alert triage.
- Struggles: Energy drop after 7 PM class limited deeper scripting.
- Commits: Daily MD + Bandit report + images.

**Day 3 – Feb 20**  
- Bandit Levels 10–14 documented (tar/gz chaining, setuid, SSH keys).  
- File: [Bandit Level (10-->14)](labs/overthewire-bandit/2026-02-20-levels-10-to-14.md)  
- Daily reflection: [Day 3](docs/2026-02-20-daily-progress.md)  
- Key learning: Setuid abuse → auditing /etc/sudoers for privilege escalation in IR (MITRE T1548).  
- Commits today: 3 green squares.

**Day 4 – Feb 21**  
- RHCSA revision and practice (sudoers, wheel group, shadow file security).  
- Bash script (failed SSH logins / log parser): completed, tested (historical + live modes), pushed to repo with report.  
- [Brute-Force-SSH-Log-Parser](code/Brute-Force-Log-Parser/README.md)  
- [Daily reflection](docs/2026-02-21-daily-progress.md)  
- Key learnings: Scripting/debugging time estimation is almost always optimistic — 2–3 hours planned stretched to 4–5 hours due to log format edge cases and syntax mistakes during testing. Skipping Bandit/TryHackMe when the day feels full leads to zero variety progress.  
- Struggle: Edge cases in log formats, small syntax mistakes only appearing during real testing.  
- Market tie-in: L1 SOC triage for brute-force alerts, blue team hardening, red team/pentest reporting.  
- Commits today: 2 green squares

**Day 5 – Feb 22**  
- Bandit Levels 15–19 solved & documented (openssl s_client for TLS submission, nmap port scan + ssl script filtering, diff/uniq for credential change detection, restricted shell bypass via non-interactive SSH, setuid helper binary exploitation).  
- File: [Bandit Levels 15→19](/labs/overthewire-bandit/2026-02-22-levels-15-to-19.md)  
- Time spent: ~150 min (heavy on debugging nmap flags, openssl noise, path assumptions).  
- Key learnings & SOC mappings:  
  - Internal port scanning + TLS validation → hunting rogue services/C2 on endpoints (Zeek/Suricata alerts for unexpected localhost listeners).  
  - diff / sort|uniq for file changes → detecting credential stuffing dumps or config tampering in /etc (Splunk query pattern: index=linux source="/etc/*" | stats count by _time file).  
  - Restricted shell / .bashrc abuse → analyzing anomalous login shells in /var/log/auth.log during lateral movement IR.  
  - setuid binary usage → auditing SUID/SGID files (find / -perm -4000) and understanding controlled priv esc paths (very common interview question).  
- Debug highlights: Forgot -quiet on openssl → noisy cert spam; wrong nmap flag (-quiet instead of nothing); assumed /etc/bandit_pass was file not dir.  
- Commits today: Lab report + README update in progress. Green square maintained.

**Day 6 – Feb 23**  
- Bandit Levels 20–22 solved & documented (SUID binary localhost socket listener via nc, cron job pw leak through predictable tmp files, base64 -d for human-readable decoding). Level 23 blocked by glitch (pending debug).  
- RHCSA practice: File/directory permissions (levels 3–7: chmod, chown, umask, ACL basics).  
- File: [Bandit Levels 20→22](labs/overthewire-bandit/2026-02-23-levels-20-to-22.md)  
- Daily reflection: [Day 6](docs/2026-02-23-daily-progress.md)  
- Time spent: 90 min Bandit + 240 min RHCSA (total ~6.5 effective hours post-college/chess).  
- Key learnings & SOC/IR ties:  
  - SUID socket comms (nc -lvp PORT; ./suconnect PORT; echo "pw" | nc localhost PORT) → endpoint forensics for rogue listeners (MITRE T1573.002 Encrypted Channel: Asymmetric Cryptography; audit netstat/ss for localhost binds in IR).  
  - Cron job tmp file exposure (ps aux | grep cron → readable /tmp/<predictable> ) → persistence hunting (T1053 Scheduled Task/Job; Splunk: index=syslog sourcetype=cron | stats count by cmd). Common in APT dumps.  
  - base64 decoding chains → malware artifact extraction (e.g., grep -r base64 /var/log | base64 -d).  
  - RHCSA perms: umask 022 vs 077 → hardening /tmp or user dirs against LPE (interview staple: "Fix a 777 world-writable dir").

**Day 7 – Feb 24**  
- TryHackMe SOC Fundamentals room completed (full theory + practical triage exercise: port scan alert → 5 Ws analysis → confirmed false positive from vuln assessment team).  
- RHCSA practice: chown, chgrp, ACLs, SUID/SGID binaries (order of evaluation: ACLs before standard perms — burned time forgetting).  
- File: [TryHackMe SOC Fundamentals Write-up](/labs/Try-Hack-Me/2026-02-24-thm-SOC-Fundamentals.md) (detailed notes, screenshots of pillars/roles/5Ws/SIEM logs, EDR vs SIEM comparison)  
- Daily reflection: [Day 7](/docs/2026-02-24-daily-progress.md)  
- Time spent: 90 min THM + ~240 min RHCSA (total ~5.5 effective hours; chess tournament drained morning/early afternoon).  
- Key learnings & SOC/IR ties:  
  - Tier 1 SOC = alert triage & false positive filtering (80% reading/context checking, 20% deep hunt) 
  - 5 Ws (What/Where/When/Why/Who) → standard reporting format in ticketing systems (ServiceNow/ Jira) during escalation.  
  - False positives common (e.g. authorized port scan) → critical skill to avoid alert fatigue and burnout.  
  - SIEM (log correlation, rules, alerts) vs EDR (endpoint real-time/history + auto-response) → understand both for L1 triage (SIEM for network/auth logs, EDR for process/behavior).  
  - My brute-force log parser ties in: threshold-based detection (>5 failed SSH) mirrors SIEM rule logic — upgrade plan: simulate alert output for mock SIEM feed.  
  - RHCSA ACL/SUID order → real hardening skill; misconfigs here = common privesc vectors (MITRE T1548 Abuse Elevation Control Mechanism).  
- Struggles / Brutal truth:  
  - Chess tournament overran → mental fatigue killed deeper Bandit progress (levels 23–27 skipped entirely — momentum break).  
  - THM felt theory-heavy after hands-on Bandit/RHCSA → illusion shattered: real L1 SOC is mostly alert reading + documentation, not constant exploiting. Pushed through anyway.  
  - Time wasted on ACL evaluation order (~30 min) and googling EDR/SIEM differences (~15 min) — RTFM earlier would have saved it.  
- Proof: Screenshots in write-up (pillars, roles, 5Ws log exercise, SIEM view, EDR comparison). THM account: logripper[](https://tryhackme.com/p/logripper). 4 commits today (THM write-up + screenshots + daily reflection + README pending). Streak: 7/7.

## Week 1 Progress (Feb 18–24): Linux Fundamentals & SOC Basics
Completed Bandit Levels 0–22 (65% of wargame) with detailed SOC/IR mappings (cron abuse, setuid/SUID privesc, restricted shell escapes, localhost brute-force, git-like secret leaks), built & tested basic SSH brute-force log parser (threshold detection), finished RHCSA modules (permissions, ACLs, SUID/SGID, chown/chgrp/umask), and completed TryHackMe SOC Fundamentals (triage, 5 Ws, false positives, SIEM/EDR basics). Repo shows consistent daily commits (~30+), strong green squares, and honest struggles (fatigue, debugging loops, theory vs hands-on illusion). Market-relevant foundation built: Linux endpoint forensics, log pattern detection, alert triage basics — but parser upgrades and SOC simulator write-ups are stalled

## Week 2
**Day 1 – Feb 25**  
- Bandit Level 22 redone & Level 23 solved (cron job enumeration, predictable MD5 filename exposure in Level 22; world-writable dir + ownership check bypass in Level 23 via temp dir chmod 777 + test.sh execution).  
- RHCSA networking basics: IP addressing/subnets, nmcli commands, virtual WiFi adapter config + lab practice.  
- File: [Bandit Levels 22→23](/labs/overthewire-bandit/2026-02-25-levels-22-to-23.md) (full commands, debug logs, screenshots of cron scripts, md5 hash, dir perms, exploit success)  
- Daily reflection: [Day 8](/docs/2026-02-25-daily-progress.md)  
- Time spent: 200 min Bandit (heavy debug) + ~180 min RHCSA (total ~6 hrs effective; only 5 hrs sleep prior night).  
- Key learnings & SOC/IR ties:  
  - Cron enumeration (/etc/cron.d, crontab -l) + script analysis → core endpoint IR skill for detecting scheduled task persistence (MITRE T1053.003).  
  - Predictable filename generation (md5 whoami) → common credential exposure vector (T1552.001); audit /tmp for hashed/owned files in investigations.  
  - Ownership validation bypass (stat %U check + world-writable parent dir) → real privesc path abuse; mirrors insecure /var/spool or /tmp handling in production (T1070.004).  
  - RHCSA nmcli/subnets/virtual interfaces → essential for network segmentation hardening, firewall placement, forensic interface analysis (e.g., checking rogue adapters post-breach).  
- Struggles / Brutal truth:  
  - 4+ hours total wasted on Level 22 "glitch" illusion — root cause: overlooked $myname=$(whoami) context (bandit22 vs bandit23). Thought it was a bug; Discord forced the fix. Lesson: Print variable values first.  
  - Only 5 hrs sleep → zero energy after RHCSA; progress felt slow/sluggish. Fatigue is the silent killer — elite roles demand consistency under low rest (shifts, on-call).  
  - Level 23 dir perms oversight (chmod on parent dir, not just file) — 20 min cat fail loop. Jumping to conclusions without ls -ld.  
  - No Bandit 24+ or script work — context switching + exhaustion fragmented focus.  
- Proof: Screenshots in lab report (cronjob_bandit23.sh, md5 output, /tmp dir perms, exploit cat success). THM profile still logripper[](https://tryhackme.com/p/logripper). 5 commits today (lab report + images + daily reflection + others). Streak: 8/8 alive despite fatigue.


**Day 2 – Feb 26**  
- Bandit 24–28 completed (now 28/34)  
  - 24→25: scripted nc PIN brute-force (localhost:30002)  
  - 25→26: restricted shell escape (more → vim :shell via terminal resize)  
  - 26→27: SUID binary abuse (bandit27-do)  
  - 27→28: git clone → plain README password  
  - 28→29: git history leak recovery (checkout HEAD~1)  
- RHCSA: yum/rhpm packages, nmcli IP/gateway config  
- File: [Bandit 24–28](/labs/overthewire-bandit/2026-02-26-levels-24-to-28.md)  
- Reflection: [Day 9](/docs/2026-02-26-daily-progress.md)  
- Time: ~200 min Bandit + ~240 min RHCSA/college  
- Key ties: T1110 (brute), T1548 (SUID/shell escape), T1552.001 (git leaks), endpoint IR skills  
- Struggles:  
  - 50 min lost on Level 25 disconnect illusion  
  - Late-night fatigue after full day  

  **Day 3 – Feb 27**  
- Bandit Levels 29–30 completed (now 30/34)  
  - Level 29: git forensics — recovered passphrase from commit logs (wasted 45 min missing --all flag; grepped files first instead of checking history)  
  - Level 30: [brief note: similar git/secret hunting pattern]  
- RHCSA: yum/dnf package management — repo refresh, install/update packages, metadata handling  
- File: [Bandit 29–30 notes](/labs/overthewire-bandit/2026-02-27-levels-29-to-30.md) (posting delayed to 28th)  
- Daily reflection: [Day 10](/docs/2026-02-27-daily-progress.md)  
- Time: College 9–14 + RHCSA 15–19 + Bandit 21–23 (~4 hrs total effective)  
- Key ties:  
  - Git commit forensics (T1552.001) — real IR/malware analysis skill (attackers hide payloads/creds in repos)  
  - yum/dnf secure management — enterprise hardening against supply-chain vulns (RHEL/CentOS staple for security engineers)  
- Struggles / Brutal truth:  
  - Only 6 hrs sleep → focus collapsed after 8 pm; Bandit quality dropped, momentum killed  
  - 45 min wasted on Level 29 because I skipped git log --all first — classic "search files instead of think forensics" trap  
  - Still zero code commits — log parser untouched again. Repo = Bandit diary + RHCSA notes. Recruiters see puzzle logs, not engineer work.  
- Proof: Notes written (push tomorrow), streak 10/10 (barely)


 **Day 4 – Feb 28** 
- Bandit progress: Attempted Level 31 (independent solve first → web search → asked for help; unfinished)  
- Posted Bandit Levels 29–30 documentation (committed to GitHub)  
- Other: Revised previous topics (1–3 pm), researched hackathon problem statement (8 pm–12 am)  
- File: [Bandit 29–31 notes](/labs/overthewire-bandit/2026-02-27-levels-29-to-31.md) (29–30 completed & pushed)  
- Daily reflection: [Day 11](/docs/2026-02-28-daily-progress.md)  
- Time: ~4 hrs revision + Bandit attempt + ~4 hrs hackathon research/documentation  
- Key ties:  
  - Independent → search → help escalation on Bandit 31 mirrors real pentest/bug bounty workflow  
  - Hackathon problem scoping → real red-team/pre-engagement recon & vuln planning  
- Struggles :  
  - Slept in on off-day → morning block completely lost 
  - Bandit 31 stuck → fell into web-search rabbit hole instead of methodical enumeration; waited for help instead of forcing breakthrough    
- Proof: Bandit 29–30 notes pushed

**Day 5 - Mar 01** 
- Bandit Levels 31–33 completed (now 33/33)  
  - Level 31: Git push bypass (.gitignore evasion with -f, git config fix)  
  - Level 32: Uppercase restricted shell escape via $0  
- Built & documented **v2 bash SSH log parser** (strict error handling `set -euo pipefail`, input validation, dynamic ssh/sshd detection, journalctl time-window, SOC-ready output)  
- File: [Bandit 31–33](/labs/overthewire-bandit/2026-03-01-levels-31-to-33.md)   
- Daily reflection: [Day 12](/docs/2026-03-01-daily-progress.md)  
- Time: ~3 hrs Bandit + ~4 hrs parser v2 (total ~7 hrs effective)  
- Key ties: T1562 (Impair Defenses – .gitignore bypass), T1059 (command interpretation abuse), real SOC automation (journalctl triage, hardened scripting)  
- Struggles / Brutal truth:  
  - 2 hrs wasted on git config identity error (rookie)  
  - Context switching killed 45–60 min momentum  
  - Late-night polish phase dragged (90% testing ≠ done)  
- Proof: Full lab report + screenshots . Streak 12/12. 

**Day 6 – Mar 2**  
- v2 bash log parser: Full testing completed (edge cases: malformed formats, invalid timestamps, unusual delimiters) + finalized documentation  
- Sec+ revision: Security Controls, CIA Triad, Non-Repudiation, AAA, Gap Analysis, Zero Trust  
- College assignments: Partial progress (urgent ones prioritized)  
- File: [Log Parser v2](/code/Brute-Force-SSH-Log-Parser/Brute-Force-Log-Parser-v2.sh) + updated README  
- Daily reflection: [Day 13](/docs/2026-03-02-daily-progress.md)  
- Time: ~8 hrs active blocks (deep testing + revision)  
- Key ties:  
  - Edge-case log parsing → real SOC blue-team work (cleaning feeds for SIEM/ELK/QRadar to avoid missed alerts/false positives)  
  - Sec+ concepts (CIA, Zero Trust, AAA, gap analysis) → compliance/audit foundations (NIST/ISO 27001, risk registers, policy writing)  
- Struggles / Brutal truth:  
  - Edge-case hunting took longer than planned — underestimated how many weird log variants exist in real auth.log dumps  
  - Minor distractions/breaks leaked ~1–2 hrs effective time — calendar time ≠ deep work time  
- Proof: v2 script committed + docs updated. Streak 13/13. THM: logripper

**Day 7 – Mar 3**  
- RHCSA revision: 2–3 hrs on previous topics (light review)  
- Log parser live v3: Minor initial planning/thinking (5–6 pm slot), no code, no commits, no docs  
- Other: Holi celebrations dominated the day  
- File: [Daily reflection](/docs/2026-03-03-daily-progress.md)  
- Time: ~3–4 hrs scattered (mostly non-technical)  
- Key ties: None new — day was lost to festival  
- Struggles / Brutal truth:  
  - Only 6 hrs sleep → decent focus in theory, but Holi wiped out 80% of the day. Festivities are real life, but elite roles don't pause for holidays — on-call doesn't care about Diwali/Holi.  
  - Zero commits, zero progress on live parser skeleton or hackathon PS — planned → executed = 0%. This is the exact pattern that kills streaks: one festival day becomes "no green square" → momentum death.  

**Week 2 Progress (Feb 25 – Mar 3) – Summary**  
Completed Bandit Levels 22–33 (now 33/34) with strong IR mappings (cron abuse, shell escapes, SUID, git secret leakage, .gitignore bypass).  
Shipped & fully tested log parser **v2** (strict error handling, time-window, dynamic service detection, SOC-ready output) — first major project upgrade.  
RHCSA: Networking (nmcli/subnets), package management (yum/dnf), light revision.  
Sec+: CIA Triad, Zero Trust, AAA, controls, gap analysis revised.  

## Week 3
**Day 1 – Mar 5**
Built **LogRipper v1**, a Python CLI tool for detecting SSH brute-force attempts in auth logs.  
Detection uses threshold + 60s sliding window with progressive alert escalation.  
Architecture: ingest → parse → detect → alert (modular pipeline).  
Modes: static log analysis + real-time `--live` monitoring.  
Mapped detection to **MITRE ATT&CK T1110**.  
Repo: https://github.com/Hardik-Jain05/cybersecurity-journey-2026/tree/main/code/logripper  
Files: detector.py, logripper.py, parser.py, utils.py, test_auth.log.  
Time: 11 hrs total (9 hrs LogRipper + 2 hrs hackathon planning).  
Debugged a double-count bug in streaming mode.  
Key takeaway: practical SOC-style detection engineering and alert tuning.

## Contact
LinkedIn: https://www.linkedin.com/in/hardik-jain-b69861353  
Email: jainhardik130505@gmail.com  

