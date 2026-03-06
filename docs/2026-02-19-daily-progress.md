# Daily Progress – 2026-02-19

## Schedule Reality Check

- **Planned:** 
    - Complete Bandit levels 5–9 (with documentation / notes for each level)
    - Work on user administration topics in RHCSA
    - Solve one Python program + one Bash program
    - Work on Bash log parser
    - Update weekly progress + daily progress
    - Sleep goal: 7 hours
- **Actual work time:**
  - College: 09:30–15:00
  - RHCSA: 15:00–19:00
  - Bandit lab (levels 5–9): 20:00–21:30
  - Daily report + lab report: 21:30–~23:30

- **Sleep:**   
7.5 hours — focus was decent/good throughout the day.

## What I Completed

- **Bandit levels:** Fully completed levels 5–9, including detailed per-level notes, commands, debug steps, key concepts, job connections, and screenshots.
- **Other tasks:** RHCSA user administration — covered user types, UID/GID/shell/home directory; create/modify/delete users; /etc/passwd, /etc/shadow, /etc/group, /etc/gshadow; primary vs secondary groups; hands-on practicals on RHEL 9.7.
- **Code/scripts:** Solved one Python program + one Bash program.
- **Bash log parser:** No progress today.
- **Documentation:** Detailed Bandit lab report completed; weekly progress not updated yet.

## Key Learnings

- In Bandit level 5→6: Assuming `-size 1033` would match bytes directly (without 'c') led to no results → had to read `man find` twice to learn the unit suffix requirement (c for bytes).
- In Bandit level 6→7: Running `find /` without `2>/dev/null` flooded the terminal with hundreds of "Permission denied" errors → learned that redirecting stderr is essential for clean broad filesystem searches.
- In RHCSA user admin practicals: Not immediately anticipating how secondary group membership affects `/etc/group` (or how `gshadow` updates) until doing create/modify/delete cycles → reinforced checking all four files after every user operation.

## Struggles / Blockers

- Minor time lost on familiar Bandit issues (re-reading `man find`, initial noisy `find` output before adding redirection) — not much overall.
- No major blockers or significant distractions today.

## Market Tie-In

Today's Bandit levels 5–9 reinforced core Linux skills (precise file searching with find filters, error suppression, grep patterns, strings extraction, sort/uniq pipelines) that are directly used in penetration testing for locating credentials or configs, in incident response/forensics for hunting IOCs in filesystems/logs, and in malware analysis for pulling readable strings from binaries.  
The RHCSA user administration practicals (managing users/groups, understanding /etc/passwd/shadow/group/gshadow, observing file changes during create/modify/delete) map straight to real-world Linux system administration and hardening tasks — common in blue-team roles, endpoint security, and post-compromise cleanup where misconfigured accounts or group privileges are frequent attack vectors or persistence mechanisms.

## Tomorrow’s Targets

- Complete Bandit levels 10–14 (with documentation / notes for each level)
- Work on remaining user administration topics in RHCSA
- Solve one C program + one SQL query
- Work on Bash log parser
- Update weekly progress + daily progress
- Sleep goal: 7–7.5 hours

## Proof

- [Bandit lab report](/labs/overthewire-bandit/2026-02-19-levels-5-to-9.md) 

## Screenshots:
  
  - ![Level 5→6](/labs/overthewire-bandit/images/2026-02-19-bandit5.png)


  - ![Level 6 mistake](/labs/overthewire-bandit/images/2026-02-19-bandit6-mistake.png)
  
  
  - ![Level 6→7](/labs/overthewire-bandit/images/2026-02-19-bandit6.png)
  
  
  - ![Level 7→8](/labs/overthewire-bandit/images/2026-02-19-bandit7.png)
  
  
  - ![Level 8→9](/labs/overthewire-bandit/images/2026-02-19-bandit8.png)
  
  
  - ![Level 9→10](/labs/overthewire-bandit/images/2026-02-19-bandit9.png)
