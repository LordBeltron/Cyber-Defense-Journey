# Module 04 – Enterprise DHCP Administration Runbook

---

# Purpose

This runbook provides the operational procedures required to administer, monitor, validate, and troubleshoot the Microsoft DHCP Server deployed within the Cyber Defense Journey (CDJ) enterprise.

It is intended for administrators responsible for maintaining DHCP services after deployment.

Deployment procedures are documented in the module README and are not repeated here.

---

# Scope

This runbook applies to:

- CDJ-DC01
- Windows Server 2025
- Active Directory Domain Services
- Microsoft DHCP Server
- Enterprise Client Network (10.0.10.0/24)

---

# Service Overview

## DHCP Server

| Item | Value |
|-------|-------|
| Server | CDJ-DC01 |
| Service | Microsoft DHCP Server |
| Scope | Enterprise Client Network |
| Network | 10.0.10.0/24 |
| Address Pool | 10.0.10.100 – 10.0.10.200 |

---

## DHCP Options

| Option | Value |
|---------|-------|
| Router | 10.0.10.1 |
| DNS Server | 10.0.10.10 |
| DNS Domain | corp.local |

---

# Administrative Tools

## Graphical

- Server Manager
- DHCP Manager

## PowerShell

Windows PowerShell (Administrator)

---

# Daily Health Checks

## Verify DHCP Service

```powershell
Get-Service DHCPServer
```

Expected Result

```
Status : Running
```

---

## Verify DHCP Authorization

```powershell
Get-DhcpServerInDC
```

Expected Result

```
CDJ-DC01.corp.local
```

---

## Verify DHCP Scope

```powershell
Get-DhcpServerv4Scope
```

Verify:

- Scope exists
- Scope active
- Correct address range

---

## Verify DHCP Statistics

```powershell
Get-DhcpServerv4ScopeStatistics
```

Review:

- Addresses in use
- Addresses available
- Percentage utilized

---

# Lease Administration

## View Active Leases

```powershell
Get-DhcpServerv4Lease -ScopeId 10.0.10.0
```

---

## Search for a Lease

```powershell
Get-DhcpServerv4Lease -ScopeId 10.0.10.0 |
Where-Object IPAddress -eq "10.0.10.101"
```

---

## Remove a Lease

```powershell
Remove-DhcpServerv4Lease -IPAddress 10.0.10.101
```

---

# Client Validation

On a client workstation:

Release current lease.

```powershell
ipconfig /release
```

Renew lease.

```powershell
ipconfig /renew
```

Display assigned configuration.

```powershell
ipconfig /all
```

Verify:

- DHCP Enabled
- Correct IP Address
- Correct Gateway
- Correct DNS Server
- Correct DNS Suffix

---

# Service Restart

Restart the DHCP service.

```powershell
Restart-Service DHCPServer
```

Verify:

```powershell
Get-Service DHCPServer
```

---

# Common Operational Tasks

## Display Scope Configuration

```powershell
Get-DhcpServerv4Scope
```

---

## Display Scope Options

```powershell
Get-DhcpServerv4OptionValue -ScopeId 10.0.10.0
```

---

## Display Authorized DHCP Servers

```powershell
Get-DhcpServerInDC
```

---

## Display DHCP Server Configuration

```powershell
Get-DhcpServerSetting
```

---

# Troubleshooting

## Clients Not Receiving Addresses

Verify DHCP service.

```powershell
Get-Service DHCPServer
```

Verify scope exists.

```powershell
Get-DhcpServerv4Scope
```

Verify scope is active.

Verify addresses remain available.

```powershell
Get-DhcpServerv4ScopeStatistics
```

Verify server authorization.

```powershell
Get-DhcpServerInDC
```

---

## Authorization Failure

Symptom

```
WIN32 5
Access Denied
```

Possible Cause

Administrative account lacks Domain Admin privileges.

Verify account.

```powershell
whoami
```

Verify group membership.

```powershell
net user <username> /domain
```

---

## Incorrect Client Configuration

Verify DHCP options.

```powershell
Get-DhcpServerv4OptionValue -ScopeId 10.0.10.0
```

Confirm:

- Router
- DNS Server
- DNS Domain

---

# Backup

Export DHCP configuration.

```powershell
Export-DhcpServer `
-ComputerName CDJ-DC01 `
-File C:\Backups\DHCP-Backup.xml `
-Leases
```

---

# Restore

Restore DHCP configuration.

```powershell
Import-DhcpServer `
-ComputerName CDJ-DC01 `
-File C:\Backups\DHCP-Backup.xml `
-BackupPath C:\DHCPRestore
```

---

# Change Management

Before making configuration changes:

- Review current configuration.
- Export DHCP configuration.
- Verify Active Directory health.
- Record change details.
- Validate service after implementation.

---

# Operational Validation Checklist

Confirm:

- DHCP Service Running
- DHCP Authorized
- Scope Active
- Scope Options Correct
- Leases Issuing
- Client Receives Configuration
- DNS Resolution Functional

If every item above passes, the DHCP infrastructure is considered operational.

---

# References

- Module 04 README
- Microsoft DHCP Server Documentation
- Cyber Defense Journey Project Standards