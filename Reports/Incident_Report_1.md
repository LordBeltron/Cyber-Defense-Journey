# Incident Report #1 – Suspicious PowerShell Execution

**Date:** YYYY-MM-DD  
**Analyst:** Zac Belchar  

## 1. Summary
Detected multiple PowerShell commands attempting to download remote scripts. Alert triggered by Splunk correlation rule.

## 2. Artifacts
- Source IP: 192.168.1.55  
- Destination: maliciousdomain[.]com  
- Log Source: Windows Event Logs  

## 3. Analysis
Used Splunk query:
```
index=windows sourcetype=WinEventLog:Security EventCode=4104
| search powershell
| stats count by user, host
```

## 4. Response
- Blocked domain at firewall
- Isolated affected host
- Updated detection rule for similar patterns

## 5. Lessons Learned
Need to implement stricter PowerShell execution policies.
