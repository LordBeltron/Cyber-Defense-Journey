# 🛡️ NIST Incident Response Instructions (Rev. 3 Aligned)
**Author:** Zac Belchar  
**Scope:** Practical, SOC-ready instructions aligned to **NIST SP 800-61 Rev. 3** (“Incident Response Recommendations and Considerations for Cybersecurity Risk Management”), integrated with SIEM/SOAR workflows.

---

## 🔭 0) Purpose & Audience
This guide provides a compact, actionable playbook for a small SOC or solo analyst:

- What to do **before**, **during**, and **after** an incident.  
- Concrete steps, commands, and queries (Windows + Splunk examples).  
- Documentation templates to demonstrate process maturity.

---

## 🧱 1) NIST IR Lifecycle (Rev. 3)
NIST emphasizes a **continuous, risk-managed** approach that ties into the CSF (Identify / Protect / Detect / Respond / Recover).

1. **Preparation**  
   - Policies, roles, contacts, tooling readiness (SIEM, SOAR, EDR, ticketing).  
   - Runbooks, communications plan, evidence handling procedures, and tabletop exercises.

2. **Detection & Analysis**  
   - Centralize telemetry (logs, alerts).  
   - Triage → validate → scope → classify (incident vs. event).  
   - Use threat intelligence + MITRE ATT&CK mapping.

3. **Containment, Eradication, Recovery**  
   - Short-term containment and evidence capture.  
   - Remove root cause, patch/harden systems.  
   - Recover to a known-good state and enhance monitoring.

4. **Post-Incident Activity (Continuous Improvement)**  
   - Capture lessons learned, identify control gaps, and update detections/playbooks.  
   - Track metrics (MTTD/MTTR, false-positive rates).

---

## 🧭 2) Roles & Responsibilities
| Role | Primary Duties | Backup |
|------|----------------|--------|
| IR Lead | Declare severity, approve containment, handle external comms | Deputy / On-call L2 |
| Tier 1 Analyst | Validate alerts, open tickets, collect initial evidence | Any analyst |
| Tier 2/3 Investigator | Hunt, scope, plan containment, manage evidence | IR Lead |
| Communications | Stakeholder updates, legal/PR coordination | IR Lead |
| Forensics | Imaging, chain of custody, timeline reconstruction | Investigator |

---

## 🚦 3) Severity & Classification
| Severity | Definition | Initial Actions |
|-----------|-------------|-----------------|
| **SEV-1** | Ongoing compromise, business-critical impact | Isolate hosts, activate IR war room, hourly updates |
| **SEV-2** | Confirmed compromise, limited scope | Contain, daily updates, perform forensic capture |
| **SEV-3** | Suspected compromise / anomaly | Increase monitoring, perform targeted hunting |
| **SEV-4** | False positive / benign event | Tune detections, close with analyst notes |

**Classification Tags:** `Phishing`, `Malware`, `Ransomware`, `Data Exfil`, `Privilege Abuse`, `C2`, `Web App`, `Insider`, `Supply Chain`

---

## 🧰 4) Preparation Checklist
- [ ] SIEM connected to key sources: Windows, Sysmon, Firewall, EDR, DNS, Proxy  
- [ ] SOAR playbooks tested: IP/domain enrichment, host isolation, mailbox purge  
- [ ] Ticketing templates ready (IR, Problem, Change)  
- [ ] Contact trees (IT, Legal, HR, PR) current and verified  
- [ ] Evidence handling SOP and chain-of-custody form in place  
- [ ] Tabletop exercise completed within last 6 months  

---

## 🔎 5) Detection & Triage (Quick Flow)
1. **Acknowledge alert** → log ticket, stamp time/owner  
2. **Validate** → false positive? context? change window?  
3. **Scope** → what hosts/users/credentials are impacted? lateral movement?  
4. **Classify + Set SEV** → escalate to IR Lead if SEV-2 or higher  
5. **Decide:** monitor vs. contain  

**Key triage questions:**
- What changed before the alert?  
- Is this isolated or widespread?  
- Any unusual outbound traffic or data exfil?

---

## 🧪 6) Practical Queries (Windows + Splunk SPL)

### 🪟 Windows (PowerShell)
```powershell
# Failed logons (4625)
Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4625} -MaxEvents 100 |
  Select TimeCreated, Id, ProviderName, @{n='User';e={$_.Properties[5].Value}}, Message

```powershell
# Failed logons (4625)
Get-WinEvent ...

# PowerShell Script Block Logging (4104)
Get-WinEvent ...

# Local admins
net localgroup administrators

# Running processes (quick look)
Get-Process | Sort-Object CPU -desc | Select -First 15 Name, Id, CPU

</details>

---

<a id="sec11"></a>
<details>
<summary><strong>📝 11) Incident Report Template</strong> &nbsp; <img src="https://img.shields.io/badge/Reporting-Required-lightgrey?style=flat-square" /></summary>

📄 **Incident Report PDF:**  
[`./Templates/Incident_Report_Template.pdf`](./Templates/Incident_Report_Template.pdf)


</details>

---

<a id="sec12"></a>
<details>
<summary><strong>🧭 12) ATT&CK Mapping (Quick Reference)</strong> &nbsp; <img src="https://img.shields.io/badge/Framework-MITRE%20ATT&CK-0f4c81?style=flat-square" /></summary>

| Tactic | Examples |
|--------|-----------|
| Initial Access | T1566 Phishing, T1190 Exploit Public-Facing App |
| Execution | T1059 PowerShell, T1106 Native APIs |
| Persistence | T1547 Boot/Logon Autostart, T1053 Scheduled Task |
| Privilege Escalation | T1548 Abuse Elevation Control |
| Defense Evasion | T1562 Disable Security Tools |
| Discovery | T1087 Account Discovery |
| Lateral Movement | T1021 Remote Services |
| Command & Control | T1071 HTTPS/DNS |
| Collection/Exfiltration | T1041 Exfil Over C2 |

</details>

---

<a id="sec13"></a>
<details>
<summary><strong>🧩 13) CMMC / NIST 800-171 Tie-ins</strong> &nbsp; <img src="https://img.shields.io/badge/CMMC-Level%202-blue?style=flat-square" /></summary>

| Control Family | Purpose | Example |
|----------------|----------|---------|
| IR.L2-3.6.x | Incident Response Planning | Runbooks, lessons learned |
| AU.L2-3.3.x | Audit & Accountability | Log retention, review cycles |
| AC / IA / CM | Access, Identity, Config | Disable accounts, enforce MFA, patching |

</details>

---

<a id="sec14"></a>
<details>
<summary><strong>📊 14) Metrics & Continuous Improvement</strong> &nbsp; <img src="https://img.shields.io/badge/Analytics-Operational-blue?style=flat-square" /></summary>

Track monthly:
- **MTTD / MTTR** – detection & response times  
- **Incidents by class/severity**  
- **False positive rate per rule**  
- **Playbook runtime**  
- **Top 5 tuned detections**  

</details>

---

<a id="sec15"></a>
<details>
<summary><strong>✅ 15) Quick “Go Bag” Checklist</strong> &nbsp; <img src="https://img.shields.io/badge/Field%20Guide-Ready-brightgreen?style=flat-square" /></summary>

**When in doubt:**

1. Confirm alert → open ticket w/ timestamp & owner  
2. Snapshot scope → assign SEV → inform IR Lead  
3. Contain IOCs → preserve evidence  
4. Eradicate → patch → reset credentials  
5. Recover → validate clean telemetry  
6. Report → lessons learned → tune detections  

</details>
<a id="sec7"></a>
<details>
<summary><strong>🧯 7) Containment → Eradication → Recovery</strong> &nbsp; <img src="https://img.shields.io/badge/Action-Required-orange?style=flat-square" /></summary>

### **Containment Options**
- **Network:** Block IP/domain, sinkhole DNS  
- **Endpoint:** Isolate host (EDR), kill process, disable account  
- **Email:** Purge phishing messages, block sender/domain  
- **Identity:** Force password reset, revoke tokens, disable MFA sessions  

### **Eradication**
- Remove malware/persistence  
- Patch vulnerabilities  
- Reset affected credentials  
- Verify with rescans + clean baselines  

### **Recovery**
- Restore services in phases  
- Increase logging on impacted assets  
- Validate clean telemetry (no callbacks, no new alerts)  

</details>

---

<a id="sec8"></a>
<details>
<summary><strong>🧪 8) Evidence Handling & Forensics</strong> &nbsp; <img src="https://img.shields.io/badge/Evidence-Integrity-critical?style=flat-square" /></summary>

- **Preserve first:** volatile memory, logs, running processes  
- **Record:** who/what/when/where/why/how (chain of custody)  
- **Collect:** disk images, EDR timelines, registry artifacts, network flows  
- **Hash:** everything (SHA-256 preferred)  

📄 **Chain of Custody PDF:**  
[`./Templates/Chain_of_Custody.pdf`](./Templates/Chain_of_Custody.pdf)

**Chain of Custody Template (inline):**


</details>

---

<a id="sec9"></a>
<details>
<summary><strong>🤖 9) SOAR Playbook Skeletons</strong> &nbsp; <img src="https://img.shields.io/badge/SOAR-Automation-blueviolet?style=flat-square" /></summary>

### **A) IP Enrichment & Action**
**Trigger:** SIEM alert w/ `src_ip`  
**Flow:**  
1. Enrich IP (VirusTotal, OTX, GreyNoise)  
2. If malicious → open ticket, notify SOC channel  
3. If internal host seen → isolate host + block on firewall  
4. Close case → attach IOCs & artifacts  

---

### **B) Suspected Phishing**
**Trigger:** User-reported email  
**Flow:**  
1. Check URL/domain reputation  
2. Search & purge tenant-wide  
3. Reset credentials for affected users  
4. Send user awareness notice  

</details>

---

<a id="sec10"></a>
<details>
<summary><strong>🗣️ 10) Communication Templates</strong> &nbsp; <img src="https://img.shields.io/badge/Comms-Stakeholders-important?style=flat-square" /></summary>

📄 **Communication Update PDF:**  
[`./Templates/Communication_Update_Template.pdf`](./Templates/Communication_Update_Template.pdf)

### **Internal Stakeholder Update (SEV-2)**


</details>

---

<a id="sec11"></a>
<details>
<summary><strong>📝 11) Incident Report Template</strong> &nbsp; <img src="https://img.shields.io/badge/Reporting-Required-lightgrey?style=flat-square" /></summary>

📄 **Incident Report PDF:**  
[`./Templates/Incident_Report_Template.pdf`](./Templates/Incident_Report_Template.pdf)


</details>

---

<a id="sec12"></a>
<details>
<summary><strong>🧭 12) ATT&CK Mapping (Quick Reference)</strong> &nbsp; <img src="https://img.shields.io/badge/Framework-MITRE%20ATT&CK-0f4c81?style=flat-square" /></summary>

| Tactic | Examples |
|--------|-----------|
| Initial Access | T1566 Phishing, T1190 Exploit Public-Facing App |
| Execution | T1059 PowerShell, T1106 Native APIs |
| Persistence | T1547 Boot/Logon Autostart, T1053 Scheduled Task |
| Privilege Escalation | T1548 Abuse Elevation Control |
| Defense Evasion | T1562 Disable Security Tools |
| Discovery | T1087 Account Discovery |
| Lateral Movement | T1021 Remote Services |
| Command & Control | T1071 HTTPS/DNS |
| Collection/Exfiltration | T1041 Exfil Over C2 |

</details>

---

<a id="sec13"></a>
<details>
<summary><strong>🧩 13) CMMC / NIST 800-171 Tie-ins</strong> &nbsp; <img src="https://img.shields.io/badge/CMMC-Level%202-blue?style=flat-square" /></summary>

| Control Family | Purpose | Example |
|----------------|----------|---------|
| IR.L2-3.6.x | Incident Response Planning | Runbooks, lessons learned |
| AU.L2-3.3.x | Audit & Accountability | Log retention & review |
| AC / IA / CM | Access, Identity, Configuration | Disable accounts, enforce MFA, patching |

</details>

---

<a id="sec14"></a>
<details>
<summary><strong>📊 14) Metrics & Continuous Improvement</strong> &nbsp; <img src="https://img.shields.io/badge/Analytics-Operational-blue?style=flat-square" /></summary>

Track monthly:
- **MTTD / MTTR** – detection & response times  
- **Incidents by class/severity**  
- **False positive rate per rule**  
- **Playbook runtime**  
- **Top 5 tuned detections**  

</details>

---

<a id="sec15"></a>
<details>
<summary><strong>✅ 15) Quick “Go Bag” Checklist</strong> &nbsp; <img src="https://img.shields.io/badge/Field%20Guide-Ready-brightgreen?style=flat-square" /></summary>

**When in doubt:**

1. Confirm alert → open ticket w/ timestamp & owner  
2. Snapshot scope → assign SEV → notify IR Lead  
3. Contain IOCs → preserve evidence  
4. Eradicate → patch → reset credentials  
5. Recover → validate clean telemetry  
6. Report → lessons learned → tune detections  

</details>
