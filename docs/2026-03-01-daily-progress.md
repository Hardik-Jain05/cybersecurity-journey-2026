# Daily Progress – 2026-03-01

## 1) Schedule Reality Check
- **Planned**  
  - Finish Bandit levels 31 to 34  
  - Revise Sec+ material  
  - Work on/complete college assignments  
  - Sleep goal: 7 hours  

- **Actual work/study times**  
  - 11:00 – 13:00: some college assignments  
  - 14:00 – 17:00: solved Bandit levels  
  - 18:00 – 19:00: planned v2 of log parser  
  - 20:00 – 00:00: implemented v2 bash log parser + final documentation (testing ~90% done)  

- **Sleep (Feb 28 → March 1)**: 7.5 hours — felt focused and good

## 2) What I Completed
- **Bandit levels**: Finished levels 31 to 33 fully; level 33 → 34 under development  
- **Other tasks**: Partial progress on college assignments (some completed, others remaining); no Sec+ revision today  
- **Code/scripts**: v2 of bash log parser created with  
  - Strict error handling (`set -euo pipefail`)  
  - Input validation on threshold  
  - Dynamic service detection (`ssh.service` vs `sshd.service`)  
  - Time-window support via `journalctl --since`  
  - Cleaner, timestamped, SOC-ready output  
- **Documentation**: Final documentation for v2 log parser written (testing ~90% done, remains pending)

## 3) Key Learnings
- Strict error handling with `set -euo pipefail` catches subtle bugs early, but it forces you to think about every possible failure point upfront — skipping it in v1 cost time later.
- When jumping between tasks (assignments → Bandit → planning → coding), context-switching ate ~30–45 minutes each time; batching similar work would have saved energy.
- Overestimating how fast "final documentation and testing" goes — even at 90% testing done, polishing and edge cases still take significant time.

## 4) Struggles / Blockers
- Late-night session (8 PM – 12 AM) pushed past a natural energy drop, making the last 1–2 hours slower and more error-prone than earlier focused blocks.
- Frequent context switching between assignments, Bandit, planning log parser v2, then full implementation → lost ~45–60 min total to mental overhead and re-ramping.
- Underestimated polish phase: even with 90% testing "done", fixing edge cases + writing clean SOC-ready output formatting took longer than expected, leaving documentation/testing incomplete.

## 5) Market Tie-In
- Bypassing .gitignore and pushing ignored files mirrors how attackers evade client-side controls (e.g. EDR/AV exclusions, weak .gitignore in dev repos) — SOC analysts and IR teams must verify server-side enforcement, not trust local configs (relates to MITRE T1562 Impair Defenses).
- Escaping the uppercase restricted shell via $0 / command substitution tricks reflects real-world restricted shell breakouts on compromised Linux endpoints (e.g. via SSH keys, cron, sudo misconfigs) — directly applicable to containment bypass detection and privilege escalation hunting.
- Building a hardened bash log parser (strict error handling, dynamic service detection, time-window filtering, SOC-formatted output) is exactly the kind of small automation scripting junior SOC analysts and threat hunters write daily to triage SSH brute-force or auth failures from journalctl in real environments.

## 6) Tomorrow’s Targets (March 2, 2026)
- Complete remaining testing (edge cases, full runs) and finalize documentation for v2 bash log parser  
- Do at least 1–2 hours of targeted Sec+ revision 
- Finish the remaining college assignments (prioritize the most urgent/due soon ones)  
- Sleep goal: 7.5–8 hours 

## 7) Proof
- Detailed write-up: `labs/overthewire-bandit/2026-03-01-levels-31-to-33.md` (includes full command logs, debug notes, key concepts, MITRE ATT&CK mappings, and screenshot placeholders for levels 31–33)  
- v2 bash log parser: code + documentation created locally (testing ~90% complete)  

