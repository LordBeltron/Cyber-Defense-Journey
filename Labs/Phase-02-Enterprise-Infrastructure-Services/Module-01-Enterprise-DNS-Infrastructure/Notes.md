# Lab Notes - Module 01 - Enterprise DNS Infrastructure

---

# Key Concepts

## Why is DNS important?

Active Directory depends on DNS for nearly every core function.

Without DNS:

- Clients cannot locate Domain Controllers.
- Kerberos authentication fails.
- LDAP queries fail.
- Group Policy processing fails.
- Domain joins fail.

Microsoft often says:

> Active Directory is DNS.

While technically separate services, Active Directory cannot function correctly without properly configured DNS.

---

## Forward vs Reverse Lookup

Forward Lookup

```
Hostname
      ↓
IP Address
```

Example:

```
dc01.corp.local

↓

10.0.2.15
```

Uses:

- A Records
- AAAA Records

---

Reverse Lookup

```
IP Address

↓

Hostname
```

Example:

```
10.0.2.15

↓

dc01.corp.local
```

Uses:

- PTR Records

---

## Why implement Reverse Lookup Zones?

Although Active Directory does not require Reverse Lookup Zones to operate, they are considered an enterprise best practice.

Many enterprise tools rely on reverse DNS.

Examples include:

- SIEM platforms (Splunk)
- Wazuh
- Network Monitoring
- Endpoint Detection & Response (EDR)
- Security Appliances
- Vulnerability Scanners
- Incident Response
- Log Analysis

Reverse lookups make logs significantly easier to interpret because administrators see hostnames instead of raw IP addresses.

---

# Active Directory DNS Zones

## corp.local

Primary enterprise DNS namespace.

Contains records for:

- Domain Controllers
- Servers
- Clients
- Enterprise Services

---

## _msdcs.corp.local

Automatically managed by Active Directory.

Contains SRV records used for:

- Kerberos
- LDAP
- Domain Controller Discovery
- Global Catalog
- Replication

Administrators typically do not modify this zone manually.

---

# Important DNS Records

## A Record

Hostname → IPv4

---

## AAAA Record

Hostname → IPv6

---

## PTR Record

IPv4 → Hostname

---

## SRV Record

Allows Windows clients to locate enterprise services such as:

- LDAP
- Kerberos
- Global Catalog

These records are one of the primary reasons Active Directory depends on DNS.

---

## SOA Record

Start Of Authority

Defines:

- Primary DNS Server
- Refresh Interval
- Retry Interval
- Expiration

Every DNS zone contains exactly one SOA record.

---

## NS Record

Specifies the authoritative DNS server for the zone.

---

# Interview Questions

## How would you verify a DNS server is healthy?

A structured assessment should include:

- Verify the DNS Server role.
- Verify the DNS service.
- Inventory DNS zones.
- Review DNS resource records.
- Validate forward DNS.
- Validate reverse DNS.

---

## What's the difference between forward and reverse lookup?

Forward lookup resolves:

Hostname → IP Address

Reverse lookup resolves:

IP Address → Hostname

---

## Why is DNS critical to Active Directory?

Active Directory uses DNS SRV records to locate:

- LDAP
- Kerberos
- Domain Controllers
- Global Catalog

Without DNS, authentication and Group Policy processing cannot function.

---

## Why create a Reverse Lookup Zone?

Reverse Lookup Zones improve:

- Troubleshooting
- Logging
- Security monitoring
- Incident Response
- Enterprise visibility

They allow administrators and security tools to identify systems by hostname rather than IP address.

---

# Enterprise Best Practices

Always:

- Assess before changing.
- Validate before documenting.
- Document before closing the change.
- Capture evidence throughout the implementation.

---

# Operational Workflow

Every infrastructure module should follow:

Assessment

↓

Implementation

↓

Validation

↓

Documentation

↓

Automation

---

# Commands Worth Remembering

```powershell
Get-WindowsFeature DNS

Get-Service DNS

Get-DnsServerZone

Get-DnsServerResourceRecord -ZoneName "corp.local"

Resolve-DnsName dc01.corp.local

Resolve-DnsName 10.0.2.15

ipconfig
```

---

# Things Worth Remembering

The best lesson from this module:

> Enterprise administrators rarely begin by installing infrastructure.

Instead, they first understand what already exists.

Assessment is often more valuable than configuration.