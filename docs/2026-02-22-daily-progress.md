# Daily Progress – 2026-02-22

## Schedule Reality Check

- **Planned**  
  - Reflect on this week: review and go through lab reports from this week  
  - Complete Bandit levels 15–19  
  - Sleep goal: 7–7.5 hours

- **Actual work/study times**  
  12:00–16:00 — read files pushed this week, revised labs done and concepts studied  
  20:00–22:30 — solved labs (Bandit levels)  
  22:30–23:30 — documentation

- **Sleep**  
  8 hours (night of Feb 21–22) → energy/focus: average

## What I Completed

- Bandit levels: Completed levels 15 → 19 (full walkthroughs, passwords retrieved)  
- Other tasks: Reviewed and reflected on this week's lab reports/files pushed, revised labs done and concepts studied  
- Code/scripts/solutions written: None  
- Documentation: Created detailed [lab report] (labs/overthewire-bandit/2026-02-22-levels-15-to-19.md) (commands, debug notes, key concepts, screenshots, session summary)

## Key Learnings

- Always use the `-quiet` flag with `openssl s_client` when you only need the clean output (e.g. password prompt) — forgetting it creates messy, noisy terminal output that wastes 2–5 minutes cleaning up or restarting.  
- The `-quiet` flag does **not** exist for nmap (invalid option error) — blindly adding flags from one tool to another burns time; check man pages or help first.  
- Never assume a path is a file without verifying (`ls -la` first) — treating `/etc/bandit_pass` as a file instead of a directory cost a failed attempt and unnecessary confusion.

## Struggles / Blockers

- Got up late + went out → approximately 3 hours unproductive / lost to non-study activities  
- Remaining time felt squeezed, but focused sessions were still productive once started

## Market Tie-In

Port enumeration, TLS validation, file comparison, restricted shell bypass, and privileged binary execution directly mirror endpoint IR workflows: identifying exposed services, validating encrypted channels, detecting credential tampering (diff), and auditing privilege escalation vectors (MITRE T1548). These exercises strengthen practical skills in internal service discovery, change analysis, and controlled privilege abuse detection relevant to SOC investigations and Linux host forensics.

## Tomorrow’s Targets

- Attend college + focus on RHCSA preparation/practice  
- Complete Bandit levels 20–24  
- Sleep goal: 7.5 hours

## Proof

- Bandit lab report: `labs/overthewire-bandit/2026-02-22-levels-15-to-19.md`  
## Screenshots :

  - ![Bandit Level 15](/labs/overthewire-bandit/images/2026-02-22-bandit15.1.png)  


  - ![Bandit Level 15](/labs/overthewire-bandit/images/2026-02-22-bandit15.2.png)  


  - ![Bandit Level 16](/labs/overthewire-bandit/images/2026-02-22-bandit16.1.png)  


  - ![Bandit Level 16](/labs/overthewire-bandit/images/2026-02-22-bandit16.2.png)  


  - ![Bandit Level 16](/labs/overthewire-bandit/images/2026-02-22-bandit16.3.png)  


  - ![Bandit Level 16](/labs/overthewire-bandit/images/2026-02-22-bandit16.4.png) 


  - ![Bandit Level 17](/labs/overthewire-bandit/images/2026-02-22-bandit17.png)  


  - ![Bandit Level 18](/labs/overthewire-bandit/images/2026-02-22-bandit18.1.png) 


  - ![Bandit Level 18](/labs/overthewire-bandit/images/2026-02-22-bandit18.2.png) 
  
   
  - ![Bandit Level 19](/labs/overthewire-bandit/images/2026-02-22-bandit19.png)
