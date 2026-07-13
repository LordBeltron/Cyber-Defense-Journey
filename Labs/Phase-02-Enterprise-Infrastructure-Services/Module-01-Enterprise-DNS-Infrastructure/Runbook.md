# Runbook - Enterprise DNS Infrastructure

---

# Purpose

This runbook provides the operational procedure for assessing, validating, and implementing enterprise DNS infrastructure within the Cyber Defense Journey Active Directory environment.

The procedure verifies the operational health of the existing DNS deployment, inventories DNS configuration, implements an enterprise Reverse Lookup Zone, and validates both forward and reverse DNS resolution.

---

# Scope

This procedure applies to:

- Windows Server 2025
- Active Directory Domain Services
- DNS Server
- PowerShell
- Enterprise DNS Infrastructure

---

# Prerequisites

Before beginning, verify:

- Windows Server 2025 is operational.
- Active Directory Domain Services has been installed.
- DNS Server role is present.
- PowerShell is running as Administrator.
- Domain Controller is online.

---

# Procedure

---

## Step 1 – Verify the DNS Server Role

### Objective

Confirm that the DNS Server role is installed.

### Command

```powershell
Get-WindowsFeature DNS
```

### Expected Result

```
[X] DNS Server
```

### Verification

The DNS Server role is installed and available.

### Evidence

```
Evidence/
└── 01-dns-role-and-service-validation.png
```

---

## Step 2 – Verify the DNS Service

### Objective

Confirm that the DNS service is operational.

### Command

```powershell
Get-Service DNS
```

### Expected Result

```
Status : Running
```

### Verification

The DNS Server service is actively running.

### Evidence

```
Evidence/
└── 01-dns-role-and-service-validation.png
```

---

## Step 3 – Inventory DNS Zones

### Objective

Review all DNS zones hosted by the server.

### Command

```powershell
Get-DnsServerZone
```

### Expected Result

The following zones should exist:

```
corp.local

_msdcs.corp.local

0.in-addr.arpa

127.in-addr.arpa

255.in-addr.arpa
```

### Verification

Enterprise DNS zones have been successfully inventoried.

### Evidence

```
Evidence/
└── 02-dns-zone-inventory.png
```

---

## Step 4 – Review Enterprise Resource Records

### Objective

Review DNS resource records within the enterprise DNS zone.

### Command

```powershell
Get-DnsServerResourceRecord -ZoneName "corp.local"
```

### Expected Result

Records including:

- A
- AAAA
- NS
- SOA
- SRV

### Verification

Critical Active Directory resource records are present.

### Evidence

```
Evidence/
└── 03-corp-local-resource-records.png
```

---

## Step 5 – Validate Forward DNS Resolution

### Objective

Confirm that the Domain Controller resolves successfully.

### Command

```powershell
Resolve-DnsName dc01.corp.local
```

### Expected Result

```
DC01.corp.local

↓

10.0.2.15
```

### Verification

Forward DNS resolution is functioning correctly.

### Evidence

```
Evidence/
└── 04-dc01-name-resolution.png
```