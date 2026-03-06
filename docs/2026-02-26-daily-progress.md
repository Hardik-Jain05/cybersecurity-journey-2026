# Daily Progress – 2026-02-26

## Schedule Reality Check

- **Planned:** College + RHCSA study/practice (networking or next scheduled topic) + Bandit levels 24 to 29 (with detailed lab report/markdown write-up) + Sleep goal 7–8 hours.
- **Actually worked/studied:**
  - 09:30–14:00 → College
  - 15:00–19:00 → RHCSA (packages, assigning IP & gateway via nmcli, rhpm, yum)
  - 20:30–01:00 → Bandit levels 24–29 (completed + detailed report write-up)
- **Sleep:** 7.5 hours  
  **Focus/energy impact:** Focus was good during the work blocks, but feeling tired now (late finish after full day).

## What I Completed

- **Bandit levels:** 24 → 29 completed  
  - 24→25: localhost nc brute-force PIN (4-digit)  
  - 25→26: restricted shell escape via more + vim trick + small terminal  
  - 26→27: SUID bandit27-do binary to read next password  
  - 27→28: git clone repo + README password  
  - 28→29: git clone + history inspection + checkout previous commit to recover password
- **Other tasks:** RHCSA hands-on — package management (yum / rhpm), nmcli for creating/assigning IP + gateway on new connections.
- **Code/scripts:** Bash script for Level 24 PIN brute-force (loop seq 0000-9999, nc localhost 30002 redirection + grep filter for success).
- **Documentation:** Comprehensive markdown report for Bandit 24–29 (`/labs/overthewire-bandit/2026-02-26-levels-24-to-28.md`) — full command logs, outputs, debug notes, screenshots, key concepts, SOC/IR relevance mapping.

## Key Learnings

- Restricted shells can appear locked but often have escape vectors through invoked tools like `more` — wasted ~50 minutes on Level 25 because I didn't immediately test resizing the terminal to trigger pagination and vim access; lesson: always decompose scripted login shells line-by-line and test pager/editor behaviors early.
- Brute-force inputs must be precisely formatted (password + space + pin on each line) and redirection/grep filtering is essential to catch the single success amid noise — initial nc attempts failed until I scripted proper batch input and cleaned output.
- Git repositories for credentials often hide passwords in previous commits, not just HEAD — overlooking history on Level 28–29 would have left the secret in the "fixed" README; lesson: `git log` + checkout old commits is mandatory for secret leakage scenarios.

## Struggles / Blockers

- Biggest time sink: ~50 minutes lost on Level 25 → 26 due to immediate SSH disconnect on login; root cause was not recognizing `/usr/bin/showtext` (more on text.txt) auto-exits session — fixed only after analyzing script + testing terminal resize to trigger pager → vim escape.
- Minor friction on Level 24 brute-force: initial manual nc attempts and poorly filtered output wasted ~10–15 minutes before scripting proper loop + file redirection + grep -v Wrong! to isolate the correct pin.
- Late-night Bandit session (8:30 pm – 1 am) after full college + RHCSA day led to fatigue creeping in toward the end — focus remained decent but energy dropped noticeably after midnight.
- No major blockers on RHCSA side (nmcli/yum practice went smoothly), but switching contexts between college, RHCSA, and Bandit multiple times in one day fragmented momentum slightly.

## Market Tie-In

- Brute-forcing localhost services (Level 24) mirrors detecting and investigating credential stuffing / password-spraying attacks against exposed services; in SOC, you'd hunt for anomalous nc/netcat connections, unusual loopback traffic, or high-volume auth failures in logs (MITRE T1110).
- Restricted shell escapes + SUID binary abuse (Levels 25–26) directly maps to privilege escalation hunting in endpoint investigations; real engagements often involve identifying misconfigured shells, pager/editor exploits, or unexpected SUID binaries during post-compromise analysis (T1548).
- Git credential leakage via commit history (Levels 27–29) reflects common secret exposure in code repos; security teams now run automated secret scanning (TruffleHog, GitGuardian, etc.) and review git log/show for leaked keys/passwords during DLP/incident response (T1552.001).

## Tomorrow’s Targets

- Complete Bandit levels 29 to 34 (with detailed notes/commands/report).
- Attend college + continue RHCSA practice (focus on next scheduled topics).
- Sleep goal: 7.5 hours.

## Proof

- Report: `/labs/overthewire-bandit/2026-02-26-levels-24-to-28.md`  
- Screenshots: `/labs/overthewire-bandit/images/2026-02-26-bandit*.png`   

