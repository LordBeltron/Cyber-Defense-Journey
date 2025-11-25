<a id="sec1"></a>
<details>
<summary><strong>🧱 1) NIST IR Lifecycle (Rev. 3)</strong> &nbsp; <img src="https://img.shields.io/badge/NIST-Lifecycle-0f4c81?style=flat-square" /></summary>

NIST emphasizes a **continuous, risk-managed** approach that ties into the CSF (Identify / Protect / Detect / Respond / Recover).

1. **Preparation**
   - Policies, roles, contacts, tooling readiness (SIEM, SOAR, EDR, ticketing)
   - Runbooks, communications plans, evidence handling procedures
   - Tabletop exercises

2. **Detection & Analysis**
   - Centralize telemetry  
   - Triage → validate → scope → classify  
   - Use threat intel + MITRE ATT&CK mapping

3. **Containment, Eradication, Recovery**
   - Contain threats, capture evidence  
   - Remove root causes, patch systems  
   - Recover to known-good state

4. **Post-Incident Activity**
   - Lessons learned  
   - Improve controls + detections  
   - Track metrics (MTTD/MTTR)

</details>

---

<a id="sec2"></a>
<details>
<summary><strong>🧭 2) Roles & Responsibilities</strong> &nbsp; <img src="https://img.shields.io/badge/Roles-Defined-blue?style=flat-square" /></summary>

| Role | Primary Duties | Backup |
|------|----------------|--------|
| IR Lead | Declare severity, approve actions, external comms | Deputy / L2 |
| Tier 1 Analyst | Validate alerts, triage events | Any analyst |
| Investigator (T2/T3) | Hunt, scope, isolate hosts, gather evidence | IR Lead |
| Communications | Stakeholder updates, PR/legal coordination | IR Lead |
| Forensics | Imaging, chain of custody, reconstruction | Investigator |

</details>

---

<a id="sec3"></a>
<details>
<summary><strong>🚦 3) Severity & Classification</strong> &nbsp; <img src="https://img.shields.io/badge/Severity-Matrix-orange?style=flat-square" /></summary>

| Severity | Meaning | Initial Steps |
|---------|---------|----------------|
| **SEV-1** | Active compromised environment | Isolate hosts, war room |
| **SEV-2** | Confirmed compromise | Contain, collect evidence |
| **SEV-3** | Suspicious activity | Monitor + hunt |
| **SEV-4** | False positive | Tune rule, close ticket |

**Classification tags:**  
`Malware`, `Phishing`, `C2`, `Ransomware`, `Privilege Abuse`, `Web Attack`, `Insider`, `Data Exfil`

</details>

---

<a id="sec4"></a>
<details>
<summary><strong>🧰 4) Preparation Checklist</strong> &nbsp; <img src="https://img.shields.io/badge/Preparation-Checklist-success?style=flat-square" /></summary>

- [ ] SIEM connected to all critical log sources  
- [ ] SOAR playbooks tested  
- [ ] Ticket templates ready  
- [ ] Updated IR contact lists  
- [ ] Evidence handling SOPs  
- [ ] Tabletop exercise < 6 months

</details>

---

<a id="sec5"></a>
<details>
<summary><strong>🔎 5) Detection & Triage (Quick Flow)</strong> &nbsp; <img src="https://img.shields.io/badge/Triage-Workflow-yellow?style=flat-square" /></summary>

1. Acknowledge alert → timestamp + owner  
2. Validate context → false positive?  
3. Scope → hosts/users/infra  
4. Assign SEV level  
5. Decide: monitor vs contain  

**Questions to ask:**
- What changed before the alert?  
- One host or many?  
- Any suspicious outbound traffic?  

</details>

---

<a id="sec6"></a>
<details>
<summary><strong>🧪 6) Practical Queries (Windows + Splunk)</strong> &nbsp; <img src="https://img.shields.io/badge/Queries-Useful-blueviolet?style=flat-square" /></summary>

### 🪟 Windows (PowerShell)

```powershell
# Failed logons (4625)
Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4625} -MaxEvents 100 |
  Select TimeCreated, Id, ProviderName, @{n='User';e={$_.Properties[5].Value}}, Message

# PowerShell Script Block Logging (4104)
Get-WinEvent -FilterHashtable @{LogName='Microsoft-Windows-PowerShell/Operational'; Id=4104} |
  Select TimeCreated, Id, Message

# Local admins
net localgroup administrators

# Running processes
Get-Process | Sort-Object CPU -desc | Select -First 15 Name, Id, CPU

```

---

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
