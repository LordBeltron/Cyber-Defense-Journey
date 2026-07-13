# Module 04 – Enterprise DHCP Administration

---

# 1. Executive Summary

This module implemented Microsoft's Dynamic Host Configuration Protocol (DHCP) service within the Cyber Defense Journey (CDJ) enterprise. Prior to deployment, all client systems relied on manually assigned IPv4 addresses, which is manageable in a small environment but does not scale as additional workstations, servers, and network appliances are introduced.

The implementation established centralized IPv4 address management by deploying the DHCP Server role on the primary Domain Controller (CDJ-DC01), authorizing the service within Active Directory, creating an enterprise DHCP scope, configuring network options, and validating successful lease assignment from a domain-joined client.

During implementation, several real-world operational issues were encountered, including insufficient administrative permissions during DHCP authorization and the need to update the DHCP authorization object following a Domain Controller rename. Rather than bypassing these issues, each was investigated, resolved, validated, and documented as part of the engineering process.

Upon completion of this module, the enterprise gained automated IP address assignment, centralized client network configuration, and an addressing strategy capable of supporting future infrastructure expansion throughout the remaining phases of Cyber Defense Journey.

---

# 2. Business Problem

The Cyber Defense Journey enterprise initially relied on manually configured IPv4 addresses for all systems. While static addressing is appropriate for infrastructure servers and network appliances, assigning static addresses to every workstation becomes increasingly difficult as the environment grows.

Manual address management introduces several operational challenges:

- Increased administrative effort when deploying new workstations.
- Greater likelihood of duplicate IP addresses and configuration errors.
- Inconsistent client configuration across the environment.
- Difficulty modifying network settings at scale.
- Limited ability to support future enterprise growth.

Enterprise organizations solve this problem by deploying DHCP as a centralized infrastructure service responsible for automatically assigning IP addresses and distributing standardized network configuration to client devices.

Introducing DHCP also prepares the environment for future phases of Cyber Defense Journey, including file services, Public Key Infrastructure (PKI), Network Policy Server (NPS), Windows Server Update Services (WSUS), enterprise networking, cloud integration, and security operations. These technologies depend upon reliable and consistent client network configuration.

Implementing DHCP therefore addresses both an immediate operational requirement and establishes infrastructure that supports future enterprise capabilities.

---

# 3. Enterprise Capability Added

Following completion of this module, the Cyber Defense Journey enterprise now provides the following capabilities:

- Centralized IPv4 address management.
- Automatic IP address assignment for enterprise clients.
- Automatic subnet mask configuration.
- Automatic default gateway assignment.
- Automatic DNS server configuration.
- Automatic DNS suffix assignment.
- Active Directory integrated DHCP authorization.
- Centralized DHCP scope management.
- Standardized enterprise client network configuration.
- Scalable IP address allocation supporting future enterprise growth.

The enterprise now maintains a dedicated addressing strategy that separates infrastructure systems from dynamically assigned client devices.

### Infrastructure Address Space

| Purpose | Address Range |
|----------|---------------|
| Network Gateway (Future pfSense) | 10.0.10.1 |
| Enterprise Infrastructure | 10.0.10.2 – 10.0.10.99 |
| Domain Controller | 10.0.10.10 |
| Future Infrastructure Servers | 10.0.10.20 – 10.0.10.99 |

### Enterprise DHCP Scope

| Configuration | Value |
|---------------|-------|
| Scope Name | Enterprise Client Network |
| Network | 10.0.10.0/24 |
| DHCP Range | 10.0.10.100 – 10.0.10.200 |
| Lease Duration | 8 Days |

### DHCP Options

| Option | Configuration |
|---------|---------------|
| 003 | Router – 10.0.10.1 |
| 006 | DNS Server – 10.0.10.10 |
| 015 | DNS Domain – corp.local |

This design provides sufficient address space for future enterprise servers while allowing client systems to receive standardized network configuration automatically.

---

# 4. Module Objectives

The objectives for this module were to:

- Assess the existing enterprise infrastructure before deployment.
- Install the Microsoft DHCP Server role.
- Authorize the DHCP Server within Active Directory.
- Resolve any authorization or deployment issues encountered during implementation.
- Standardize the Domain Controller hostname to align with enterprise naming conventions.
- Update the DHCP authorization object following the server rename.
- Design an enterprise IPv4 addressing strategy.
- Create an enterprise DHCP scope.
- Configure DHCP options for gateway, DNS server, and DNS domain.
- Validate successful lease acquisition from a domain-joined client.
- Document the implementation according to Cyber Defense Journey engineering standards.

Successful completion of these objectives establishes centralized IP address management for the enterprise and provides the networking foundation required for future infrastructure services.

---

# 5. Assessment

## Objective

Verify that the existing enterprise environment is healthy and ready for DHCP deployment before introducing a new infrastructure service.

## Environment Assessment

Prior to installing DHCP, the following components were assessed.

### Domain Controller

- Server Name: DC01 (later renamed to CDJ-DC01)
- Operating System: Windows Server 2025
- Active Directory Domain Services: Operational
- DNS Server: Operational
- PowerShell Administration: Operational

### Network Configuration

The Domain Controller was confirmed to be configured with a static IPv4 address.

| Setting | Value |
|---------|-------|
| IPv4 Address | 10.0.10.10 |
| Subnet Mask | 255.255.255.0 |
| Preferred DNS | 10.0.10.10 |
| Alternate DNS | 127.0.0.1 |
| DHCP Enabled | No |

A static address is required for enterprise infrastructure servers that provide authentication and directory services.

### Active Directory

The Active Directory domain was verified to be operational.

| Configuration | Value |
|--------------|-------|
| Domain Name | corp.local |
| Directory Services | Operational |

### Installed Roles

The following Windows Server roles were confirmed prior to deployment:

- Active Directory Domain Services
- DNS Server
- Group Policy Management
- RSAT Administrative Tools

The DHCP Server role was confirmed **not** to be installed.

### Enterprise Assessment Summary

The assessment confirmed:

- Active Directory operating normally.
- DNS functioning correctly.
- Static addressing configured appropriately.
- No existing DHCP infrastructure present.
- Environment ready for DHCP deployment.

Performing this assessment established a known-good baseline before introducing a new enterprise infrastructure service and provided confidence that any issues encountered during deployment would likely be isolated to the implementation rather than existing infrastructure problems.

## Assessment Evidence

- 01-verify-network-configuration.png
- 02-verify-installed-roles.png
- 03-verify-domain-and-dhcp-status.png

---

# 6. Implementation

---

## Step 1 – Assess the Enterprise Environment

### Objective

Verify the existing enterprise infrastructure is healthy and ready for DHCP deployment before introducing a new core infrastructure service.

### Navigation

- Server Manager
- Windows PowerShell (Administrator)

### Procedure

Verify the server hostname.

```powershell
hostname
```

Review the current network configuration.

```powershell
ipconfig /all
```

Verify installed Windows Server roles.

```powershell
Get-WindowsFeature | Where Installed
```

Verify the Active Directory domain.

```powershell
(Get-ADDomain).DNSRoot
```

Confirm the DHCP Server role has not already been installed.

```powershell
Get-Service DHCPServer -ErrorAction SilentlyContinue
```

### Expected Result

The assessment should confirm:

- Active Directory Domain Services operational.
- DNS Server operational.
- Domain Controller configured with a static IP address.
- DHCP role not installed.
- Domain operating normally.

### Why This Matters

Infrastructure changes should always begin with a health assessment. Verifying the environment beforehand establishes a known-good baseline and helps isolate any issues encountered during deployment.

### Enterprise Best Practice

Assess infrastructure before making changes. Understanding the current state minimizes deployment risk and provides a reliable starting point for troubleshooting.

### Evidence

- 01-verify-network-configuration.png
- 02-verify-installed-roles.png
- 03-verify-domain-and-dhcp-status.png

---

## Step 2 – Install the DHCP Server Role

### Objective

Install the Microsoft DHCP Server role and its associated management tools.

### Navigation

- Windows PowerShell (Administrator)

### Procedure

Install the DHCP Server role.

```powershell
Install-WindowsFeature DHCP -IncludeManagementTools
```

After installation, verify that the DHCP Server role appears within the installed Windows Features.

```powershell
Get-WindowsFeature | Where Installed
```

### Expected Result

The DHCP Server role installs successfully and becomes available for authorization and configuration.

### Why This Matters

Installing the role provides the enterprise with the services required to centrally assign IPv4 addresses and distribute network configuration to client systems.

### Enterprise Best Practice

Only install infrastructure roles that support documented business requirements. Avoid unnecessary server roles to reduce operational complexity and attack surface.

### Evidence

- 04-install-dhcp-role.png

---

## Step 3 – Authorize the DHCP Server

### Objective

Authorize the DHCP Server within Active Directory so it can issue IP leases to enterprise clients.

### Navigation

- Windows PowerShell (Administrator)

### Procedure

Authorize the DHCP Server.

```powershell
Add-DhcpServerInDC -DnsName "DC01.corp.local" -IPAddress 10.0.10.10
```

Verify authorization.

```powershell
Get-DhcpServerInDC
```

#### Troubleshooting

The initial authorization failed with:

```
WIN32 5
Access Denied
```

Administrative privileges were investigated.

Verify the current account.

```powershell
whoami
```

Review group membership.

```powershell
net user vboxuser /domain
```

The deployment account was found to be a member of **Domain Users** only.

Add the account to **Domain Admins**.

```powershell
Add-ADGroupMember "Domain Admins" -Members vboxuser
```

Sign out and back in so the updated security token is applied.

Repeat the authorization procedure.

```powershell
Add-DhcpServerInDC -DnsName "DC01.corp.local" -IPAddress 10.0.10.10
```

Verify authorization.

```powershell
Get-DhcpServerInDC
```

### Expected Result

The DHCP Server appears as an authorized server within Active Directory.

### Why This Matters

Active Directory authorization prevents unauthorized DHCP servers from issuing network configuration and protects the enterprise from rogue DHCP servers.

### Enterprise Best Practice

Verify administrative permissions before deploying infrastructure services that integrate with Active Directory.

### Evidence

- 05-add-vboxuser-domain-admins.png
- 06-authorize-dhcp-server.png

---

## Step 4 – Standardize the Domain Controller Name

### Objective

Rename the Domain Controller to align with Cyber Defense Journey enterprise naming standards.

### Navigation

- Windows PowerShell (Administrator)

### Procedure

Rename the server.

```powershell
Rename-Computer -NewName "CDJ-DC01" -Force
```

Restart the server.

```powershell
Restart-Computer
```

Verify the new hostname.

```powershell
hostname
```

Verify Active Directory recognizes the updated server name.

```powershell
Get-ADDomain
```

#### Troubleshooting

Following the rename, the DHCP authorization object still referenced the previous hostname.

Remove the previous authorization entry.

```powershell
Remove-DhcpServerInDC -DnsName "dc01.corp.local" -IPAddress 10.0.10.10
```

Authorize the renamed server.

```powershell
Add-DhcpServerInDC -DnsName "CDJ-DC01.corp.local" -IPAddress 10.0.10.10
```

Verify the authorization.

```powershell
Get-DhcpServerInDC
```

### Expected Result

The Domain Controller operates using the standardized hostname **CDJ-DC01**, and the DHCP authorization object reflects the updated server name.

### Why This Matters

Consistent naming standards simplify administration, documentation, automation, and future infrastructure expansion.

### Enterprise Best Practice

Implement enterprise naming standards early in the infrastructure lifecycle to minimize downstream configuration changes.

### Evidence

- 07-rename-domain-controller.png
- 08-update-dhcp-authorization.png

---

## Step 5 – Create the Enterprise DHCP Scope

### Objective

Create an enterprise DHCP scope capable of supporting future workstation deployment.

### Navigation

- Windows PowerShell (Administrator)

### Procedure

Create the DHCP scope.

```powershell
Add-DhcpServerv4Scope -Name "Enterprise Client Network" -StartRange 10.0.10.100 -EndRange 10.0.10.200 -SubnetMask 255.255.255.0 -State Active
```

Verify the scope.

```powershell
Get-DhcpServerv4Scope
```

### Expected Result

An active DHCP scope is created for the 10.0.10.0/24 network.

### Why This Matters

The DHCP scope defines the pool of addresses available for dynamic client assignment.

### Enterprise Best Practice

Reserve lower IP ranges for infrastructure servers while assigning client devices from a dedicated DHCP range to simplify administration and future expansion.

### Evidence

- 09-create-dhcp-scope.png

---

## Step 6 – Configure DHCP Scope Options

### Objective

Configure enterprise network settings distributed to DHCP clients.

### Navigation

- Windows PowerShell (Administrator)

### Procedure

Configure the default gateway.

```powershell
Set-DhcpServerv4OptionValue -ScopeId 10.0.10.0 -Router 10.0.10.1
```

Configure the DNS Server.

```powershell
Set-DhcpServerv4OptionValue -ScopeId 10.0.10.0 -DnsServer 10.0.10.10
```

Configure the DNS Domain.

```powershell
Set-DhcpServerv4OptionValue -ScopeId 10.0.10.0 -DnsDomain "corp.local"
```

Verify all DHCP options.

```powershell
Get-DhcpServerv4OptionValue -ScopeId 10.0.10.0
```

### Expected Result

The DHCP scope distributes:

- Router (10.0.10.1)
- DNS Server (10.0.10.10)
- DNS Domain (corp.local)

### Why This Matters

DHCP options provide client systems with the information required to communicate within the enterprise network and locate Active Directory resources.

### Enterprise Best Practice

Centralize client network configuration through DHCP rather than relying on manual workstation configuration.

### Evidence

- 10-configure-default-gateway.png
- 11-configure-dns-server.png
- 12-configure-dns-domain.png

---

## Step 7 – Validate Client DHCP Operation

### Objective

Verify that a domain-joined client successfully receives network configuration from the DHCP Server.

### Navigation

Windows 11 Enterprise Client

Windows PowerShell (Administrator)

### Procedure

Release the current DHCP lease.

```powershell
ipconfig /release
```

Request a new lease.

```powershell
ipconfig /renew
```

Review the assigned network configuration.

```powershell
ipconfig /all
```

Verify:

- DHCP Enabled = Yes
- IP Address assigned from 10.0.10.100–10.0.10.200
- DHCP Server = 10.0.10.10
- DNS Server = 10.0.10.10
- DNS Suffix = corp.local
- Default Gateway = 10.0.10.1

### Expected Result

The client successfully receives a DHCP lease and all configured network options.

### Why This Matters

Configuration alone does not demonstrate a functioning service. Successful client lease acquisition confirms the DHCP deployment is operational.

### Enterprise Best Practice

Always validate infrastructure services from the client perspective before considering an implementation complete.

### Evidence

- 13-client-received-dhcp-lease.png

---

# 7. Validation

The DHCP deployment was validated through both server-side verification and client-side testing to confirm the service was operating as intended.

## Server Validation

The following items were verified on the Domain Controller:

- DHCP Server role installed successfully.
- DHCP Server authorized within Active Directory.
- Domain Controller renamed successfully to **CDJ-DC01**.
- DHCP authorization updated following the server rename.
- DHCP scope created and active.
- Router option configured.
- DNS Server option configured.
- DNS Domain option configured.

PowerShell verification commands included:

```powershell
Get-DhcpServerInDC

Get-DhcpServerv4Scope

Get-DhcpServerv4OptionValue -ScopeId 10.0.10.0
```

These commands confirmed the DHCP service was configured correctly and authorized to issue leases.

---

## Client Validation

Validation continued from the enterprise workstation by requesting a new DHCP lease.

PowerShell commands used:

```powershell
ipconfig /release

ipconfig /renew

ipconfig /all
```

The workstation successfully received:

| Configuration | Expected | Result |
|--------------|----------|--------|
| DHCP Enabled | Yes | Pass |
| IPv4 Address | 10.0.10.100–200 | Pass |
| Subnet Mask | 255.255.255.0 | Pass |
| DHCP Server | 10.0.10.10 | Pass |
| DNS Server | 10.0.10.10 | Pass |
| DNS Suffix | corp.local | Pass |
| Default Gateway | 10.0.10.1 | Pass |

The successful lease confirmed the DHCP infrastructure was functioning correctly and capable of providing standardized network configuration to enterprise clients.

---

## Validation Outcome

Module validation confirmed:

- Enterprise DHCP infrastructure operational.
- Active Directory authorization functioning.
- Scope configuration functioning.
- DHCP options correctly distributed.
- Domain client successfully receiving enterprise network configuration.

The implementation was validated successfully and is considered production-ready within the Cyber Defense Journey enterprise.

---

# 8. Enterprise Value

Implementing DHCP introduced centralized IP address management into the Cyber Defense Journey enterprise.

Rather than manually configuring every client, network settings are now delivered automatically from a centrally managed infrastructure service. This simplifies workstation deployment, improves configuration consistency, and provides a scalable method for supporting additional systems as the enterprise expands.

The addressing strategy implemented during this module also establishes a clear separation between infrastructure servers and dynamically assigned client devices. Reserving the lower portion of the subnet for static infrastructure simplifies future server deployments while maintaining predictable addressing throughout the environment.

This capability forms a foundational dependency for later roadmap phases, including enterprise networking, file services, PKI, cloud integration, and security operations.

---

# 9. Enterprise Relevance

Dynamic Host Configuration Protocol is a core infrastructure service found in virtually every enterprise environment.

System administrators are responsible for designing DHCP scopes, authorizing DHCP servers, configuring network options, troubleshooting lease issues, and validating client connectivity.

This module demonstrates practical experience with:

- Windows Server administration
- Active Directory integration
- Enterprise IP address planning
- Infrastructure service deployment
- Client network troubleshooting
- PowerShell administration
- Infrastructure validation
- Operational documentation

These are common responsibilities for Systems Administrators, Infrastructure Engineers, Network Administrators, and Cybersecurity Engineers responsible for enterprise Windows environments.

---

# 10. Interview Readiness

After completing this module, I can confidently discuss:

- The purpose of DHCP within enterprise networks.
- The differences between static and dynamic IPv4 addressing.
- Designing an enterprise DHCP scope.
- Reserving address space for infrastructure growth.
- Active Directory DHCP authorization.
- Configuring DHCP options.
- Troubleshooting DHCP authorization failures.
- Diagnosing permission-related deployment issues.
- Validating DHCP deployments from both the server and client perspectives.
- Using PowerShell to deploy and administer Windows Server infrastructure.

I can also explain the reasoning behind the addressing strategy selected for the Cyber Defense Journey enterprise and describe how DHCP supports future infrastructure growth.

---

# 11. Lessons Learned

- Enterprise infrastructure should always be assessed before introducing new services.
- Active Directory authorization is required before a DHCP server can issue leases.
- Administrative permissions should be verified before performing infrastructure deployments.
- Infrastructure naming standards should be established early to minimize downstream changes.
- Renaming infrastructure servers may require updates to dependent services such as DHCP authorization objects.
- Separating infrastructure and client address ranges simplifies administration and supports future expansion.
- Infrastructure deployments should always be validated from both the server and client perspective.
- Successful engineering requires not only implementation but also troubleshooting, validation, and documentation.

---

# 12. Next Module

## Module 05 – DHCP Reservations & Scope Management

The next module expands the enterprise DHCP deployment by introducing reservation management and advanced scope administration.

Topics include:

- DHCP reservations
- Exclusion ranges
- Lease duration management
- Scope modification
- Scope monitoring
- DHCP database maintenance
- DHCP backup and restoration
- Enterprise IP address management strategies

Upon completion of Module 05, the Cyber Defense Journey enterprise will provide both centralized dynamic addressing and controlled static reservations for infrastructure devices requiring predictable network identities.

---

## Module Completion Summary

**Status:** Complete

### Enterprise Capability Added

- Centralized DHCP infrastructure
- Active Directory integrated DHCP authorization
- Enterprise DHCP scope
- Standardized DHCP options
- Automated client network configuration
- Enterprise IP addressing strategy

### Deliverables Completed

- README
- Engineering Implementation
- Validation
- Evidence Collection

### Remaining Deliverables

- Runbook
- PowerShell Automation
- Lab Notes
- Git Commit

The Cyber Defense Journey enterprise now provides centralized IP address management and is prepared to support additional infrastructure services introduced during the remaining Phase 02 modules.