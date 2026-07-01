# Runbook: Group Policy Reporting

---

# Purpose

This runbook provides the operational procedure for generating, validating, and organizing Group Policy reports within the Cyber Defense Journey Active Directory environment.

---

# Scope

This procedure applies to:

- Windows Server 2025
- Active Directory
- Group Policy
- PowerShell

---

# Prerequisites

Before beginning, verify:

- Domain Controller is online.
- Group Policy PowerShell module is installed.
- Administrative credentials are available.
- PowerShell is running as Administrator.

Verify:

```powershell
Get-GPO -All
```

Expected Result:

A list of all Group Policy Objects.

---

# Procedure

---

## Step 1 – Create Reporting Repository

### Command

```powershell
New-Item -ItemType Directory -Path "C:\GPO-Reports"
```

### Verify

```powershell
Get-ChildItem C:\
```

Expected Result

```
GPO-Reports
```

Evidence

```
Evidence/
└── 01-report-repository-created.png
```

---

## Step 2 – Generate HTML Report

### Command

```powershell
Get-GPOReport `
-Name "HR Security Policy" `
-ReportType Html `
-Path "C:\GPO-Reports\HR-Security-Policy.html"
```

### Verify

```powershell
Get-ChildItem C:\GPO-Reports
```

Expected Result

```
HR-Security-Policy.html
```

Evidence

```
Evidence/
└── 02-html-report-generated.png
```

---

## Step 3 – Verify Report Generation

### Command

```powershell
Get-ChildItem "C:\GPO-Reports"
```

Expected Result

```
HR-Security-Policy.html
```

Evidence

```
Evidence/
└── 05-report-file-verification.png
```

---

## Step 4 – Attempt Local Review

### Command

```powershell
Invoke-Item "C:\GPO-Reports\HR-Security-Policy.html"
```

Expected Result

Server Core returns an error because no graphical browser is installed.

This is expected behavior.

Evidence

```
Evidence/
└── 04-html-open-failed-server-core.png
```

---

## Step 5 – Generate XML Report

### Command

```powershell
Get-GPOReport `
-Name "HR Security Policy" `
-ReportType Xml `
-Path "C:\GPO-Reports\HR-Security-Policy.xml"
```

### Verify

```powershell
Get-ChildItem C:\GPO-Reports
```

Expected Result

```
HR-Security-Policy.xml
```

Evidence

```
Evidence/
└── 06-xml-report-generated.png
```

---

## Step 6 – Generate Additional Reports

### Command

```powershell
Get-GPOReport `
-Name "Managed Devices Security Policy" `
-ReportType Html `
-Path "C:\GPO-Reports\Managed-Devices-Security-Policy.html"

Get-GPOReport `
-Name "Managed Devices Security Policy" `
-ReportType Xml `
-Path "C:\GPO-Reports\Managed-Devices-Security-Policy.xml"
```

### Verify

```powershell
Get-ChildItem C:\GPO-Reports
```

Expected Result

```
HR-Security-Policy.html

HR-Security-Policy.xml

Managed-Devices-Security-Policy.html

Managed-Devices-Security-Policy.xml
```

Evidence

```
Evidence/
├── 08-multiple-gpo-reports-generated.png
└── 09-complete-gpo-report-repository.png
```

---

## Step 7 – Generate Domain Inventory

### Command

```powershell
Get-GPO -All |
Select-Object DisplayName,CreationTime,ModificationTime,GpoStatus,Owner |
Sort-Object DisplayName |
Export-Csv "C:\GPO-Reports\Domain-GPO-Inventory.csv" -NoTypeInformation
```

### Verify

```powershell
Get-ChildItem C:\GPO-Reports
```

Expected Result

```
Domain-GPO-Inventory.csv
```

Evidence

```
Evidence/
└── 10-domain-gpo-inventory-created.png
```

---

## Step 8 – Analyze Group Policy Environment

### Command

```powershell
Get-GPO -All |
Select-Object `
DisplayName,
Owner,
GpoStatus,
CreationTime,
ModificationTime |
Sort-Object ModificationTime -Descending |
Format-Table -AutoSize
```

Expected Result

PowerShell displays:

- Display Name
- Owner
- Status
- Creation Date
- Modification Date

Evidence

```
Evidence/
└── 11-gpo-analysis-report.png
```

---

# Validation Checklist

Confirm the following:

- [ ] Reporting repository exists.
- [ ] HTML reports generated.
- [ ] XML reports generated.
- [ ] CSV inventory generated.
- [ ] Reports verified.
- [ ] PowerShell analysis completed.
- [ ] Evidence captured.

---

# Generated Artifacts

```
C:\GPO-Reports

├── HR-Security-Policy.html
├── HR-Security-Policy.xml
├── Managed-Devices-Security-Policy.html
├── Managed-Devices-Security-Policy.xml
└── Domain-GPO-Inventory.csv
```

---

# Troubleshooting

## HTML Report Will Not Open

Cause

Windows Server Core has no graphical browser.

Resolution

Verify report creation with:

```powershell
Get-ChildItem C:\GPO-Reports
```

Copy the report to a Windows workstation if visual review is required.

---

## Report Missing

Verify the report path:

```powershell
Get-ChildItem C:\GPO-Reports
```

If missing:

- Verify the GPO name.
- Verify administrative privileges.
- Regenerate the report.

---

## Permission Error

Verify PowerShell is running as Administrator.

Confirm:

```powershell
Get-GPO -All
```

---

# Completion Criteria

The runbook is complete when:

- HTML reports have been generated.
- XML reports have been generated.
- CSV inventory has been generated.
- Reports have been verified.
- PowerShell analysis has completed successfully.
- Evidence has been captured.
- Generated artifacts are present within the reporting repository.