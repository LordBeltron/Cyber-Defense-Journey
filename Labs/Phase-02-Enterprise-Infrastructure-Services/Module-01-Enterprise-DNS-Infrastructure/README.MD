# Module 01 - Enterprise DNS Infrastructure

## Executive Summary

This module established the enterprise Domain Name System (DNS) infrastructure that supports the Active Directory environment within the Cyber Defense Journey enterprise. Rather than deploying DNS from scratch, the existing Active Directory-integrated DNS infrastructure was assessed, validated, and expanded to meet enterprise operational standards.

The assessment verified that the DNS Server role and service were functioning correctly, inventoried Active Directory-integrated DNS zones, reviewed critical DNS resource records, and validated forward name resolution for the Domain Controller. The implementation phase enhanced the environment by creating an enterprise reverse lookup zone to support reverse DNS resolution. Finally, both forward and reverse lookups were validated to confirm that the infrastructure was operating correctly.

This module introduces a structured engineering workflow consisting of **Assessment**, **Implementation**, and **Validation**, mirroring the operational practices used by enterprise Windows Infrastructure teams. Rather than making configuration changes immediately, the existing environment was first understood, documented, and verified before any modifications were performed.

Upon completion of this module, the enterprise gained a fully validated DNS infrastructure capable of supporting current Active Directory operations while providing the foundation for future infrastructure services including DHCP, file services, Public Key Infrastructure (PKI), monitoring platforms, and additional enterprise servers.

---

# Business Problem

Active Directory depends on DNS for virtually every authentication and directory service operation. Domain joins, Kerberos authentication, Group Policy processing, LDAP queries, and Domain Controller discovery all rely on accurate and reliable DNS name resolution.

Although DNS had already been installed during the Active Directory deployment process, the enterprise had not yet verified its operational health or documented its configuration. Before introducing additional infrastructure services such as DHCP, file servers, monitoring platforms, and security appliances, the organization needed confidence that its DNS environment was functioning correctly.

Additionally, reverse DNS resolution had not been configured for the enterprise subnet. While Active Directory can operate without a reverse lookup zone, many enterprise security, monitoring, logging, and troubleshooting tools depend on reverse DNS records to accurately identify hosts during operational and incident response activities.

This module addressed these requirements by validating the existing DNS infrastructure, implementing an enterprise reverse lookup zone, and confirming both forward and reverse name resolution.

---

# Enterprise Capability Added

**Enterprise Name Resolution Infrastructure**

Upon completion of this module, the Cyber Defense Journey enterprise gained:

- Active Directory-integrated DNS validation
- Enterprise DNS operational assessment procedures
- Forward DNS resolution validation
- Reverse DNS resolution capability
- Reverse Lookup Zone administration
- DNS configuration inventory documentation
- Enterprise DNS validation procedures
- Operational baseline documentation for future infrastructure services

These capabilities establish the foundational name resolution services required by every additional enterprise component that will be deployed throughout future phases of the project.

---

# Module Objectives

The objectives of this module were to:

- Verify that the DNS Server role was installed.
- Validate that the DNS Server service was operational.
- Inventory existing DNS zones.
- Examine Active Directory DNS resource records.
- Validate forward DNS name resolution.
- Create an enterprise Reverse Lookup Zone.
- Validate reverse DNS resolution using PTR records.
- Document the operational state of the enterprise DNS infrastructure.

---

# Assessment

The first phase of the module focused on assessing the existing DNS infrastructure before making any configuration changes. This mirrors enterprise operational practices where administrators first establish a baseline of the environment prior to implementing modifications.

---

## Step 1 - Verify the DNS Server Role

### Objective

Confirm that the Windows Server is configured to provide DNS services.

### Command

```powershell
Get-WindowsFeature DNS
```

### Result

The DNS Server role was confirmed to be installed on the Domain Controller.

### Why This Matters

Active Directory relies heavily on DNS for authentication, service discovery, and directory operations. Verifying the server role confirms that the system is capable of providing enterprise name resolution services before additional validation is performed.

### Operational Value

This serves as the initial infrastructure health check performed when assessing an existing Windows Server environment.

### Evidence

```
Evidence/01-dns-role-and-service-validation.png
```

---

## Step 2 - Verify the DNS Service

### Objective

Confirm that the DNS service is currently running.

### Command

```powershell
Get-Service DNS
```

### Result

The DNS service was confirmed to be running successfully.

### Why This Matters

Installing the DNS role alone does not guarantee that DNS services are operational. Verifying the service ensures that the server is actively responding to client DNS requests.

### Operational Value

Enterprise administrators routinely validate service health before reviewing configuration or making infrastructure changes.

### Evidence

```
Evidence/01-dns-role-and-service-validation.png
```

---

## Step 3 - Inventory Existing DNS Zones

### Objective

Identify every DNS zone hosted by the server.

### Command

```powershell
Get-DnsServerZone
```

### Result

The assessment identified the following zones:

- corp.local
- _msdcs.corp.local
- 0.in-addr.arpa
- 127.in-addr.arpa
- 255.in-addr.arpa

### Why This Matters

Inventorying DNS zones provides visibility into the existing configuration and identifies which zones are automatically managed by Active Directory versus administrator-managed zones.

Understanding the current environment helps prevent accidental modification of critical infrastructure.

### Operational Value

DNS inventory is commonly performed during infrastructure assessments, migration planning, troubleshooting, and security audits.

### Evidence

```
Evidence/02-dns-zone-inventory.png
```

---

## Step 4 - Review Enterprise Resource Records

### Objective

Examine the DNS resource records stored within the enterprise DNS zone.

### Command

```powershell
Get-DnsServerResourceRecord -ZoneName "corp.local"
```

### Result

The enterprise DNS zone contained the expected records, including:

- A Records
- AAAA Records
- NS Record
- SOA Record
- SRV Records

Critical Active Directory SRV records for LDAP, Kerberos, Global Catalog, and password services were present.

### Why This Matters

These records allow Windows clients to automatically locate Domain Controllers and essential Active Directory services without relying on static IP addresses.

### Operational Value

Reviewing DNS resource records verifies that the enterprise DNS infrastructure can support authentication, Group Policy processing, and future infrastructure services.

### Evidence

```
Evidence/03-corp-local-resource-records.png
```

---

## Step 5 - Validate Forward Name Resolution

### Objective

Confirm that clients can successfully resolve the Domain Controller using DNS.

### Command

```powershell
Resolve-DnsName dc01.corp.local
```

### Result

The Domain Controller successfully resolved to both IPv4 and IPv6 addresses.

### Why This Matters

Forward name resolution validates that enterprise clients can locate critical infrastructure services through DNS.

### Operational Value

Forward lookup testing is one of the most common validation procedures performed after DNS deployment or configuration changes.

### Evidence

```
Evidence/04-dc01-name-resolution.png
```

---

# Implementation

After validating the operational health of the existing DNS infrastructure, the enterprise DNS environment was enhanced by implementing a Reverse Lookup Zone for the production subnet.

Unlike the automatically created infrastructure reverse lookup zones installed by Windows, this zone provides reverse name resolution for enterprise systems operating on the organization's network.

---

## Step 6 - Determine the Enterprise Network

### Objective

Identify the IPv4 network used by the Domain Controller.

### Command

```powershell
ipconfig
```

### Result

The Domain Controller was configured with:

- IPv4 Address: **10.0.2.15**
- Subnet Mask: **255.255.255.0**

This identified the enterprise subnet as:

```
10.0.2.0/24
```

### Why This Matters

A Reverse Lookup Zone must correspond to the network being administered. Identifying the correct subnet ensures reverse DNS queries are directed to the appropriate DNS zone.

### Operational Value

Network identification is a standard prerequisite before creating DHCP scopes, reverse lookup zones, routing policies, firewall rules, and other infrastructure services.

### Evidence

```
Evidence/05-server-ip-configuration.png
```

---

## Step 7 - Create the Enterprise Reverse Lookup Zone

### Objective

Deploy a Reverse Lookup Zone for the enterprise subnet.

### Command

```powershell
Add-DnsServerPrimaryZone `
    -NetworkId "10.0.2.0/24" `
    -ReplicationScope Domain
```

### Result

A new Active Directory-integrated Reverse Lookup Zone was successfully created.

```
2.0.10.in-addr.arpa
```

### Why This Matters

Reverse Lookup Zones translate IP addresses back into hostnames using PTR records.

While forward lookups allow systems to locate servers, reverse lookups allow administrators, monitoring platforms, security tools, and logging systems to identify hosts associated with IP addresses.

### Operational Value

Reverse DNS is widely used by:

- SIEM platforms
- Endpoint Detection and Response (EDR)
- Network monitoring systems
- Vulnerability scanners
- Security investigations
- Troubleshooting utilities

Although Active Directory can function without a reverse lookup zone, implementing one is considered an enterprise best practice.

### Evidence

```
Evidence/06-create-reverse-lookup-zone.png
```

---

# Validation

Following implementation, the DNS configuration was validated to ensure the Reverse Lookup Zone had been successfully deployed and was functioning as expected.

---

## Step 8 - Verify the Reverse Lookup Zone

### Objective

Confirm that the new Reverse Lookup Zone exists within the DNS server configuration.

### Command

```powershell
Get-DnsServerZone
```

### Result

The newly created zone appeared within the DNS server inventory.

```
2.0.10.in-addr.arpa
```

### Why This Matters

Verifying the zone confirms that the DNS configuration change was successfully committed and replicated within Active Directory.

### Operational Value

Configuration verification is a required step following any infrastructure modification and supports change management and operational documentation.

### Evidence

```
Evidence/07-reverse-zone-verification.png
```

---

## Step 9 - Validate Reverse DNS Resolution

### Objective

Confirm that reverse DNS queries correctly resolve enterprise hosts.

### Command

```powershell
Resolve-DnsName 10.0.2.15
```

### Result

The PTR record successfully resolved:

```
10.0.2.15

↓

DC01.corp.local
```

### Why This Matters

Successful reverse resolution confirms that clients and enterprise tools can translate IP addresses back into hostnames.

This validation proves that both forward and reverse DNS resolution are functioning correctly.

### Operational Value

Reverse DNS validation is commonly performed after DNS deployments and is frequently referenced during troubleshooting, security investigations, incident response activities, and infrastructure audits.

### Evidence

```
Evidence/08-reverse-dns-validation.png
```

---

# Enterprise Value

Enterprise DNS is one of the most critical infrastructure services within a Windows environment. Nearly every enterprise technology—including Active Directory, Group Policy, Kerberos, LDAP, DHCP, PKI, file services, monitoring platforms, and cloud integrations—depends on reliable DNS services.

By validating and documenting the existing DNS infrastructure before making configuration changes, this module followed a structured engineering approach that reduces operational risk and supports effective change management.

Implementing an enterprise Reverse Lookup Zone further improved the environment by providing reverse DNS resolution capabilities used by monitoring platforms, SIEM solutions, endpoint security products, network management systems, and troubleshooting utilities.

Rather than simply configuring DNS, this module established operational confidence in the enterprise name resolution infrastructure while documenting a repeatable validation process for future administrators.

---

# Enterprise Relevance

The procedures completed during this module closely resemble tasks routinely performed by Windows Infrastructure Engineers, Systems Administrators, and Enterprise Support teams.

Common real-world scenarios include:

- Verifying DNS health after Active Directory deployment.
- Assessing inherited enterprise infrastructure.
- Performing DNS validation during system migrations.
- Implementing reverse lookup zones for enterprise networks.
- Troubleshooting authentication and Group Policy issues.
- Supporting security monitoring and incident response investigations.
- Preparing infrastructure for additional enterprise services.

The assessment, implementation, and validation workflow used throughout this module reflects operational practices commonly found within production enterprise environments.

---

# Interview Readiness

This module provides practical experience discussing enterprise DNS administration during technical interviews.

Example interview questions that can now be answered confidently include:

### How would you verify that a DNS server is functioning correctly?

A structured assessment should include verifying that the DNS Server role is installed, confirming that the DNS service is running, inventorying existing DNS zones, reviewing resource records, and validating forward and reverse DNS resolution.

---

### Why is DNS critical to Active Directory?

Active Directory relies on DNS to locate Domain Controllers and essential services such as LDAP, Kerberos, the Global Catalog, and Group Policy processing. Rather than relying on static IP addresses, Windows clients query DNS to dynamically locate these services.

---

### What is the difference between forward and reverse DNS?

Forward DNS resolves hostnames to IP addresses using A and AAAA records.

Reverse DNS resolves IP addresses back to hostnames using PTR records stored within Reverse Lookup Zones.

Forward resolution allows clients to locate servers, while reverse resolution assists with administration, troubleshooting, monitoring, logging, and security operations.

---

### Why would an enterprise implement Reverse Lookup Zones?

Reverse Lookup Zones improve infrastructure management by allowing administrators and enterprise tools to identify systems by hostname instead of IP address.

This capability is commonly leveraged by:

- Security Information and Event Management (SIEM) platforms
- Endpoint Detection and Response (EDR) solutions
- Network monitoring systems
- Vulnerability scanners
- Incident response teams
- Infrastructure troubleshooting utilities

---

# Lessons Learned

This module reinforced that enterprise administration begins with understanding the current environment before making configuration changes.

Rather than immediately modifying infrastructure, operational assessments provide administrators with the information needed to make informed decisions while minimizing risk.

Creating and validating a Reverse Lookup Zone also demonstrated that seemingly small configuration changes can provide substantial operational benefits for monitoring, troubleshooting, and future security tooling.

Perhaps the most important takeaway from this module was recognizing that DNS is not simply another Windows Server role—it is one of the foundational services upon which nearly every enterprise workload depends.

---

# Next Module

## Module 02 - Enterprise DNS Records

The next module expands upon the infrastructure deployed here by focusing on the administration of enterprise DNS resource records.

Topics include:

- A Records
- AAAA Records
- PTR Records
- CNAME Records
- NS Records
- MX Records
- TXT Records
- SRV Records

Upon completion of Module 02, the Cyber Defense Journey enterprise will gain the ability to administer and document enterprise DNS records supporting servers, workstations, applications, and future infrastructure services.