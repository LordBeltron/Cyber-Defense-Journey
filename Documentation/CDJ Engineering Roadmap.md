# CDJ Enterprise Roadmap

**Version:** 1.0

**Status:** Active

**Document Type:** Strategic Enterprise Competency Roadmap

**Project:** Cyber Defense Journey

---

# Purpose

The CDJ Enterprise Roadmap defines the long-term development of the Cyber Defense Journey enterprise.

Unlike traditional learning plans that organize content around certifications, vendors, or individual technologies, this roadmap is organized around enterprise capabilities.

Each phase introduces the infrastructure, security, identity, cloud, automation, governance, and engineering competencies required to build and operate a modern enterprise.

Technologies are introduced only when they support a legitimate business requirement.

As the enterprise matures, additional capabilities are added through structured implementation, practical engineering, and portfolio-quality documentation.

The objective is not simply to learn technology.

The objective is to build an enterprise while simultaneously developing the skills expected of a professional cybersecurity engineer.

---

# Roadmap Philosophy

Cyber Defense Journey is built around one guiding principle:

**Build the Enterprise. Build the Engineer.**

Every phase expands both.

The enterprise becomes more capable.

The engineer becomes more experienced.

Learning is achieved through implementation rather than memorization.

Every technology is built, validated, documented, automated where appropriate, and integrated into the larger enterprise architecture.

Nothing exists in isolation.

Every completed phase permanently strengthens the enterprise.

---

# Learning Progression

The long-term objective of Cyber Defense Journey is to develop the knowledge, experience, and engineering mindset commonly expected of a mid-level cybersecurity professional.

Every module intentionally begins with junior-level fundamentals before progressing toward enterprise implementation and engineering concepts.

Knowledge is developed through practical experience.

Each module follows the same progression.

```text
Junior Foundations

↓

Hands-on Administration

↓

Enterprise Implementation

↓

Operational Validation

↓

Engineering Context

↓

Mid-Level Engineering Thinking
```

The goal is to understand not only how technologies work, but why organizations implement them and how they support business operations.

---

# Enterprise Roadmap at a Glance

The roadmap is organized into five Enterprise Domains.

Each domain represents a major operational area within a modern enterprise.

## Enterprise Foundation

- Phase 01 — Enterprise Identity Administration
- Phase 02 — Enterprise Infrastructure Services
- Phase 03 — Enterprise Networking

Enterprise Capability

Build the core infrastructure required to support enterprise users, systems, and business services.

---

## Enterprise Identity

- Phase 04 — Enterprise Identity & Access Management
- Phase 05 — Cloud Security

Enterprise Capability

Extend identity into hybrid and cloud environments while implementing secure authentication, authorization, and governance.

---

## Enterprise Defense

- Phase 06 — Detection Engineering & SOC Operations
- Phase 07 — Incident Response & Digital Forensics
- Phase 08 — Malware Analysis & Reverse Engineering
- Phase 09 — Application Security

Enterprise Capability

Develop the ability to monitor, detect, investigate, respond to, and prevent cyber threats across the enterprise.

---

## Enterprise Engineering

- Phase 10 — DevSecOps & Automation
- Phase 11 — Programming & Automation
- Phase 12 — Linux Administration & Security
- Phase 13 — Governance, Risk & Compliance

Enterprise Capability

Build repeatable engineering practices through automation, secure development, operating system administration, and governance.

---

## Enterprise Intelligence

- Phase 14 — Data Engineering & Security Analytics
- Phase 15 — Enterprise Architecture & Professional Practice
- Phase 16 — Enterprise AI Security & Identity

Enterprise Capability

Leverage enterprise data, architecture, analytics, and artificial intelligence while maintaining security, governance, and operational excellence.

---

# Roadmap Structure

Every phase follows the same structure.

```text
Phase

↓

Phase Charter

↓

Modules

↓

Engineering Labs

↓

Engineering Artifacts

↓

Phase Capstone
```

## Phase Charter

Each phase begins with a strategic overview that defines:

- Business Objective
- Enterprise Capability
- Core Technologies
- Professional Competencies
- Expected Enterprise Outcomes
- Career Alignment
- Phase Capstone

The Phase Charter establishes the purpose of the phase before implementation begins.

---

## Modules

Each phase is divided into progressively structured modules.

Modules introduce individual technologies, engineering concepts, or operational capabilities that collectively build the enterprise capability defined by the phase.

Earlier modules establish foundational knowledge.

Later modules expand those foundations through increasingly realistic enterprise implementations.

---

## Engineering Labs

Every module contains one or more Engineering Labs.

Labs are where technologies are:

- Built
- Configured
- Validated
- Troubleshot
- Documented
- Automated

Hands-on implementation is the primary method of learning throughout Cyber Defense Journey.

---

## Engineering Artifacts

Every completed module produces a standardized set of engineering artifacts.

Required artifacts include:

- README.md
- Runbook.md
- PowerShell and/or Python Automation
- Lab Notes
- Evidence
- Architecture Diagrams (when applicable)
- Git Commit

These artifacts demonstrate successful implementation while creating a professional engineering portfolio.

---

## Phase Capstone

Every phase concludes with a capstone project.

The capstone integrates the technologies, engineering practices, and operational knowledge developed throughout the phase into a realistic enterprise implementation.

Each capstone should require the engineer to:

- Design
- Build
- Validate
- Troubleshoot
- Document
- Present

The completed capstone serves as a portfolio-quality demonstration of the enterprise capability developed during the phase.

---

With the roadmap established, the following chapters define each Enterprise Domain, Phase, Module, Engineering Lab, and Capstone Project in detail.

# Enterprise Domain I — Enterprise Foundation

The Enterprise Foundation establishes the technologies that every modern organization depends upon.

Identity, infrastructure, and networking form the operational core of the enterprise.

Every capability introduced throughout later phases depends upon the services established here.

Without a strong foundation, enterprise security, cloud identity, governance, monitoring, and automation cannot function effectively.

The objective of this domain is to build a secure, reliable, and manageable enterprise environment that can support future expansion.

---

# Phase 01 — Enterprise Identity Administration

## Business Objective

Establish centralized identity administration for the enterprise.

This phase introduces Microsoft Active Directory and the administrative capabilities required to manage users, computers, organizational structure, and security policies.

Identity serves as the control plane for the enterprise.

Every authenticated user, managed device, security policy, and administrative action introduced in later phases depends upon the identity services established here.

---

## Enterprise Capability

Upon completion of this phase, the enterprise will possess:

- Centralized identity management
- Centralized authentication
- Organizational management
- Group-based administration
- Enterprise policy management
- Secure workstation administration
- Standardized administrative procedures

These capabilities become the foundation for every future enterprise service.

---

## Core Technologies

### Directory Services

- Active Directory Domain Services (AD DS)

### Administrative Services

- Active Directory Users and Computers
- Active Directory Administrative Center
- Group Policy Management Console

### Windows Administration

- PowerShell
- Windows Server
- Windows Client Administration

### Enterprise Services

- Organizational Units
- Security Groups
- Group Policy Objects

---

## Professional Competencies

During this phase the engineer develops practical experience with:

- Identity administration
- User lifecycle management
- Group administration
- Organizational design
- Enterprise policy management
- Windows administration
- Administrative troubleshooting
- PowerShell administration
- Enterprise documentation

These competencies establish the administrative foundation required for every future phase.

---

# Module Roadmap

### Module 01

Enterprise Active Directory Architecture

---

### Module 02

Forests, Trees, Domains & Trusts

---

### Module 03

Active Directory Object Administration

---

### Module 04

Group Policy Administration

---

### Module 05

Password Policies

---

### Module 06

Group Policy Security Filtering

---

### Module 07

Group Policy Troubleshooting

---

### Module 08

Group Policy Backup & Recovery

---

### Module 09

Group Policy Reporting

---

### Module 10

Windows Event Forwarding

---

### Module 11

Windows Administration Fundamentals

---

### Module 12

Windows Internals

---

### Module 13

Sysinternals Suite

---

### Module 14

Windows Remote Management (WinRM)

---

### Module 15

Desired State Configuration (DSC)

---

### Module 16

Windows Firewall Administration

---

### Module 17

Windows Security Hardening

---

## Phase Capstone

Design, build, document, and secure a production-style Active Directory environment capable of supporting a small enterprise.

The capstone should include:

- Enterprise OU design
- User lifecycle implementation
- Group-based administration
- Group Policy deployment
- Security baseline implementation
- Administrative documentation
- PowerShell automation
- Validation testing
- Enterprise architecture diagram

The completed environment should demonstrate the operational identity foundation upon which the remainder of Cyber Defense Journey will be built.

---

## Enterprise Capability Gained

After completing Phase 01, the enterprise possesses a centralized identity platform capable of securely administering users, computers, and policies while supporting every subsequent phase within Cyber Defense Journey.

Identity is no longer a collection of local accounts.

It becomes a managed enterprise service.

# Phase 02 — Enterprise Infrastructure Services

## Business Objective

Deploy the core infrastructure services required to support enterprise authentication, resource discovery, network services, secure communication, and centralized file storage.

While Active Directory provides identity management, enterprise infrastructure services enable users, devices, and applications to reliably locate resources, obtain network configuration, securely communicate, and access shared data.

These services represent the operational backbone of the enterprise.

---

## Enterprise Capability

Upon completion of this phase, the enterprise will possess:

- Enterprise DNS services
- Enterprise DHCP services
- Centralized file services
- Secure file sharing
- Public Key Infrastructure
- Certificate lifecycle management
- Enterprise authentication support
- Infrastructure service resilience

These capabilities support nearly every enterprise workload introduced throughout the remainder of Cyber Defense Journey.

---

## Core Technologies

### Name Resolution

- Microsoft DNS
- Forward Lookup Zones
- Reverse Lookup Zones
- DNS Records
- Secure Dynamic Updates

### Network Services

- DHCP
- DHCP Reservations
- DHCP Scopes
- DHCP Options

### File Services

- File Server Role
- NTFS Permissions
- SMB Shares
- Distributed File System (DFS)

### Public Key Infrastructure

- Active Directory Certificate Services
- Certificate Templates
- Certificate Enrollment
- Certificate Revocation Lists (CRLs)
- Online Certificate Status Protocol (OCSP)

### Enterprise Infrastructure

- Network Policy Server (NPS)
- Remote Authentication (RADIUS)
- Windows Server Update Services (WSUS)
- Windows Failover Clustering

---

## Professional Competencies

Throughout this phase the engineer develops practical experience with:

- Enterprise name resolution
- IP address management
- File system administration
- Access control
- Certificate management
- Enterprise authentication
- Infrastructure troubleshooting
- Service validation
- Infrastructure documentation
- Infrastructure automation

These competencies establish the core infrastructure required for identity, networking, cloud services, and enterprise security.

---

# Module Roadmap

### Module 01

Enterprise DNS Infrastructure

---

### Module 02

Enterprise DNS Records & Name Resolution

---

### Module 03

Enterprise DNS Troubleshooting

---

### Module 04

Enterprise DHCP Administration

---

### Module 05

DHCP Reservations & Scopes

---

### Module 06

Enterprise File Services

---

### Module 07

NTFS Permissions

---

### Module 08

SMB Shares

---

### Module 09

Distributed File System (DFS)

---

### Module 10

Windows Public Key Infrastructure

---

### Module 11

Certificate Lifecycle Management

---

### Module 12

Certificate Revocation (CRL & OCSP)

---

### Module 13

Network Policy Server (NPS) & RADIUS

---

### Module 14

Windows Server Update Services (WSUS)

---

### Module 15

Windows Failover Clustering

---

## Phase Capstone

Design, deploy, and document the complete infrastructure services layer for the enterprise.

The final implementation should include:

- Fully operational Active Directory-integrated DNS
- Secure DHCP configuration
- Enterprise file services
- Permission-based access control
- Internal Certificate Authority
- Certificate enrollment and validation
- Infrastructure redundancy where appropriate
- PowerShell automation
- Enterprise architecture diagram
- Complete operational documentation

The completed infrastructure should be capable of supporting enterprise users, servers, applications, and future cloud integrations.

---

## Enterprise Capability Gained

After completing Phase 02, the enterprise possesses the infrastructure services required to support secure authentication, reliable networking, centralized resource access, certificate-based security, and scalable enterprise operations.

The enterprise now has the operational foundation required to begin building advanced networking, cloud identity, and security capabilities.

# Phase 03 — Enterprise Networking

## Business Objective

Design, implement, and secure the enterprise network infrastructure required to support communication between users, devices, servers, cloud services, and security platforms.

Networking provides the transport layer for every enterprise service.

Identity, authentication, cloud services, monitoring, and security all depend upon reliable, secure, and well-designed network architecture.

This phase develops the knowledge required to understand how enterprise networks are built, secured, monitored, and maintained.

---

## Enterprise Capability

Upon completion of this phase, the enterprise will possess:

- Structured network architecture
- Layer 2 and Layer 3 segmentation
- Enterprise firewall implementation
- Secure remote connectivity
- Network access control
- Zero Trust network principles
- Enterprise monitoring capabilities
- Network troubleshooting procedures

These capabilities establish the communication infrastructure required for cloud services, enterprise security, and modern hybrid environments.

---

## Core Technologies

### Network Fundamentals

- TCP/IP
- IPv4 & IPv6
- Subnetting
- ARP
- ICMP
- DNS
- DHCP

### Enterprise Networking

- Routing
- Switching
- VLANs
- NAT
- VPN Technologies
- DMZ Architecture
- Reverse Proxies
- Load Balancers

### Network Security

- Firewalls
- Next Generation Firewalls (NGFW)
- Network Segmentation
- Zero Trust Networking
- Microsegmentation
- Network Access Control (NAC)
- IEEE 802.1X

### Network Visibility

- Wireshark
- Zeek
- Suricata
- tcpdump
- Network IDS

---

## Professional Competencies

Throughout this phase the engineer develops practical experience with:

- Enterprise network design
- Secure network architecture
- Traffic analysis
- Network troubleshooting
- Packet analysis
- Firewall administration
- VPN implementation
- Network segmentation
- Zero Trust design principles
- Enterprise documentation
- Network automation

These competencies provide the networking foundation required for enterprise cloud services, security monitoring, and threat detection.

---

# Module Roadmap

### Module 01

TCP/IP Fundamentals

---

### Module 02

IPv4, IPv6 & Subnetting

---

### Module 03

Routing Fundamentals

---

### Module 04

Switching Fundamentals

---

### Module 05

VLAN Design & Implementation

---

### Module 06

Network Address Translation (NAT)

---

### Module 07

Enterprise Firewall Administration

---

### Module 08

Virtual Private Networks (VPN)

---

### Module 09

Demilitarized Zones (DMZ)

---

### Module 10

Reverse Proxies & Load Balancers

---

### Module 11

Network Segmentation

---

### Module 12

Zero Trust Networking

---

### Module 13

Microsegmentation

---

### Module 14

Network Access Control (802.1X & NAC)

---

### Module 15

Wireshark Fundamentals

---

### Module 16

Network Monitoring with Zeek

---

### Module 17

Network IDS with Suricata

---

### Module 18

Network Troubleshooting & Packet Analysis

---

## Phase Capstone

Design, implement, and document a secure enterprise network capable of supporting on-premises infrastructure, cloud connectivity, and future security operations.

The completed implementation should include:

- Enterprise IP addressing plan
- VLAN architecture
- Secure routing
- Firewall policy implementation
- VPN connectivity
- Network segmentation
- Zero Trust network design
- Traffic capture and analysis
- Monitoring with Zeek and Suricata
- Network architecture diagram
- Complete engineering documentation

The completed environment should provide a scalable, secure networking foundation capable of supporting the remaining phases of Cyber Defense Journey.

---

## Enterprise Capability Gained

After completing Phase 03, the enterprise possesses a secure, segmented, and well-documented network capable of supporting enterprise identity, cloud services, security monitoring, and modern Zero Trust architecture.

Networking is no longer simply a means of connectivity.

It becomes a strategic enterprise service that enables secure communication across every business function.

# Enterprise Domain II — Enterprise Identity

With the Enterprise Foundation established, the organization is now capable of extending identity beyond the traditional network perimeter.

Modern enterprises rarely operate exclusively on-premises.

Users authenticate from multiple locations.

Applications exist both on-premises and in the cloud.

Business partners require secure access.

Devices continuously move between trusted and untrusted networks.

Identity therefore becomes the new security perimeter.

This domain introduces modern Identity and Access Management (IAM), federation, cloud identity, identity governance, and hybrid authentication.

Rather than treating identity as a collection of user accounts, these phases establish identity as the central control plane for authentication, authorization, lifecycle management, and enterprise security.

---

# Phase 04 — Enterprise Identity & Access Management

## Business Objective

Design, implement, and manage a modern enterprise Identity and Access Management platform capable of securely authenticating users, governing access, and integrating applications across hybrid environments.

This phase introduces the technologies and operational practices required to manage workforce identities throughout their entire lifecycle.

Identity becomes the foundation for Zero Trust security by ensuring that every user, device, and application is continuously verified before access is granted.

---

## Enterprise Capability

Upon completion of this phase, the enterprise will possess:

- Centralized cloud identity management
- Enterprise authentication policies
- Adaptive authentication
- Multi-factor authentication
- Passwordless authentication
- Identity lifecycle management
- Federation with enterprise applications
- Automated provisioning
- Identity governance
- Secure application integration

These capabilities establish a modern identity platform capable of supporting cloud services, enterprise applications, and future hybrid architectures.

---

## Core Technologies

### Okta Identity Cloud

- Universal Directory
- Authentication Policies
- Network Zones
- Adaptive MFA
- FastPass
- Passwordless Authentication
- Lifecycle Management
- Workflows
- API Access Management

### Identity Standards

- SAML 2.0
- OAuth 2.0
- OpenID Connect
- SCIM
- LDAP

### Identity Governance

- Role-Based Access Control (RBAC)
- Just-in-Time (JIT) Access
- Just Enough Administration (JEA)
- Identity Analytics
- Access Certification
- Authentication Policies
- Risk-Based Access Policies

---

## Professional Competencies

Throughout this phase the engineer develops practical experience with:

- Identity administration
- Authentication design
- Authorization
- Federation
- Identity lifecycle management
- Identity governance
- Role-based administration
- Application integration
- Identity troubleshooting
- Enterprise documentation
- Identity automation

These competencies establish the modern identity foundation required for cloud security, Zero Trust architecture, and enterprise governance.

---

# Module Roadmap

### Module 01

Modern Identity & IAM Fundamentals

---

### Module 02

Okta Universal Directory

---

### Module 03

Users, Groups & Profile Management

---

### Module 04

Authentication Policies

---

### Module 05

Network Zones

---

### Module 06

Multi-Factor Authentication (MFA)

---

### Module 07

Adaptive Authentication

---

### Module 08

Passwordless Authentication & FastPass

---

### Module 09

Lifecycle Management

---

### Module 10

SCIM Provisioning

---

### Module 11

SAML Federation

---

### Module 12

OAuth 2.0 Fundamentals

---

### Module 13

OpenID Connect

---

### Module 14

LDAP Integration

---

### Module 15

Role-Based Access Control (RBAC)

---

### Module 16

Identity Governance

---

### Module 17

Identity Analytics & Access Certification

---

### Module 18

Okta Workflows

---

### Module 19

API Access Management

---

### Module 20

Enterprise Identity Automation

---

## Phase Capstone

Design, implement, and document a production-style enterprise Identity and Access Management platform capable of securely managing workforce identities throughout their lifecycle.

The completed implementation should include:

- Enterprise identity architecture
- Secure authentication policies
- Multi-factor authentication
- Passwordless authentication
- Application federation
- Automated user provisioning
- Role-based access control
- Identity governance
- Lifecycle automation
- Identity architecture diagram
- Complete engineering documentation

The completed environment should demonstrate a modern Identity and Access Management platform capable of supporting enterprise applications across hybrid environments.

---

## Enterprise Capability Gained

After completing Phase 04, the enterprise possesses a centralized Identity and Access Management platform capable of securely authenticating users, governing access, automating identity lifecycle management, and integrating applications across both on-premises and cloud environments.

Identity is no longer limited to Active Directory.

It becomes the enterprise's primary security control plane.

# Phase 05 — Hybrid Identity & Cloud Security

## Business Objective

Extend enterprise identity into hybrid and multi-cloud environments while implementing the security controls required to protect cloud resources, workloads, identities, and business data.

Modern organizations rarely operate entirely on-premises or entirely in the cloud.

Instead, they operate hybrid environments where identity, authentication, authorization, governance, and security span multiple platforms.

This phase develops the knowledge required to securely design, deploy, and manage hybrid identity across Microsoft Azure, Amazon Web Services, Microsoft 365, and cloud-hosted applications.

---

## Enterprise Capability

Upon completion of this phase, the enterprise will possess:

- Hybrid identity architecture
- Microsoft Entra integration
- Secure Azure administration
- Secure AWS administration
- Cloud identity governance
- Cloud workload protection
- Cloud monitoring
- Cloud incident response
- Multi-cloud security architecture

These capabilities enable the enterprise to securely operate workloads regardless of where they reside.

---

## Core Technologies

### Microsoft Entra ID

- Microsoft Entra Connect
- Hybrid Identity
- Administrative Units
- RBAC
- Conditional Access
- Identity Protection
- Privileged Identity Management (PIM)
- Access Reviews
- Entitlement Management
- Identity Governance
- External Identities

### Microsoft Azure

- Azure Fundamentals
- Azure Policy
- Azure Landing Zones
- Azure Monitor
- Azure Firewall
- Network Security Groups
- Defender for Cloud
- Microsoft Sentinel
- Azure Key Vault
- Managed Identity
- App Registrations
- Private Endpoints
- Storage Security

### Microsoft 365

- Microsoft Defender XDR
- Microsoft Purview
- Exchange Online Security
- SharePoint Security
- Teams Security

### Amazon Web Services

- AWS IAM
- Organizations
- Security Hub
- GuardDuty
- Inspector
- CloudTrail
- Config
- KMS
- Secrets Manager
- WAF
- VPC
- Security Groups
- S3 Security
- Lambda Security

---

## Professional Competencies

Throughout this phase the engineer develops practical experience with:

- Hybrid identity
- Cloud administration
- Cloud IAM
- Conditional Access
- Cloud governance
- Cloud workload security
- Cloud monitoring
- Cloud incident response
- Multi-cloud architecture
- Cloud documentation
- Cloud automation

These competencies prepare the engineer to secure enterprise environments that span both traditional infrastructure and modern cloud platforms.

---

# Module Roadmap

### Module 01

Hybrid Identity Fundamentals

---

### Module 02

Microsoft Entra Connect

---

### Module 03

Microsoft Entra Administration

---

### Module 04

Administrative Units

---

### Module 05

Role-Based Access Control (RBAC)

---

### Module 06

Conditional Access

---

### Module 07

Identity Protection

---

### Module 08

Privileged Identity Management (PIM)

---

### Module 09

Access Reviews

---

### Module 10

Entitlement Management

---

### Module 11

External Identities

---

### Module 12

Azure Fundamentals

---

### Module 13

Azure Security

---

### Module 14

Defender for Cloud

---

### Module 15

Microsoft Sentinel

---

### Module 16

Azure Key Vault

---

### Module 17

Managed Identity

---

### Module 18

Microsoft 365 Security

---

### Module 19

AWS Security Fundamentals

---

### Module 20

AWS Identity & Access Management

---

### Module 21

AWS Security Services

---

### Module 22

Cloud Incident Response

---

### Module 23

Hybrid Enterprise Architecture

---

## Phase Capstone

Design, deploy, and document a hybrid enterprise capable of securely integrating on-premises infrastructure, cloud identity, Microsoft Azure, Microsoft 365, Amazon Web Services, and enterprise applications.

The completed implementation should include:

- Hybrid identity synchronization
- Conditional Access policies
- Azure security baseline
- AWS security baseline
- Cloud workload protection
- Microsoft Sentinel integration
- Cloud monitoring
- Cloud incident response procedures
- Hybrid enterprise architecture diagram
- Complete engineering documentation

The completed environment should demonstrate the operational and security capabilities expected of a modern hybrid enterprise.

---

## Enterprise Capability Gained

After completing Phase 05, the enterprise possesses

---

# Enterprise Domain III — Enterprise Security Operations

With the enterprise infrastructure, networking, identity, and cloud platforms fully established, the organization now shifts its focus toward defending those systems.

Modern cybersecurity extends far beyond preventive controls.

Organizations must continuously monitor their environments, detect malicious activity, investigate suspicious behavior, respond to incidents, recover from attacks, and continuously improve their defensive posture.

This domain develops the operational security capabilities required to defend a modern enterprise.

Rather than treating security as individual tools, these phases establish a complete Security Operations program built upon visibility, detection, investigation, response, and continuous improvement.

---

# Phase 06 — Detection Engineering & Security Operations

## Business Objective

Design, implement, and operate an enterprise Security Operations capability capable of collecting telemetry, detecting malicious activity, investigating alerts, and continuously improving detection coverage.

This phase introduces Security Information and Event Management (SIEM), Detection Engineering, Endpoint Detection and Response (EDR), Threat Intelligence, Threat Hunting, and Security Orchestration.

Detection becomes the operational heartbeat of the enterprise.

---

## Enterprise Capability

Upon completion of this phase, the enterprise will possess:

- Centralized log collection
- Enterprise SIEM
- Detection engineering capabilities
- Threat intelligence integration
- Endpoint monitoring
- Threat hunting procedures
- Security orchestration
- Automated alerting
- Detection validation
- Enterprise security dashboards

These capabilities provide continuous visibility across enterprise infrastructure, identities, endpoints, and cloud services.

---

## Core Technologies

### Security Information & Event Management

- Splunk Enterprise
- Microsoft Sentinel
- Microsoft Defender XDR

### Detection Engineering

- Sigma Rules
- Splunk SPL
- Kusto Query Language (KQL)
- Detection as Code
- MITRE ATT&CK Mapping

### Endpoint Detection & Response

- Microsoft Defender
- Wazuh
- Sysmon
- Windows Event Forwarding

### Threat Intelligence

- MISP
- OpenCTI
- VirusTotal
- AbuseIPDB
- OSINT

### Threat Hunting

- MITRE ATT&CK
- Atomic Red Team
- MITRE Caldera
- Purple Team Operations

### Security Automation

- Microsoft Sentinel Automation
- Shuffle SOAR
- Logic Apps

---

## Professional Competencies

Throughout this phase the engineer develops practical experience with:

- SIEM administration
- Detection engineering
- Security monitoring
- Threat hunting
- Threat intelligence
- Endpoint detection
- Detection tuning
- Security automation
- Operational reporting
- SOC documentation

These competencies establish the operational security capabilities required to detect and investigate threats across the enterprise.

---

# Module Roadmap

### Module 01

Security Operations Fundamentals

---

### Module 02

Splunk Enterprise Fundamentals

---

### Module 03

Splunk Search Processing Language (SPL)

---

### Module 04

Microsoft Sentinel Fundamentals

---

### Module 05

Microsoft Defender XDR

---

### Module 06

Windows Event Logging

---

### Module 07

Sysmon

---

### Module 08

Wazuh

---

### Module 09

Detection Engineering Fundamentals

---

### Module 10

Sigma Rules

---

### Module 11

Detection as Code

---

### Module 12

MITRE ATT&CK Detection Mapping

---

### Module 13

Threat Intelligence

---

### Module 14

OpenCTI & MISP

---

### Module 15

Threat Hunting

---

### Module 16

Atomic Red Team

---

### Module 17

MITRE Caldera

---

### Module 18

Purple Team Operations

---

### Module 19

SOAR Fundamentals

---

### Module 20

Shuffle Automation

---

### Module 21

Microsoft Sentinel Automation

---

### Module 22

Security Dashboards & Reporting

---

## Phase Capstone

Design, implement, and operate a Security Operations Center capable of collecting telemetry, detecting attacks, investigating alerts, automating response actions, and producing executive reporting.

The completed implementation should include:

- Enterprise SIEM deployment
- Endpoint telemetry
- Detection rules
- MITRE ATT&CK mapping
- Threat hunting procedures
- Threat intelligence integration
- Automated playbooks
- Security dashboards
- SOC architecture diagram
- Complete operational documentation

The completed implementation should demonstrate an operational Security Operations capability consistent with modern enterprise practices.

---

## Enterprise Capability Gained

After completing Phase 06, the enterprise possesses a mature Security Operations capability capable of continuously monitoring infrastructure, identities, endpoints, cloud resources, and applications while detecting threats, supporting investigations, and improving defensive posture through continuous detection engineering.

Security transitions from reactive administration to continuous operational defense.

---

# Phase 07 — Enterprise Incident Response & Digital Forensics (DFIR)

## Business Objective

Develop the capability to investigate, contain, eradicate, recover from, and learn from cybersecurity incidents affecting enterprise infrastructure, cloud environments, identities, endpoints, and applications.

While Detection Engineering identifies suspicious activity, Incident Response transforms those detections into structured investigations that minimize business impact and restore normal operations.

This phase introduces the people, processes, technologies, and methodologies required to perform professional Digital Forensics and Incident Response (DFIR).

---

## Enterprise Capability

Upon completion of this phase, the enterprise will possess:

- Enterprise incident response procedures
- Digital forensic investigation capability
- Evidence preservation processes
- Malware triage procedures
- Root cause analysis
- Enterprise case management
- Incident reporting
- Recovery planning
- Lessons learned program
- Continuous incident improvement

These capabilities enable the enterprise to respond consistently to security incidents while preserving evidence and improving future defensive capabilities.

---

## Core Technologies

### Incident Response

- NIST SP 800-61
- Incident Handling Lifecycle
- Case Documentation
- Communication Plans
- Escalation Procedures
- Recovery Planning

### Digital Forensics

- Volatility
- Velociraptor
- KAPE
- Chainsaw

### Windows Forensics

- Windows Event Logs
- Registry Analysis
- Prefetch
- Amcache
- Shimcache
- Scheduled Tasks
- PowerShell History

### Evidence Collection

- Memory Acquisition
- Disk Acquisition
- Artifact Collection
- Timeline Analysis
- IOC Validation
- Chain of Custody

### Investigation

- Log Analysis
- Root Cause Analysis
- Threat Attribution
- Timeline Reconstruction

---

## Professional Competencies

Throughout this phase the engineer develops practical experience with:

- Incident handling
- Digital forensics
- Evidence preservation
- Memory analysis
- Windows artifact analysis
- Timeline reconstruction
- Root cause analysis
- Enterprise reporting
- Executive communication
- Lessons learned documentation

These competencies establish the operational investigation capability required to support enterprise security operations.

---

# Module Roadmap

### Module 01

Enterprise Incident Response Fundamentals

---

### Module 02

NIST SP 800-61 Incident Lifecycle

---

### Module 03

Incident Classification & Prioritization

---

### Module 04

Evidence Collection & Chain of Custody

---

### Module 05

Windows Event Log Analysis

---

### Module 06

Registry Forensics

---

### Module 07

Memory Analysis with Volatility

---

### Module 08

Enterprise DFIR with Velociraptor

---

### Module 09

Artifact Collection with KAPE

---

### Module 10

Timeline Analysis

---

### Module 11

Prefetch Analysis

---

### Module 12

Amcache & Shimcache Analysis

---

### Module 13

PowerShell & Scheduled Task Forensics

---

### Module 14

Root Cause Analysis

---

### Module 15

Case Documentation

---

### Module 16

Executive Incident Reporting

---

### Module 17

Recovery & Lessons Learned

---

### Module 18

Enterprise Incident Response Exercise

---

## Phase Capstone

Conduct a complete enterprise incident investigation from initial alert through recovery.

The completed investigation should include:

- Incident identification
- Evidence preservation
- Endpoint investigation
- Memory analysis
- Registry analysis
- Timeline reconstruction
- Root cause determination
- Executive incident report
- Lessons learned documentation
- Updated defensive recommendations

The completed investigation should demonstrate a repeatable enterprise Digital Forensics and Incident Response capability consistent with industry best practices.

---

## Enterprise Capability Gained

After completing Phase 07, the enterprise possesses a mature Digital Forensics and Incident Response capability capable of investigating security incidents, preserving evidence, identifying root causes, coordinating recovery efforts, and strengthening future defensive operations through structured post-incident analysis.

Security operations now extend beyond detection to full incident lifecycle management.

---

# Phase 08 — Advanced Threat Analysis

## Business Objective

Develop the capability to analyze malicious software, understand adversary tradecraft, identify attacker techniques, and improve enterprise defenses through technical threat analysis.

While Incident Response focuses on investigating security incidents, Advanced Threat Analysis focuses on understanding how adversaries operate.

This phase develops the analytical skills required to examine malware, reverse engineer malicious code, identify attacker behaviors, and transform technical findings into actionable defensive improvements.

---

## Enterprise Capability

Upon completion of this phase, the enterprise will possess:

- Malware analysis capability
- Static code analysis
- Dynamic malware analysis
- Reverse engineering capability
- Threat intelligence enrichment
- Adversary behavior analysis
- YARA detection development
- Sandboxed malware testing
- Threat research procedures
- Detection improvement through threat analysis

These capabilities strengthen enterprise detection engineering, incident response, and defensive architecture by improving the organization's understanding of modern cyber threats.

---

## Core Technologies

### Malware Analysis

- Static Analysis
- Dynamic Analysis
- Behavioral Analysis
- Sandboxing

### Reverse Engineering

- Ghidra
- x64dbg
- PEStudio
- FLOSS

### Detection Development

- YARA
- IOC Development
- Detection Validation

### Adversary Tradecraft

- MITRE ATT&CK
- CAPEC
- Living off the Land (LOLBins)
- PowerShell Abuse
- Office Malware
- Ransomware Techniques

### Threat Research

- Threat Intelligence Reports
- Malware Families
- Campaign Analysis
- TTP Analysis

---

## Professional Competencies

Throughout this phase the engineer develops practical experience with:

- Malware triage
- Reverse engineering
- Static analysis
- Dynamic analysis
- Behavioral analysis
- Threat intelligence correlation
- YARA rule development
- Adversary emulation
- Detection improvement
- Technical reporting

These competencies improve the engineer's ability to understand attacker behavior and strengthen enterprise defensive capabilities.

---

# Module Roadmap

### Module 01

Threat Analysis Fundamentals

---

### Module 02

Malware Fundamentals

---

### Module 03

Static Malware Analysis

---

### Module 04

Dynamic Malware Analysis

---

### Module 05

Sandbox Analysis

---

### Module 06

Introduction to Reverse Engineering

---

### Module 07

Ghidra Fundamentals

---

### Module 08

x64dbg Fundamentals

---

### Module 09

PEStudio

---

### Module 10

FLOSS

---

### Module 11

YARA Rule Development

---

### Module 12

Living off the Land (LOLBins)

---

### Module 13

PowerShell Tradecraft

---

### Module 14

Office Document Malware

---

### Module 15

Ransomware Analysis

---

### Module 16

MITRE ATT&CK & CAPEC Analysis

---

### Module 17

Threat Intelligence Correlation

---

### Module 18

Threat Research & Reporting

---

## Phase Capstone

Analyze a simulated enterprise malware incident from initial sample acquisition through technical analysis and defensive improvement.

The completed project should include:

- Static malware analysis
- Dynamic malware execution
- Behavioral observations
- Reverse engineering
- YARA rule creation
- MITRE ATT&CK mapping
- Detection recommendations
- Threat intelligence correlation
- Technical analysis report
- Defensive improvement recommendations

The completed capstone should demonstrate the ability to transform technical malware analysis into practical enterprise security improvements.

---

## Enterprise Capability Gained

After completing Phase 08, the enterprise possesses an advanced threat analysis capability capable of understanding adversary behavior, analyzing malicious software, developing new detections, and improving enterprise defenses through technical intelligence.

Security operations now extend beyond responding to attacks by proactively understanding how attackers operate and adapting defensive strategies accordingly.

---

# Phase 09 — Secure Application Engineering

## Business Objective

Develop the capability to design, assess, and improve the security of enterprise applications throughout the Software Development Lifecycle (SDLC).

Modern applications are among the most common attack vectors within an enterprise.

Rather than relying solely on security tools to identify vulnerabilities after deployment, organizations increasingly integrate security throughout the design, development, testing, deployment, and maintenance of software.

This phase develops the knowledge required to identify application vulnerabilities, perform security testing, conduct threat modeling, and integrate security into the software development process.

---

## Enterprise Capability

Upon completion of this phase, the enterprise will possess:

- Secure Software Development Lifecycle (SSDLC)
- Application security testing capability
- Threat modeling procedures
- API security assessment
- Secure code review processes
- Vulnerability assessment methodology
- Dependency management
- Secure application architecture
- Secure deployment practices
- Continuous application security improvement

These capabilities reduce application risk while supporting secure software development across the enterprise.

---

## Core Technologies

### Application Security

- OWASP Top 10
- OWASP API Security Top 10
- OWASP ASVS
- OWASP Web Security Testing Guide

### Threat Modeling

- STRIDE
- DREAD
- CAPEC
- MITRE ATT&CK

### Security Testing

- Burp Suite
- Veracode
- Static Application Security Testing (SAST)
- Dynamic Application Security Testing (DAST)

### Secure Development

- Secure SDLC
- Secure Code Review
- Dependency Management
- Software Composition Analysis (SCA)
- Vulnerability Management

### API Security

- REST APIs
- GraphQL
- JWT
- API Authentication
- API Authorization

---

## Professional Competencies

Throughout this phase the engineer develops practical experience with:

- Web application testing
- API security assessment
- Threat modeling
- Secure design principles
- Vulnerability identification
- Secure code review
- Dependency risk analysis
- Security reporting
- Secure development workflows
- Developer collaboration

These competencies establish the ability to integrate security into modern software development rather than treating security as a separate function.

---

# Module Roadmap

### Module 01

Secure Development Fundamentals

---

### Module 02

OWASP Top 10

---

### Module 03

OWASP API Security Top 10

---

### Module 04

OWASP ASVS

---

### Module 05

OWASP Web Security Testing Guide

---

### Module 06

Threat Modeling Fundamentals

---

### Module 07

STRIDE

---

### Module 08

DREAD

---

### Module 09

CAPEC

---

### Module 10

MITRE ATT&CK for Application Security

---

### Module 11

Burp Suite Fundamentals

---

### Module 12

Manual Web Application Testing

---

### Module 13

API Security Testing

---

### Module 14

JWT Security

---

### Module 15

GraphQL Security

---

### Module 16

Secure Code Review

---

### Module 17

SAST & DAST

---

### Module 18

Software Composition Analysis (SCA)

---

### Module 19

Dependency Management

---

### Module 20

Secure SDLC

---

### Module 21

Enterprise Application Risk Assessment

---

## Phase Capstone

Assess, secure, and document a production-style enterprise web application.

The completed implementation should include:

- Threat model
- Secure architecture review
- OWASP assessment
- API security testing
- Burp Suite assessment
- Secure code review
- SAST and DAST analysis
- Dependency review
- Vulnerability remediation recommendations
- Executive security assessment report
- Application architecture diagram

The completed capstone should demonstrate the ability to evaluate application security throughout the software development lifecycle while providing practical recommendations for improving enterprise application security.

---

## Enterprise Capability Gained

After completing Phase 09, the enterprise possesses a structured application security program capable of integrating security into software design, development, testing, and deployment.

Application security becomes a continuous engineering practice rather than a final testing activity performed before release.

---

# Enterprise Domain IV — Enterprise Engineering

With enterprise security operations fully established, the organization now shifts its focus toward engineering, automation, scalability, and operational maturity.

Modern enterprises cannot rely solely on manual administration.

Infrastructure must be repeatable.

Deployments must be automated.

Security must be integrated into engineering workflows.

Configuration must be version controlled.

Operational consistency becomes just as important as operational capability.

This domain develops the engineering disciplines required to build, automate, govern, and continuously improve enterprise technology.

---

# Phase 10 — Enterprise DevSecOps & Platform Engineering

## Business Objective

Develop the capability to securely build, automate, deploy, and maintain enterprise infrastructure and applications using modern engineering practices.

This phase introduces DevSecOps principles, Infrastructure as Code (IaC), CI/CD pipelines, container technologies, secrets management, and secure platform engineering.

Rather than manually configuring enterprise infrastructure, engineers learn to automate deployments, standardize environments, and integrate security directly into the software delivery lifecycle.

---

## Enterprise Capability

Upon completion of this phase, the enterprise will possess:

- Infrastructure as Code
- Secure CI/CD pipelines
- Containerized workloads
- Enterprise automation
- Platform engineering practices
- Configuration management
- Secrets management
- Supply chain security
- Secure software delivery
- Repeatable enterprise deployments

These capabilities improve consistency, reduce operational risk, and enable scalable enterprise engineering.

---

## Core Technologies

### Source Control

- Git
- GitHub
- Branching Strategies
- Pull Requests
- Code Reviews

### CI/CD

- GitHub Actions
- Azure DevOps
- Jenkins
- Continuous Integration
- Continuous Delivery

### Infrastructure as Code

- Terraform
- Bicep
- ARM Templates

### Configuration Management

- Ansible
- Desired State Configuration (DSC)

### Containers

- Docker
- Kubernetes
- Container Networking
- Container Orchestration

### Container Security

- Trivy
- Image Signing
- Admission Controllers

### DevSecOps

- Secrets Management
- Secrets Scanning
- Software Bill of Materials (SBOM)
- Dependency Scanning
- Supply Chain Security

---

## Professional Competencies

Throughout this phase the engineer develops practical experience with:

- Version control
- Infrastructure automation
- Platform engineering
- CI/CD administration
- Container deployment
- Kubernetes fundamentals
- Configuration management
- Infrastructure security
- DevSecOps workflows
- Enterprise automation

These competencies establish the engineering practices required to operate secure, scalable, and repeatable enterprise environments.

---

# Module Roadmap

### Module 01

Git Fundamentals

---

### Module 02

GitHub Workflows

---

### Module 03

Branching & Pull Requests

---

### Module 04

Continuous Integration

---

### Module 05

Continuous Delivery

---

### Module 06

GitHub Actions

---

### Module 07

Azure DevOps Pipelines

---

### Module 08

Jenkins Fundamentals

---

### Module 09

Infrastructure as Code Fundamentals

---

### Module 10

Terraform

---

### Module 11

Bicep

---

### Module 12

ARM Templates

---

### Module 13

Configuration Management with Ansible

---

### Module 14

Docker Fundamentals

---

### Module 15

Container Security

---

### Module 16

Kubernetes Fundamentals

---

### Module 17

Secrets Management

---

### Module 18

Software Supply Chain Security

---

### Module 19

SBOM & Dependency Scanning

---

### Module 20

Enterprise Platform Automation

---

## Phase Capstone

Design, deploy, and document a secure enterprise deployment pipeline capable of automatically provisioning infrastructure, deploying applications, validating security controls, and maintaining configuration consistency.

The completed implementation should include:

- Git-based source control
- CI/CD pipeline
- Infrastructure as Code
- Containerized application deployment
- Kubernetes orchestration
- Configuration management
- Secrets management
- Supply chain security validation
- Platform architecture diagram
- Complete engineering documentation

The completed implementation should demonstrate a repeatable enterprise platform engineering workflow capable of securely delivering infrastructure and applications at scale.

---

## Enterprise Capability Gained

After completing Phase 10, the enterprise possesses a modern engineering platform capable of automating infrastructure deployment, securing software delivery, standardizing environments, and supporting scalable enterprise operations.

Engineering transitions from manual administration to repeatable, automated, and secure platform management.

---

# Phase 11 — Programming & Enterprise Automation

## Business Objective

Develop the programming and automation skills required to build, extend, integrate, and automate enterprise infrastructure, security operations, cloud environments, and business processes.

Modern cybersecurity professionals are expected to move beyond manual administration by creating repeatable solutions through scripting, programming, APIs, and workflow automation.

This phase develops the ability to solve operational problems through software rather than repetitive manual effort.

---

## Enterprise Capability

Upon completion of this phase, the enterprise will possess:

- Enterprise automation
- API integration
- Security automation
- Administrative scripting
- Data processing
- Workflow automation
- Custom tooling
- Enterprise reporting
- Reusable engineering utilities
- Automation-first operations

These capabilities improve operational efficiency while reducing human error across enterprise systems.

---

## Core Technologies

### Programming Languages

- Python
- PowerShell
- SQL
- Bash
- JavaScript
- C#

### Data Formats

- JSON
- YAML
- XML
- CSV
- Regular Expressions (Regex)

### APIs

- REST APIs
- Microsoft Graph API
- PowerShell APIs
- Azure APIs

### Automation

- Azure Automation
- Logic Apps
- Scheduled Tasks
- PowerShell Remoting
- Workflow Automation

---

## Professional Competencies

Throughout this phase the engineer develops practical experience with:

- Python development
- PowerShell automation
- API integration
- Data processing
- Security automation
- Administrative scripting
- Enterprise reporting
- Automation architecture
- Tool development
- Workflow design

---

# Module Roadmap

### Module 01

Programming Fundamentals

---

### Module 02

Python Fundamentals

---

### Module 03

PowerShell Advanced Automation

---

### Module 04

SQL for Security Professionals

---

### Module 05

Bash Fundamentals

---

### Module 06

JavaScript Essentials

---

### Module 07

Working with JSON, YAML & XML

---

### Module 08

Regular Expressions

---

### Module 09

REST APIs

---

### Module 10

Microsoft Graph API

---

### Module 11

PowerShell API Integration

---

### Module 12

Azure Automation

---

### Module 13

Logic Apps

---

### Module 14

Enterprise Reporting Automation

---

### Module 15

Security Automation Projects

---

### Module 16

Building Enterprise Security Tools

---

## Phase Capstone

Design and build a collection of enterprise automation tools capable of managing infrastructure, integrating APIs, collecting data, generating reports, and automating administrative tasks across multiple enterprise platforms.

---

## Enterprise Capability Gained

After completing Phase 11, the enterprise possesses reusable automation capable of reducing manual effort while improving consistency, scalability, and operational efficiency across infrastructure, identity, cloud, and security operations.

---

# Phase 12 — Linux Administration & Security

## Business Objective

Develop the knowledge required to administer, secure, and troubleshoot Linux systems that support enterprise infrastructure, cloud platforms, containers, security appliances, and modern application environments.

Although Windows remains a core enterprise platform, Linux powers much of today's cloud infrastructure, web services, security tooling, and container ecosystems.

This phase develops practical Linux administration skills from an enterprise security perspective.

---

## Enterprise Capability

Upon completion of this phase, the enterprise will possess:

- Secure Linux administration
- Linux server management
- Enterprise SSH administration
- Linux security hardening
- Linux logging
- Linux auditing
- Enterprise scripting
- Linux troubleshooting
- Secure remote administration

These capabilities enable the enterprise to securely operate mixed Windows and Linux environments.

---

## Core Technologies

### Linux Administration

- Linux Fundamentals
- systemd
- journald
- SSH
- Cron

### Linux Security

- Permissions
- ACLs
- iptables / nftables
- SELinux
- AppArmor
- Auditd

### Enterprise Operations

- Bash
- Package Management
- System Monitoring
- Log Analysis
- Service Management

---

## Professional Competencies

Throughout this phase the engineer develops practical experience with:

- Linux administration
- Linux security
- Secure remote administration
- Linux troubleshooting
- Service management
- Log analysis
- Bash scripting
- Enterprise hardening
- Linux documentation

---

# Module Roadmap

### Module 01

Linux Fundamentals

---

### Module 02

Linux File System

---

### Module 03

Users & Permissions

---

### Module 04

SSH Administration

---

### Module 05

systemd & Service Management

---

### Module 06

journald & Logging

---

### Module 07

Cron & Scheduled Tasks

---

### Module 08

Package Management

---

### Module 09

iptables & nftables

---

### Module 10

SELinux

---

### Module 11

AppArmor

---

### Module 12

Auditd

---

### Module 13

Linux Hardening

---

### Module 14

Linux Monitoring & Troubleshooting

---

### Module 15

Enterprise Bash Automation

---

## Phase Capstone

Deploy, secure, automate, and document a production-style Linux server environment capable of supporting enterprise applications, secure remote administration, centralized logging, and automated operational tasks.

---

## Enterprise Capability Gained

After completing Phase 12, the enterprise possesses secure Linux infrastructure capable of supporting cloud services, containers, enterprise applications, security tooling, and mixed operating system environments.

---

# Phase 13 — Governance, Risk & Compliance (GRC)

## Business Objective

Develop the governance, risk management, compliance, and audit capabilities required to ensure that enterprise technology aligns with regulatory requirements, industry standards, business objectives, and organizational risk tolerance.

Technical controls alone do not create a secure enterprise.

Effective governance ensures that technology decisions remain aligned with business goals while providing measurable assurance that security controls operate as intended.

---

## Enterprise Capability

Upon completion of this phase, the enterprise will possess:

- Security governance
- Enterprise risk management
- Compliance assessment
- Security auditing
- Control validation
- Policy management
- Vendor risk management
- Executive reporting
- Continuous compliance monitoring

These capabilities enable the enterprise to manage cybersecurity as an ongoing business function rather than a collection of technical controls.

---

## Core Technologies & Frameworks

### Governance

- Security Policies
- Standards
- Procedures
- Risk Registers

### Frameworks

- NIST Cybersecurity Framework (CSF)
- NIST Risk Management Framework (RMF)
- NIST SP 800-53
- NIST SP 800-171
- CMMC
- CIS Controls

### Risk Management

- FAIR
- Third-Party Risk
- Vendor Risk
- Privacy
- Data Classification
- Data Retention

### Audit & Reporting

- Gap Assessments
- Mock Assessments
- Audit Management
- Executive Reporting
- Control Testing

---

## Professional Competencies

Throughout this phase the engineer develops practical experience with:

- Risk assessments
- Security governance
- Framework implementation
- Compliance auditing
- Policy development
- Executive communication
- Control validation
- Audit preparation
- Security reporting
- Continuous improvement

---

# Module Roadmap

### Module 01

Governance Fundamentals

---

### Module 02

Risk Management Fundamentals

---

### Module 03

NIST Cybersecurity Framework

---

### Module 04

NIST Risk Management Framework

---

### Module 05

NIST SP 800-53

---

### Module 06

NIST SP 800-171

---

### Module 07

CMMC

---

### Module 08

CIS Controls

---

### Module 09

FAIR Risk Analysis

---

### Module 10

Vendor & Third-Party Risk

---

### Module 11

Privacy & Data Governance

---

### Module 12

Policy Development

---

### Module 13

Control Assessments

---

### Module 14

Mock Enterprise Assessment

---

### Module 15

Executive Security Reporting

---

### Module 16

Building a GRC Program

---

## Phase Capstone

Conduct a complete enterprise security assessment against a recognized framework, identify control gaps, develop remediation recommendations, produce executive reporting, and create a multi-year security improvement roadmap.

---

## Enterprise Capability Gained

After completing Phase 13, the enterprise possesses a mature governance, risk, and compliance program capable of measuring security effectiveness, demonstrating regulatory compliance, communicating risk to leadership, and driving continuous security improvement.

---

# Enterprise Domain V — Enterprise Intelligence & Future Technologies

The final Enterprise Domain represents the highest level of maturity within Cyber Defense Journey.

At this stage the enterprise has been designed, deployed, secured, monitored, automated, and governed.

The focus now shifts toward extracting value from enterprise data, designing future enterprise architectures, and preparing for emerging technologies that will shape the next generation of cybersecurity.

These phases emphasize engineering judgment, strategic thinking, data-driven decision making, and enterprise innovation.

Rather than introducing isolated technologies, this domain integrates everything developed throughout the previous phases into a cohesive enterprise architecture capable of supporting future business growth.

---

# Phase 14 — Data Engineering & Security Analytics

## Business Objective

Develop the capability to collect, transform, analyze, and visualize enterprise data in support of cybersecurity operations, executive decision making, business intelligence, and security analytics.

Modern enterprises generate enormous amounts of operational and security data.

This phase develops the ability to transform raw data into meaningful information that improves visibility, supports investigations, measures security effectiveness, and enables informed business decisions.

---

## Enterprise Capability

Upon completion of this phase, the enterprise will possess:

- Enterprise data pipelines
- Security analytics
- Executive dashboards
- Operational reporting
- Data governance
- Security metrics
- Enterprise business intelligence
- Automated reporting
- Data-driven decision support

---

## Core Technologies

### Databases

- SQL
- PostgreSQL

### Microsoft Data Platform

- Microsoft Fabric
- Azure Data Factory
- Synapse Analytics
- Power BI

### Data Engineering

- Apache Spark
- Databricks
- Snowflake
- Kafka
- Event Hubs
- ETL
- ELT

### Governance

- Microsoft Purview
- Data Classification
- Data Governance

---

## Professional Competencies

Throughout this phase the engineer develops practical experience with:

- SQL development
- Data engineering
- Business intelligence
- Dashboard creation
- Security analytics
- Data visualization
- Reporting automation
- Data governance
- Executive reporting

---

# Module Roadmap

### Module 01

SQL Fundamentals

---

### Module 02

Advanced SQL

---

### Module 03

Power BI

---

### Module 04

Microsoft Fabric

---

### Module 05

Azure Data Factory

---

### Module 06

Synapse Analytics

---

### Module 07

Apache Spark

---

### Module 08

Databricks

---

### Module 09

Snowflake

---

### Module 10

Kafka

---

### Module 11

Event Hubs

---

### Module 12

ETL & ELT

---

### Module 13

Data Governance

---

### Module 14

Microsoft Purview

---

### Module 15

Enterprise Security Dashboards

---

### Module 16

Executive Security Metrics

---

## Phase Capstone

Design and implement a complete enterprise analytics platform capable of collecting security telemetry, processing operational data, generating executive dashboards, and supporting enterprise decision making.

---

## Enterprise Capability Gained

After completing Phase 14, the enterprise possesses a mature analytics platform capable of transforming operational and security data into actionable intelligence for engineers, analysts, managers, and executives.

---

# Phase 15 — Enterprise Architecture & Professional Practice

## Business Objective

Develop the architectural thinking, communication skills, and professional engineering practices required to design, evaluate, and continuously improve enterprise technology environments.

Technology alone does not build successful organizations.

Enterprise engineers must understand how individual systems interact, evaluate competing solutions, communicate technical decisions, and design architectures that support long-term business objectives.

---

## Enterprise Capability

Upon completion of this phase, the enterprise will possess:

- Enterprise architecture
- Technology roadmapping
- Architecture documentation
- Security architecture
- Technical governance
- Change management
- Decision documentation
- Executive communication
- Enterprise design standards

---

## Core Technologies & Practices

### Enterprise Architecture

- Identity Architecture
- Network Architecture
- Security Architecture
- Cloud Architecture
- Zero Trust Architecture
- Defense in Depth

### Engineering Practices

- High-Level Designs (HLD)
- Low-Level Designs (LLD)
- Architecture Decision Records (ADRs)
- Technology Evaluation
- Design Tradeoffs

### Enterprise Platforms

- ServiceNow
- Jira
- Confluence
- Azure DevOps
- Microsoft 365
- Microsoft Defender XDR

### Professional Skills

- Executive Reporting
- Technical Writing
- Architecture Reviews
- Incident Briefings
- Change Management
- Risk Communication
- Vendor Evaluation
- Project Planning
- Presentation Skills

---

## Professional Competencies

Throughout this phase the engineer develops practical experience with:

- Enterprise architecture
- Solution design
- Technical leadership
- Architecture documentation
- Technical communication
- Stakeholder engagement
- Project planning
- Decision analysis
- Enterprise governance

---

# Module Roadmap

### Module 01

Enterprise Architecture Fundamentals

---

### Module 02

Identity Architecture

---

### Module 03

Network Architecture

---

### Module 04

Cloud Architecture

---

### Module 05

Security Architecture

---

### Module 06

Zero Trust Architecture

---

### Module 07

Defense in Depth

---

### Module 08

Architecture Diagrams

---

### Module 09

High-Level Designs (HLD)

---

### Module 10

Low-Level Designs (LLD)

---

### Module 11

Architecture Decision Records (ADR)

---

### Module 12

Technical Writing

---

### Module 13

Executive Reporting

---

### Module 14

Change Management

---

### Module 15

Vendor Evaluation

---

### Module 16

Enterprise Roadmapping

---

## Phase Capstone

Design and document the complete Cyber Defense Journey enterprise as if presenting it to executive leadership, including architecture diagrams, technology standards, security architecture, operational procedures, future roadmap, and business justification.

---

## Enterprise Capability Gained

After completing Phase 15, the enterprise possesses a complete architectural blueprint supported by professional documentation, governance processes, engineering standards, and strategic planning capable of guiding long-term enterprise growth.

---

# Phase 16 — Enterprise AI Security & Identity

## Business Objective

Develop the knowledge and engineering practices required to securely integrate artificial intelligence into modern enterprise environments while protecting AI systems, identities, data, models, and autonomous agents.

Artificial intelligence is rapidly becoming part of enterprise operations.

Organizations must secure not only users and applications, but also AI models, AI assistants, autonomous agents, APIs, vector databases, and machine learning workflows.

This phase prepares the enterprise for the next generation of cybersecurity challenges.

---

## Enterprise Capability

Upon completion of this phase, the enterprise will possess:

- AI governance
- AI identity management
- Secure AI deployment
- AI risk management
- Agent security
- AI monitoring
- AI audit logging
- AI security architecture
- Enterprise AI governance framework

---

## Core Technologies

### AI Security

- LLM Security
- Prompt Injection
- Prompt Leakage
- Model Security
- RAG Security
- Vector Database Security

### AI Identity

- AI Authentication
- AI Authorization
- Agent Identity
- Agent Lifecycle Management
- Tool Permissions
- MCP Security
- Agent Governance

### AI Governance

- AI Risk Management
- AI Compliance
- AI Audit Logging
- AI Threat Modeling
- AI Red Teaming
- AI Security Policies

### Enterprise AI

- AI Automation
- Enterprise AI Agents
- AI SOC
- AI GRC
- AI Security Operations

---

## Professional Competencies

Throughout this phase the engineer develops practical experience with:

- AI security
- AI governance
- Agent security
- AI identity
- AI risk analysis
- AI threat modeling
- AI architecture
- AI compliance
- Enterprise AI strategy

---

# Module Roadmap

### Module 01

AI Fundamentals for Security Engineers

---

### Module 02

Enterprise AI Architecture

---

### Module 03

AI Identity

---

### Module 04

Agent Authentication & Authorization

---

### Module 05

Prompt Injection

---

### Module 06

Prompt Leakage

---

### Module 07

LLM Security

---

### Module 08

RAG Security

---

### Module 09

Vector Database Security

---

### Module 10

Model Security

---

### Module 11

AI Governance

---

### Module 12

AI Risk Management

---

### Module 13

AI Threat Modeling

---

### Module 14

AI Red Teaming

---

### Module 15

AI Security Monitoring

---

### Module 16

Enterprise AI Strategy

---

## Phase Capstone

Design, implement, secure, and document an enterprise AI platform that includes identity, governance, monitoring, risk management, security controls, and operational procedures for autonomous AI agents operating within a modern enterprise.

---

## Enterprise Capability Gained

After completing Phase 16, the enterprise possesses a comprehensive AI security program capable of securely deploying, governing, monitoring, and protecting enterprise AI systems while preparing the organization for emerging technologies and future cybersecurity challenges.

---

# Roadmap Completion

Completion of the CDJ Enterprise Roadmap represents the successful design, implementation, security, automation, governance, and continuous improvement of a modern enterprise.

More importantly, it represents the transformation of the engineer.

The project begins with the administration of a single system.

It concludes with the ability to design, secure, automate, govern, and continuously evolve an enterprise capable of supporting modern infrastructure, cloud platforms, security operations, and artificial intelligence.

Cyber Defense Journey is not the end of learning.

It is the foundation upon which a lifelong engineering career is built.

---

> **Build the Enterprise. Build the Engineer.**