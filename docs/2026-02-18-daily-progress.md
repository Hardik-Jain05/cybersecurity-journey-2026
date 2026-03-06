# Daily Progress – 2026-02-18

## Schedule Reality Check
- **Planned** :  college → RHCSA → OverTheWire Bandit (0-4) → push (lab file + daily progress)
- **Actual**: Followed the plan (college → RHCSA → Bandit 0-4 → pushed lab file → this report)
- **Sleep**: 7 hours last night → felt fresh and better focus today

## What I Completed
- [Bandit levels 0–4 (8:00-9:30 pm)](/labs/overthewire-bandit/2026-02-18-levell0-to-4.md)
- Solved one SQL question
- Solved one C programming problem
- RHCSA study (3–7 pm block)
- [Pushed Bandit lab file](/labs/overthewire-bandit/2026-02-18-levell0-to-4.md)
- This daily progress report

## Key Learnings
- Practice and revision are essential: things that feel hard to remember at first become second nature / habit through consistent practice.
- Should not use `ssh` before exiting the local machine (to avoid issues with nested sessions or lingering connections).

## Struggles / Blockers
- Wasted time on Bandit level 1: filename started with `-`, forgot the escape syntax → had to re-read docs to remember `cat ./-` (or similar methods like `cat -- -file`).

## Market Tie-In
- Handling special filenames (e.g. starting with `-`) is a common real-world Linux sysadmin and pentesting task: appears in forensics, log analysis, privilege escalation, and initial foothold scenarios.
- Proper SSH session hygiene (exiting before nesting) prevents mistakes in production environments, remote administration, jump-host workflows used by sysadmins, DevOps, and red teamers.
- Solving SQL and C problems builds foundational debugging/problem-solving skills that transfer to vulnerability hunting, exploit development, secure coding reviews, and understanding low-level behavior in security contexts.

## Tomorrow’s Targets
- Complete Bandit levels 5–9 (with documentation / notes for each level)
- Work on user administration topics in RHCSA
- Solve one Python program + one Bash program
- Work on Bash log parser
- Update weekly progress + daily progress
- Sleep goal: 7 hours

## Proof
   ![Level 0 SSH success](/labs/overthewire-bandit/images/overthewire0.png)


&nbsp;
   ![Level 4 file command output](/labs/overthewire-bandit/images/overthewire4.png)

