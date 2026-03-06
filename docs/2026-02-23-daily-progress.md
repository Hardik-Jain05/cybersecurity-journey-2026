# Daily Progress – 2026-02-23

## Schedule Reality Check

- **Planned**  
  Attend college + focus on RHCSA preparation/practice  
  Complete Bandit levels 20–24  
  Sleep goal: 7.5 hours

- **Actual work times**  
  09:00–14:00 → College (sports competition – chess round cleared today)  
  15:00–19:00 → RHCSA practice (file & directory permissions – levels 3–7)  
  20:30–22:00 → Bandit levels 20–22 solved (23 blocked by glitch)

- **Sleep**  
  7 hours last night

- **Focus / energy**  
  Great focus throughout the day


## What I Completed

- **Bandit levels**  
  Completed: 20, 21, 22 (fully)  
  Blocked: 23 (glitch)

- **Other tasks**  
  RHCSA file permissions & directory permissions learned + practiced

- **Code / scripts**  
  None written or modified (only Bandit challenge commands executed)

- **Documentation**  
  Detailed [lab report Bandit 20 to 22](/labs/overthewire-bandit/2026-02-23-levels-20-to-22.md)  
  (commands, debug attempts, errors, key concepts, SOC/IR relevance, screenshots)


## Key Learnings

- SUID binaries that expect input on localhost require setting up a proper listener (e.g. `nc -lvp <port>`) first — trying wrong ports or assuming SSH port 22 wastes time.  
- Cron jobs frequently write to predictable `/tmp` filenames generated from `whoami` + md5 — always compute the exact filename instead of guessing.  
- Early confusion between client/server roles and localhost scope causes most initial failures; validate execution context before deep debugging.


## Struggles / Blockers

- Glitch in Bandit level 23 prevented any progress on 23–24  
- Level 20 debugging: two separate ~15-minute blocks wasted on connection failures (wrong port assumption & no listener running) → ~30 min total lost  
- Initial misunderstanding of execution context / service direction in levels 20–22 slowed first attempts


## Market Tie-In

These Bandit exercises map directly to practical cybersecurity skills:  

- SUID binary + localhost socket validation → spotting privilege escalation paths (MITRE T1548) during endpoint assessments and post-exploitation analysis  
- Cron job enumeration & script inspection → identifying persistence via scheduled tasks (MITRE T1053) — routine in Linux IR, threat hunting, and forensic reviews  
- Predictable /tmp file creation & weak naming → classic information disclosure / race condition vectors frequently reported in pentests, red-team engagements, and SOC incident investigations


## Tomorrow’s Targets

- Clear next chess round (sports competition day 2/3)  
- Advance RHCSA practice (next topics)  
- Solve Bandit levels 23–27  
- Sleep goal: 7 hours


## Proof

- [lab report Bandit 20 to 22](/labs/overthewire-bandit/2026-02-23-levels-20-to-22.md)

- Screenshots:

![Level 20.1](/labs/overthewire-bandit/images/2026-02-23-bandit20.1.png)


![Level 20.2](/labs/overthewire-bandit/images/2026-02-23-bandit20.2.png)


![Level 20.3](/labs/overthewire-bandit/images/2026-02-23-bandit20.3.png)


![Level 23](/labs/overthewire-bandit/images/2026-02-23-bandit21.png)


![Level 22](/labs/overthewire-bandit/images/2026-02-23-bandit22.png)

