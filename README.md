# 🛡️ Cyber Defense Journey
**Author:** Zac Belchar  
**Goal:** Build practical SOC (Security Operations Center) skills by learning SIEM, SOAR, and MDR tools.

---

## 📆 Schedule & Progress Log (14 Days)

| Day | Focus | Summary | Status |
|-----|--------|----------|--------|
| **Day 1** | SOC Orientation | Learned SOC structure (Tier 1–3), roles of SIEM/SOAR/MDR, reviewed NIST SP 800-61 Rev 3, set up GitHub repo for documentation. | ✅ Completed |
| **Day 2** | Git Workflow + Log Fundamentals | Practiced Git branching and pushing to GitHub. Explored Windows Event Viewer  created log-fundamentals notes and screenshots. | ✅ Completed |
### 🖼️ Day 2 – Event Viewer Screenshots

| Day | Focus | Summary | Status |
|-----|--------|----------|--------|

![Custom Event Viewer Screenshot](Screenshots/Day%202%20Custom%20Eventvwr.png)
![Critical Security Logs Screenshot](Screenshots/Day%202%20Eventvwr%20Critical%20Security%20Logs.jpg)

| **Day 3** | Splunk Installation | Installed Splunk Free, indexed Windows logs, ran basic SPL searches (`stats count by host`, `EventCode=4625`), documented setup. | 🟢 In Progress |
| **Day 4** | Splunk Dashboards + Alerts | Create dashboards for failed logins / PowerShell events, configure email alert rules, and capture screenshots. | ⬜ Pending |
| **Day 5** | Detection Rules + MITRE ATT&CK | Map detections to ATT&CK tactics (Initial Access, Execution), create custom SPL correlation rules, test and document results. | ⬜ Pending |
| **Day 6** | Threat Hunting 101 | Perform manual hunts for suspicious PowerShell or RDP behavior, use SPL filters, and summarize findings in `Hunt_Report_1.md`. | ⬜ Pending |
| **Day 7** | Week 1 Recap + Documentation | Summarize progress, lessons learned, Git commits, and update README & project board. | ⬜ Pending |
| **Day 8** | Intro to SOAR | Explore Splunk SOAR / Cortex XSOAR playground, review playbook templates, learn automation logic. | ⬜ Pending |
| **Day 9** | Build SOAR Playbook 1 | Create VirusTotal IP-enrichment playbook (API integration + decision branching), commit screenshots. | ⬜ Pending |
| **Day 10** | Playbook Integration | Connect SOAR playbook to Splunk alert trigger; verify automation from detection → containment workflow. | ⬜ Pending |
| **Day 11** | MDR Workflow Simulation | Study MDR triage/escalation processes, write a mock Incident Report (phishing or malware case). | ⬜ Pending |
| **Day 12** | Advanced Threat Hunting | Conduct multi-source searches, correlate logs + SOAR outputs with MITRE ATT&CK Navigator, export findings. | ⬜ Pending |
| **Day 13** | Portfolio Polish | Finalize GitHub repo (screenshots, structure, README), add “Lessons Learned” + project summary. | ⬜ Pending |
| **Day 14** | Reflection + Showcase | Record walkthrough video or summary doc, post GitHub link to LinkedIn, outline next steps (SOC certs). | ⬜ Pending |

---

## 🧰 Tech Stack
- **SIEM:** Splunk Free / Graylog / Microsoft Sentinel  
- **SOAR:** Splunk SOAR / Cortex XSOAR Playground  
- **Logs:** Windows Event Viewer, Syslog, Firewall data  
- **Docs & Version Control:** GitHub, Markdown  

---

## 📁 Repository Structure


---

## 🧠 Lessons Learned
Document key takeaways at the end of each week.

---

## 🔗 External References
- [TryHackMe: SOC Level 1](https://tryhackme.com/path/outline/soclevel1)
- [MITRE ATT&CK Navigator](https://attack.mitre.org/)
- [Splunk SOAR Playbook Examples](https://github.com/splunk/soar-playbook-examples)
