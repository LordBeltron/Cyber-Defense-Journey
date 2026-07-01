# Lab Notes - GPO Reporting

**Module:** Week 1 - Day 3 - GPO Reporting

---

# Overview

This lab focused on generating, organizing, and analyzing Group Policy reports within a Windows Server 2025 Active Directory environment using PowerShell.

Rather than configuring Group Policy Objects, this exercise concentrated on documenting the environment through multiple reporting formats commonly used in enterprise administration, auditing, and compliance activities.

---

# Objectives

- Create a centralized reporting repository.
- Generate HTML Group Policy reports.
- Generate XML Group Policy reports.
- Generate reports for multiple Group Policy Objects.
- Produce a domain-wide Group Policy inventory.
- Analyze Group Policy metadata using PowerShell.
- Validate report generation.
- Document reporting procedures.

---

# Environment

Domain

```
corp.local
```

Domain Controller

```
DC01
```

Platform

- Windows Server 2025 Server Core
- Active Directory
- Group Policy
- PowerShell
- VirtualBox

---

# Activities Completed

## Created Reporting Repository

Created:

```
C:\GPO-Reports
```

This directory became the centralized location for all reporting artifacts.

---

## Generated HTML Reports

Created HTML reports for:

- HR Security Policy
- Managed Devices Security Policy

HTML reports provide administrator-friendly documentation suitable for audits and manual review.

---

## Generated XML Reports

Created XML reports for:

- HR Security Policy
- Managed Devices Security Policy

XML reports provide structured data that can be consumed by PowerShell scripts, compliance tools, and automation platforms.

---

## Generated Domain Inventory

Exported a CSV inventory containing:

- Display Name
- Owner
- Status
- Creation Date
- Modification Date

The inventory provides a high-level overview of every Group Policy Object within the environment.

---

## Performed Operational Analysis

Used PowerShell to review:

- Policy ownership
- Modification history
- Policy status

This simulates the type of reporting commonly performed before maintenance windows and change reviews.

---

# Key Commands Used

Create reporting repository

```powershell
New-Item -ItemType Directory -Path "C:\GPO-Reports"
```

Generate HTML report

```powershell
Get-GPOReport -Name "HR Security Policy" -ReportType Html -Path "C:\GPO-Reports\HR-Security-Policy.html"
```

Generate XML report

```powershell
Get-GPOReport -Name "HR Security Policy" -ReportType Xml -Path "C:\GPO-Reports\HR-Security-Policy.xml"
```

Generate inventory

```powershell
Get-GPO -All |
Select-Object DisplayName,CreationTime,ModificationTime,GpoStatus,Owner |
Export-Csv "C:\GPO-Reports\Domain-GPO-Inventory.csv"
```

Analyze GPOs

```powershell
Get-GPO -All |
Select-Object DisplayName,Owner,GpoStatus,CreationTime,ModificationTime |
Sort-Object ModificationTime -Descending
```

---

# Observations

Windows Server Core successfully generated all reports but could not display HTML reports locally because the operating system does not include a graphical web browser.

This reinforced the distinction between server administration and workstation administration. Production servers are optimized for security and stability rather than convenience.

Generating reports in multiple formats demonstrated that different stakeholders consume the same information differently. Administrators prefer HTML reports, automation platforms consume XML, and management often relies on CSV inventories for high-level reporting.

---

# Enterprise Relevance

The reporting workflow completed during this lab mirrors common enterprise administrative tasks.

Examples include:

- Quarterly security audits
- Compliance assessments
- Disaster recovery documentation
- Change Advisory Board (CAB) meetings
- Configuration reviews
- Operational reporting

Maintaining organized reporting repositories improves documentation quality while simplifying future administrative work.

---

# Lessons Learned

One of the biggest takeaways from this lab was recognizing that documentation is an operational responsibility rather than an afterthought.

Generating reports is only valuable if those reports are organized, validated, and easily accessible when needed.

I also gained a better understanding of how PowerShell supports enterprise reporting by automating documentation that would otherwise require significant manual effort.

---

# Next Steps

The reporting process established during this lab will support future modules involving:

- Security Filtering
- Backup & Recovery
- Compliance documentation
- SIEM integration
- Configuration auditing
- Enterprise reporting automation
