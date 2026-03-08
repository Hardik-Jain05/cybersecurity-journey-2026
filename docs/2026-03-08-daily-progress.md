# Daily Progress – 2026-03-08

**Schedule Reality Check**  
- Planned: Development of frontend and integrating it with backend  
- Actual: 3 PM to 12 AM (9 hours total) with 2–4 hour break  
- Sleep: 8 hours  
- Focus impact: neutral  

**What I Completed**  
- Developed hackathon project  

**Key Learnings**  
- How backend and frontend actually work together  
- How they synchronize / communicate with each other  
- Handling different types of errors in full-stack development  
- Validating inputs on the backend is much safer than relying only on frontend authentication/validation  

**Struggles / Blockers**  
- Struggled with unclear / changing requirements  
- Many continuous errors being thrown during development  
- Once things started working, errors reduced significantly (less debugging needed afterward)  

**Market Tie-In**  
- Secure API design and proper frontend-backend synchronization are critical to prevent common web vulnerabilities (e.g., broken object level authorization, insecure direct object references)  
- Backend input validation / sanitization directly prevents injection attacks (SQLi, NoSQLi, command injection, XSS via reflected data) that frontend validation alone cannot stop  
- Poor error handling can leak sensitive information (stack traces, database errors, path disclosure) — a frequent finding in real pentests and bug bounties  
- Relying only on client-side authentication opens the door to bypasses (e.g., modifying JS, using Burp to replay requests, disabled JS scenarios)  

**Tomorrow’s Targets**  
- Attend RHCSA class 
- Work on other projects  
- Sleep 7–7.5 hours  

**Proof**  
- None today  
