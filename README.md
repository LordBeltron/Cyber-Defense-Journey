# Cyber Defense Journey

### Enterprise Infrastructure, Security Operations, and Detection Engineering Program

Cyber Defense Journey is the engineering record of a complete enterprise environment being designed, deployed, secured, monitored, and continuously improved from the ground up. It documents the same categories of work performed by Infrastructure, Security Operations, and Detection Engineering teams inside a production organization: identity and access, Windows and Linux server administration, networking, endpoint and network security, monitoring and SIEM/SOAR, automation, cloud integration, and incident response. Every entry in this repository reflects a deliberate engineering decision, a documented implementation, and a validated operational outcome.

**Mission:** Build and operate a production-representative enterprise environment, one operational capability at a time, and document every capability the way a real infrastructure team would document it internally.

---

## Enterprise Vision

This repository does not treat individual labs as isolated exercises. Each lab represents the enterprise acquiring a new operational capability — a domain controller that enforces identity, a firewall that enforces network boundary control, a SIEM that enforces visibility, a runbook that enforces repeatability. The environment matures incrementally, and each module is layered on top of the capabilities that came before it, in the same sequence a real organization would build out its infrastructure: identity and directory services first, followed by networking and perimeter controls, endpoint and server hardening, centralized monitoring, detection engineering, automation, cloud extension, and finally coordinated purple team validation.

The documentation captures four things for every capability that is added to the environment:

- **What was implemented** — the technical component and its configuration.
- **Why it was implemented** — the business or security requirement it satisfies.
- **How it was validated** — the test, log, or evidence that confirms it works as intended.
- **How it changes the enterprise** — the operational capability the organization now has that it did not have before.

This is the difference between a lab log and engineering documentation. A lab log records that something was done. Engineering documentation records why it mattered, how it was verified, and how it fits into the larger system.

---

## Current Enterprise Status

**Enterprise Maturity**

```
████████░░░░░░░░░░░░  
```

| Track | Status |
|---|---|
| Identity & Directory Services | In Progress |
| Windows Infrastructure | In Progress |
| Networking & Perimeter | Planned |
| Endpoint & Server Security | Planned |
| Monitoring & SIEM | Planned |
| Detection & Threat Hunting | Planned |
| Automation | In Progress |
| Cloud Integration | Planned |
| Governance, Risk & Compliance | Planned |

The maturity indicator reflects the proportion of planned enterprise capabilities that have been implemented, documented, and validated with evidence. It is updated at the close of each phase, not at the close of each lab, so that it reflects operational readiness rather than task completion.

---

## Current Enterprise Capabilities

### Identity

- [x] Active Directory Domain Services deployed and operational
- [x] Organizational Unit structure aligned to departmental and functional boundaries
- [ ] Group Policy Objects enforcing baseline security configuration
- [ ] Fine-Grained Password Policies
- [ ] LAPS for local administrator credential rotation
- [ ] Entra ID hybrid identity extension

### Windows Infrastructure

- [x] Domain Controller build and promotion
- [x] DNS zones and record management
- [ ] DHCP scopes and reservations
- [ ] WSUS patch management
- [ ] Certificate Services (PKI) issuing CA
- [ ] Windows Client baseline imaging and enrollment

### Networking

- [ ] pfSense perimeter firewall
- [ ] VLAN segmentation
- [ ] Inter-VLAN routing and access control lists
- [ ] Site-to-site and remote access VPN
- [ ] IDS/IPS at the network boundary

### Security

- [ ] Microsoft Defender for Endpoint deployment
- [ ] BitLocker with TPM and key escrow
- [ ] Vulnerability management and remediation cycle
- [ ] Endpoint hardening baselines (CIS/NIST aligned)

### Monitoring

- [ ] Splunk or Microsoft Sentinel ingestion pipeline
- [ ] Wazuh agent deployment across the environment
- [ ] Centralized log retention and alerting

### Automation

- [x] PowerShell scripts accompanying every implemented lab
- [ ] Scheduled and event-driven automation tasks
- [ ] Infrastructure configuration drift detection

### Documentation

- [x] README/Runbook/Lab Notes/Evidence structure established
- [x] Documentation standard defined and enforced per module

### Incident Response

- [ ] Incident response plan and playbooks
- [ ] Tabletop exercises
- [ ] Digital forensics workflow

### Cloud

- [ ] Azure tenant and resource baseline
- [ ] AWS account and IAM baseline
- [ ] Hybrid identity and workload integration

Capabilities move from planned to complete only after implementation, validation, and documentation are all finished. A capability that is implemented but undocumented is not considered complete, because undocumented infrastructure is not operationally supportable.

### Evidence Standard

A capability is not marked complete on the strength of a configuration screen being open. Each completed item above is backed by evidence that demonstrates the control is functioning, not merely present: a Group Policy Object is verified with `gpresult`, not just linked in a GPO listing; a firewall rule is verified with a blocked or permitted connection test, not just a saved policy; a SIEM alert is verified by triggering the condition it is meant to detect, not just by confirming the rule exists. This distinction — configured versus verified — is applied consistently across every phase of the roadmap.

---

## Enterprise Roadmap

The roadmap is organized into eight phases. Each phase adds a coherent set of capabilities rather than a single isolated technology, because production environments are built in layers of dependency, not in a random order.

### Phase 1 — Windows Infrastructure

Active Directory Domain Services, DNS, DHCP, Group Policy, Certificate Services (PKI), WSUS, LAPS, and Windows Client administration. This phase establishes identity, name resolution, address assignment, policy enforcement, and certificate trust — the foundational services every later phase depends on.

### Phase 2 — Enterprise Networking

pfSense perimeter firewall, VLAN segmentation, inter-VLAN routing, access control lists, site-to-site and remote access VPN. This phase establishes the network boundary and internal segmentation that later security and monitoring controls will enforce policy against.

### Phase 3 — Enterprise Security

Microsoft Defender for Endpoint, BitLocker with key escrow, endpoint hardening baselines, vulnerability management, and patch compliance. This phase converts the infrastructure built in Phases 1 and 2 into a defensible environment.

### Phase 4 — Monitoring

Centralized logging, Splunk and Microsoft Sentinel ingestion, Wazuh deployment, log retention policy, and alert tuning. This phase establishes visibility across identity, network, and endpoint layers.

### Phase 5 — Detection

Detection engineering, threat hunting methodology, MITRE ATT&CK-aligned use case development, and SOAR playbook creation. This phase converts raw visibility into actionable detection.

### Phase 6 — Automation

PowerShell automation of recurring administrative tasks, configuration drift detection, scheduled remediation, and automated evidence collection. This phase reduces manual operational overhead and increases consistency.

### Phase 7 — Cloud

Azure and AWS baseline deployment, Entra ID hybrid identity, Intune device management, and cloud workload security. This phase extends the on-premises enterprise into hybrid and cloud-native operations.

### Phase 8 — Purple Team

Coordinated offensive and defensive exercises, malware analysis, digital forensics, incident response tabletop exercises, and control validation against GRC frameworks including NIST, CMMC, and PCI DSS. This phase validates that every prior phase performs as designed under adversarial conditions.

---

## Enterprise Architecture

```
                                   +-------------------+
                                   |     INTERNET       |
                                   +----------+----------+
                                              |
                                    +---------v---------+
                                    |   pfSense Firewall  |
                                    |  (Perimeter / IDS)  |
                                    +---------+----------+
                                              |
                        +---------------------+---------------------+
                        |                     |                     |
                +-------v-------+     +-------v-------+     +-------v-------+
                |  Core Switch   |     |   VPN Gateway  |     | IDS/IPS Sensor |
                |  (VLAN Trunk)  |     | (Remote Users) |     |  (Inline/SPAN) |
                +-------+-------+     +---------------+     +---------------+
                        |
      +-----------------+------------------+------------------+
      |                 |                  |                  |
+-----v-----+     +-----v-----+     +------v------+     +-----v-----+
| VLAN 10    |     | VLAN 20    |     | VLAN 30      |     | VLAN 40    |
| Servers    |     | Clients    |     | Security Ops  |     | Management |
+-----+-----+     +-----+-----+     +------+------+     +-----+-----+
      |                 |                  |                  |
+-----v------------+  +-v----------------+ +v----------------+ +v---------------+
| Domain Controllers|  | Windows Clients  | | SIEM (Sentinel/  | | Firewall / Switch|
| DNS / DHCP / PKI  |  | (Domain Joined)  | |  Splunk / Wazuh) | | Management Plane |
+--------------------+ +------------------+ +------------------+ +------------------+
      |                                             |
+-----v-----------------+                  +--------v---------+
| Linux Servers          |                  | SOAR / Detection  |
| (App / Log Collectors) |                  | Engineering        |
+------------------------+                  +---------------------+
      |
+-----v-----------------------------------------------------------+
|                        Endpoint Detection & Response              |
|                (Microsoft Defender / Agent Fleet)                 |
+---------------------------------------------------------------------+

                        Hybrid / Cloud Extension
      +----------------------------+   +----------------------------+
      |          Azure              |   |            AWS              |
      |  Entra ID / Intune / VMs    |   |     IAM / EC2 / VPC / S3    |
      +----------------------------+   +----------------------------+
```

This diagram represents the target end-state architecture, not the current deployment. As each phase in the roadmap is completed, the corresponding segment of this diagram moves from planned to operational, and the Current Enterprise Capabilities section is updated to reflect it.

The segmentation shown above is deliberate rather than illustrative. Servers, clients, security operations tooling, and management interfaces sit on separate VLANs so that a compromise on the client network does not have direct line of sight to domain controllers or SIEM infrastructure. The security operations VLAN, hosting the SIEM and SOAR platform, is treated as a protected enclave with tightly scoped access, consistent with how monitoring infrastructure is isolated in production environments to prevent an attacker from disabling visibility during an active intrusion. The management VLAN, used for out-of-band administration of the firewall and switching infrastructure, is similarly isolated from general user traffic. As Phase 2 and Phase 3 are implemented, the access control lists governing traffic between these VLANs will be documented in the corresponding module's runbook, along with the justification for each permitted flow.

---

## Repository Structure

```
cyber-defense-journey/
├── README.md
├── docs/
│   ├── architecture/
│   │   └── enterprise-architecture.md
│   └── standards/
│       └── documentation-standard.md
│
├── phase-01-windows-infrastructure/
│   ├── active-directory/
│   │   ├── README.md
│   │   ├── runbook.md
│   │   ├── automation/
│   │   │   └── Deploy-DomainController.ps1
│   │   ├── lab-notes.md
│   │   └── evidence/
│   │       ├── screenshots/
│   │       └── logs/
│   ├── dns-dhcp/
│   │   ├── README.md
│   │   ├── runbook.md
│   │   ├── automation/
│   │   │   └── Configure-DnsDhcp.ps1
│   │   ├── lab-notes.md
│   │   └── evidence/
│   └── group-policy/
│       ├── README.md
│       ├── runbook.md
│       ├── automation/
│       │   └── Deploy-BaselineGPOs.ps1
│       ├── lab-notes.md
│       └── evidence/
│
├── phase-02-enterprise-networking/
│   └── week-XX-pfsense-perimeter/
│       ├── README.md
│       ├── runbook.md
│       ├── automation/
│       ├── lab-notes.md
│       └── evidence/
│
├── phase-03-enterprise-security/
├── phase-04-monitoring/
├── phase-05-detection/
├── phase-06-automation/
├── phase-07-cloud/
├── phase-08-purple-team/
│
└── reports/
    └── nist-mapping/
        └── control-mapping.md
```

Every module directory — regardless of which phase it belongs to — follows the same five-document structure: README, Runbook, Automation, Lab Notes, and Evidence. This consistency is intentional. An engineer or reviewer who understands the structure of one module understands the structure of every module in the repository.

---

## Documentation Standard

Every module in this repository produces five artifacts. Each artifact has a distinct purpose and none of them are interchangeable.

**README.md** — Explains the business or security justification for the module: what problem existed, what capability was added, and how it fits into the broader enterprise. This is the document a technical leader reads to understand why the work exists.

**Runbook.md** — A step-by-step operational procedure written so that another engineer could execute it without prior context. This is the document an operations team reads at 2 a.m. during an incident, not a narrative of what happened, but a precise procedure for what to do.

**Automation (.ps1)** — The PowerShell script(s) that implement or support the capability. Automation exists to make the implementation repeatable and to reduce the operational burden of manual configuration.

**Lab Notes.md** — Engineering observations captured during implementation: problems encountered, decisions made, configuration values chosen and why, and anything that deviated from the original plan. This is the document that preserves institutional knowledge.

**Evidence/** — Screenshots, exported logs, configuration exports, and command output that prove the capability was implemented and functions as documented. Evidence is what separates a claim from a verified fact.

---

## Documentation Philosophy

Each of the five artifacts answers a different question, and together they form a complete operational record:

- **README explains WHY** the capability exists.
- **Runbook explains HOW** to execute or reproduce it.
- **PowerShell performs THE TASK** itself.
- **Evidence PROVES** the implementation actually happened and works.
- **Lab Notes CAPTURE** the engineering judgment behind the decisions made.

This mirrors how documentation functions inside a real IT organization. A README without a runbook cannot be operated by anyone other than its author. A runbook without evidence cannot be trusted by an auditor or a new team member. Lab notes without a README are just personal scratch work with no business context. The five documents are only complete as a set, and this repository treats them that way for every module, without exception.

---

## Enterprise Growth Philosophy

Every module added to this repository is required to answer seven questions before it is considered complete:

1. What business problem exists?
2. What was implemented?
3. Why was it implemented this way, rather than an alternative?
4. How was it implemented, step by step?
5. How was it validated?
6. How does it improve the enterprise as a whole?
7. What operational capability did the enterprise not have before, that it has now?

These questions are the same ones asked in change management reviews, architecture review boards, and post-implementation reviews inside production organizations. Answering them for every module, rather than only for the largest ones, is what keeps this repository aligned with how enterprise infrastructure work is actually evaluated.

---

## Documentation Quality Standards

This repository holds every module to the following standards, consistent with the expectations placed on production infrastructure documentation:

**Consistency** — Every module uses the same five-document structure and the same terminology, so that documentation quality does not depend on which module a reader happens to open.

**Repeatability** — Every runbook and script is written so that the implementation can be reproduced by someone other than the original author, without requiring undocumented tribal knowledge.

**Automation** — Manual, repetitive administrative work is automated wherever the effort of automation is justified by the frequency or risk of the task, consistent with standard operations practice.

**Operational Readiness** — Documentation is written for the person who has to operate or troubleshoot the system later, not only for the person who built it.

**Business Continuity and Disaster Recovery** — Where applicable, modules document recovery procedures and dependencies, not just the happy-path build steps.

**Configuration Management** — Configuration values, baselines, and version history are recorded so that drift can be identified and corrected.

**Operational Documentation** — Every capability that reaches production status in this repository has a corresponding runbook that a different engineer could follow without assistance from the original author.

---

## Skills Developed

| Category | Skills |
|---|---|
| Infrastructure | Server build and lifecycle management, capacity planning, dependency mapping |
| Networking | VLAN segmentation, routing, firewall policy, VPN configuration, IDS/IPS tuning |
| Security | Endpoint hardening, vulnerability management, PKI, encryption key management |
| PowerShell | Scripted deployment, configuration automation, remediation scripting |
| Windows | Active Directory, Group Policy, DNS, DHCP, WSUS, Certificate Services |
| Cloud | Azure and AWS baseline configuration, Entra ID, Intune, hybrid identity |
| Monitoring | SIEM ingestion and correlation, log retention design, alert tuning |
| Automation | SOAR playbook design, scheduled remediation, drift detection |
| Compliance | NIST control mapping, CMMC practice alignment, PCI DSS scoping and evidence |

---

## Interview Readiness

Every completed module in this repository is built to support technical interviews, not only as a portfolio artifact but as a rehearsed engineering narrative. Each module includes:

- An enterprise explanation of the capability and the problem it solves.
- Operational documentation describing how the capability is run and maintained.
- PowerShell automation demonstrating the implementation, not just the concept.
- Lessons learned, including what was tried, what failed, and what was changed.
- Interview-style questions that a hiring manager or panel might reasonably ask about the module.
- A note on how the module maps to resume language and role requirements.

This structure exists because technical interviews reward candidates who can explain not just what they built, but why they built it that way, what tradeoffs they considered, and how they validated it. A module documented to this standard can be discussed in depth without notes, because the reasoning was captured at the time the work was done rather than reconstructed afterward.

---

## Why This Repository Is Different

A typical lab repository is a collection of completed exercises: a folder per topic, a screenshot or two, and a brief note that the lab was finished. That structure demonstrates exposure to tools. It does not demonstrate engineering judgment.

This repository is organized around engineering, not exposure:

- **Engineering** — Every module documents a design decision, not just a configuration step.
- **Operations** — Every module includes a runbook written for someone other than the author.
- **Documentation** — Every module follows a consistent, enterprise-aligned documentation standard.
- **Automation** — Every module includes the automation used to implement or support it.
- **Validation** — Every module includes evidence that the capability works as documented, not just that it was configured.
- **Continuous Improvement** — Modules are revisited and updated as later phases change requirements or reveal better approaches.
- **Enterprise Thinking** — Every module is evaluated by its contribution to the enterprise as a whole, not by its standalone completion.

The distinction is not cosmetic. A hiring manager evaluating this repository is not looking for evidence that labs were completed. They are looking for evidence that the person building it thinks about infrastructure the way an infrastructure team does: in terms of dependencies, operational risk, documentation, and long-term maintainability.

---

## Long-Term Vision

The finished state of this repository is the complete engineering documentation of an enterprise environment built from nothing: identity and directory services, networking and perimeter security, endpoint and server hardening, centralized monitoring, detection engineering, automation, hybrid cloud integration, and validated incident response — each phase built on the phase before it, each capability documented to a standard that would be recognizable inside a real infrastructure or security operations team.

This repository will continue to grow as long as there are capabilities left to build, and every capability added will be held to the same standard as the first: implemented, validated, automated where appropriate, and documented well enough that someone else could pick it up and understand exactly what it does and why it exists.
