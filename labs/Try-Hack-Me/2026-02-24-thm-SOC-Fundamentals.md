# TryHackMe – Junior SOC Analyst Intro

**Date:** 2026-02-24  
**Room:** SOC Fundamentals  
**Time Spent:** 90 minutes (including notes & screenshots)  
**Difficulty:** Beginner  
**Link:** https://tryhackme.com/room/socfundamentals
**Badge Earned:** NO

---

## Why This Room Matters (Realistic Market Tie-In)
- reflects real-world L1 SOC responsibilities, including alert triage, IOC validation, and structured escalation.
- provides hands-on exposure to SIEM-style log analysis, a core requirement for entry-level SOC analyst roles.
- simulate practical detection scenarios, helping develop the ability to differentiate true positives from false positives.
- workflow aligns with standard incident response phases such as detection, investigation, documentation, and escalation.
- strengthens log analysis and pattern recognition skills involving suspicious IP activity, authentication anomalies, and abnormal user behavior
- introduces how alerts appear and are investigated in practice.
- bridges foundational knowledge with market-relevant blue team skills expected in current SOC environments.
---

## Room Tasks Summary (Key Steps & Commands)

### Task 1 – Introduction to SOC?

#### Key Takeaways :
- SOC = Security Operations Center
- SOC = Centralized monitoring, detection, and response.
- SOC team (aim) = continously monitor network and resourses + identify suspisious activity
---

### Task 2 – Purposse and Components

#### Key Takeaways :
- SOC main focus = Detection and Response

![Detection and Response](/labs/Try-Hack-Me/Photos/2026-02-24-SOC-Main-Focus.png)

- Detection 
    - Detect vulnerabilities (vulnerabilities are not necessarily the SOC’s responsibility; however, unfixed vulnerabilities affect the security level of the entire company.)
    - Detect unauthorized activity(before it causes any damage , Clues: multiple failed SSH logins, geographic locations)
    - Detect policy violations (example detecting pirated media and confidential file leaks)
    - Detect intrusions (example detecting unauthorized access)

- Response = Minimizing impact + Root cause analysis
    - Support with the incident response (SOC team also helps the incident response team.)
- Three pillars of SOC
    - People
    - Process
    - Technology ( like using tools to monitor logs )

![Three Pillars Of SOC](/labs/Try-Hack-Me/Photos/2026-02-24-Pillars-of-SOC.png)

---

### Task 3 – People (always important in SOC)

#### Key Takeaways :
- Security solution can generate numerous red flags --> Huge noise + waste of (time + efforts + resources) --> example false fire alarms
- people --> identify truely harmful activities + enable prompt response
- SOC team = People
    - SOC Analyst (Level 1): Anything detected by the security solution --> SOC Analyst (Level 1) --> perform basic alert triage --> determine harmful or not --> report detections 
    - SOC Analyst (Level 2): some detections require deeper investigation --> Level 2 Analysts --> deeper investigations --> correlate multiple data sources --> perform proper analysis.
    - SOC Analyst (Level 3): experienced professionals --> look for threat indicators + support in the incident response activities --> containment --> eradication --> recovery
    - Security Engineer: deployment + configuration (security solutions) --> smooth operation.
    - Detection Engineer: Create security rules --> detect harmful activities
    - SOC Manager: manages the processes the SOC team follows + provides support + remains in contact with CISO (Chief Information Security Officer) to provide him updates on current security posture and efforts.

![Detection and Response](/labs/Try-Hack-Me/Photos/2026-02-24-Roles-and-Responsibilities.png)

---

### Task 4 – Process

#### Key Takeaways :
- Alert Triage = severity of alert + priority +  answering the 5 Ws
- 5 Ws
    - What?
    - Where?
    - When?
    - Why?
    - Who?
- Reporting = 5 Ws + thorough analysis + screenshots
- Incident Response = highly malicious activities --> high-level teams initiate an incident response
- Forensics =  analyzing the artifacts from a system or network --> determine the incident’s root cause 

![Detection and Response](/labs/Try-Hack-Me/Photos/2026-02-24-5Ws.png)

---
### Task 5 – Technology = security solutions

#### Key Takeaways :
- minimize the SOC team's manual effort to detect and respond to threats
- SIEM: Security Information and Event Management (SIEM)
    - Collects logs from various network devices
    - Detection rules are configured in the SIEM solution
    - Provides us with the detections + correlates multiple log sources + Alerts if case alert match with the rules.
    - Modern SIEM = user behavior analytics + threat intelligence capability
- EDR: Endpoint Detection and Response (EDR) 
    - provide detailed real time and historical activities of devices
    - operates on the endpoint level
    - carry out automated responses

- Firewall: functions purely for network --> act as barrier b/w internal and external network --> monitors traffic --> filters unauthorized traffic 
- other security solutions =  Antivirus, EPP, IDS/IPS, XDR, SOAR, and more
---
### Task 6 - Practical exercise of SOC

#### Scenario
You are the Level 1 Analyst of your organization’s SOC team. You receive an alert that a port scanning activity has been observed on one of the hosts in the network. You have access to the SIEM solution, where you can see all the associated logs for this alert. You are tasked to view the logs individually and answer the question to the 5 Ws given below.

Note: The vulnerability assessment team notified the SOC team that they were running a port scan activity inside the network from the host: `10.0.0.8`

#### SIEM Log Analysis

![Detection and Response](/labs/Try-Hack-Me/Photos/2026-02-24-SIEM-Logs.png)


- What?        Port Scan
- Where?       10.0.0.3
- When?        June 12, 2024 17:24
- Why?         Intended
- Who?         10.0.0.8

#### False Positive As mentioned in the task, the vulnerability assessment team notified the SOC team that they were running a port scan activity inside the network from the host: 10.0.0.8

#### Key Takeaway : Practically detecting False Positive Alert

## My Struggles & Debug Process

### Struggle 1 – State-of-the-art security tools

- **Time Wasted:** 10 minutes  
- **Fix:** searched *"state-of-the-art security tools"*  
- **Learning:**
  A mature SOC not only utilizes cutting-edge technology but also emphasizes the importance of skilled personnel and well-defined processes to achieve optimal security outcomes.

---

### Struggle 2 – Containment, eradication, and recovery

- **Time Wasted:** 5 minutes  
- **Fix:** searched *"Containment, eradication, and recovery"* 
- **Learning:**
   Together, these steps ensure a thorough and effective response to critical security incidents, safeguarding the organization's assets and data

---

### Struggle 3 – EDR vs SIEM

- **Time Wasted:** 15 minutes  
- **Fix:** searched *"EDR (Endpoint Detection and Response) and SIEM (Security Information)"* 
- **Learning:**
    - EDR : Single endpoint, Detection + Response
    - SIEM : Entire organization, Log correlation + Monitoring

![Detection and Response](/labs/Try-Hack-Me/Photos/2026-02-24-IEM-vs-EDR.png)

---

## Tie-In to My Log Parser Project

My Bash SSH brute-force log parser (`code/Brute-Force-Log-Parser/`) flags:

- Failed SSH attempts > 5

This mirrors exactly what this room teaches:

- Detect pattern
- Validate context
- Escalate if threshold exceeded

### Potential Upgrade

Feed parser output into a SIEM alert queue for automated triage simulation.

---

## Key Takeaways & Market Tie-In

- SOC is defense-first — triage > hunting.
- Alert fatigue is real — false positives reduce efficiency.
- Automation (like my parser) reduces manual triage time.

### L1 Skills Gained

- Log filtering
- False positives identification
---



