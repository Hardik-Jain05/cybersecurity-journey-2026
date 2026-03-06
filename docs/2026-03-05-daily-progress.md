# Daily Progress – 2026-03-05

**1) Schedule Reality Check**  
- **Planned**: Work on hackathon + LogRipper project  
- **Actual work**: Hackathon project 12:00–14:00 (2 hrs), LogRipper 15:00–00:00 (9 hrs)  
- **Sleep**: 7–8 hours  
- **Focus/Energy**: Felt fresh and concentrated  

**2) What I Completed**  
- Bandit levels: None  
- Hackathon project (12:00–14:00): Made the workflow and decided the technology stack to be used  
- LogRipper: Built Python CLI tool that detects SSH brute force attacks in Linux auth logs using threshold + sliding 60-second window + progressive alert escalation.  
  • Supports static analysis and real-time monitoring (--live) with modular pipeline (ingest → parse → detect → alert).  
  • Detection logic mapped to MITRE ATT&CK T1110; includes CLI flags, logging, and false-positive tuning.  
- Other tasks / side things: None  

**3) Key Learnings**  
- Learned the importance of structuring the project and defining the workflow before jumping into coding — without it, the code quickly becomes messy and harder to maintain/debug.  

**4) Struggles / Blockers**  
- In --live mode, a bug caused the detector to count a single attack twice → messed up threshold counting  
- Debugging and fixing that bug took ~30 minutes  
(Overall day otherwise went smoothly — no other major blockers noted.)  

**5) Market Tie-In**  
- LogRipper directly mirrors real-world SIEM / EDR log analysis for credential access attacks (MITRE T1110). Tools like Splunk, Elastic SIEM, Wazuh, or even open-source Falco / OSSEC use similar threshold-based + time-window detection for brute-force SSH attempts in /var/log/auth.log or secure.log.  
- Progressive escalation and false-positive tuning are core to production alerting — reduces noise in SOC environments where thousands of logs hit per minute.  
- Building this kind of lightweight, modular CLI tool is exactly the kind of skill needed for custom detection engineering, threat hunting scripts, or contributing to open-source security tooling.  

**6) Tomorrow’s Targets**  
- Work on documentation for LogRipper  
- Restructure the GitHub repo (clean folders, README, etc.)  
- Start coding the hackathon project  
- **Sleep goal**: 7 hours  

**7) Proof**  
- GitHub repo for LogRipper: https://github.com/Hardik-Jain05/cybersecurity-journey-2026/tree/main/code/logripper  
  (Files: detector.py, logripper.py, parser.py, utils.py, test_auth.log — supports modular detection pipeline)  


