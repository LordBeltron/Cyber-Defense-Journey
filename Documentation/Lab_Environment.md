# LAB_ENVIRONMENT.md

**Project:** Cyber Defense Journey (CDJ)

**Version:** 1.0

**Status:** Active Development

**Last Updated:** July 2026

---

# Purpose

This document defines the current Cyber Defense Journey laboratory environment.

It serves as the authoritative reference for the virtual infrastructure, networking, operating systems, software, and supporting services used throughout the project.

Unlike the roadmap or project documentation, this document changes whenever the laboratory environment changes.

It should always reflect the current production state of the lab.

---

# Lab Objectives

The Cyber Defense Journey lab is designed to simulate a modern enterprise capable of supporting:

- Windows Infrastructure
- Active Directory
- Enterprise Networking
- Identity & Access Management
- Cloud Integration
- Security Operations
- Incident Response
- DevSecOps
- Governance
- Artificial Intelligence Security

Every technology implemented throughout Cyber Defense Journey should integrate into this environment whenever practical.

---

# Hypervisor

Current Platform

VirtualBox

Future Support

- VMware Workstation Pro
- Hyper-V
- Azure Virtual Machines
- AWS EC2

---

# Current Virtual Machines

## Domain Controller

Purpose

Primary Active Directory Domain Controller

Operating System

Windows Server 2025

Primary Roles

- Active Directory Domain Services
- DNS
- Group Policy
- DHCP (Upcoming)
- Certificate Services (Upcoming)

Status

Operational

---

## Windows Client

Purpose

Enterprise Workstation

Operating System

Windows 11 Enterprise

Purpose

- Domain Joined Client
- Group Policy Testing
- DNS Testing
- User Administration
- Authentication Testing

Status

Operational

---

# Planned Infrastructure

The following systems will be introduced as Cyber Defense Journey progresses.

## Infrastructure

- Secondary Domain Controller
- File Server
- Certificate Authority
- WSUS Server
- NPS Server

---

## Security

- Splunk Enterprise
- Wazuh
- Microsoft Sentinel
- Defender XDR

---

## Linux

- Ubuntu Server
- Kali Linux
- Rocky Linux

---

## Networking

- pfSense
- Security Onion (Future)
- Zeek
- Suricata

---

## DevSecOps

- Docker Host
- Kubernetes Cluster
- GitHub Actions Runner

---

## Cloud

- Microsoft Azure
- Microsoft 365
- Microsoft Entra ID
- Amazon Web Services

---

## Artificial Intelligence

- Enterprise AI Gateway
- AI Agent Environment
- MCP Server
- AI Security Lab

---

# Current Enterprise Services

## Identity

Status

Operational

Services

- Active Directory
- Organizational Units
- Users
- Groups
- Group Policy

---

## Infrastructure

Status

Operational

Services

- DNS
- Forward Lookup Zones
- Reverse Lookup Zones
- Enterprise Records

Upcoming

- DHCP
- PKI
- DFS
- File Services

---

## Networking

Status

In Progress

Current

- Basic Domain Networking

Upcoming

- VLANs
- Firewalls
- VPN
- Network Segmentation
- Zero Trust

---

# Software Inventory

## Administration

- PowerShell
- Active Directory Users & Computers
- Active Directory Administrative Center
- Group Policy Management
- DNS Manager

---

## Development

- Git
- GitHub
- Visual Studio Code

---

## Documentation

- Markdown
- Draw.io
- Microsoft Visio (Optional)

---

## Future Software

- Splunk Enterprise
- Wazuh
- Docker
- Kubernetes
- Terraform
- Burp Suite
- Ghidra
- Microsoft Sentinel
- Azure CLI
- AWS CLI

---

# Network Topology

Current

```text
Internet
        │
        │
Host Machine
        │
────────Virtual Network────────
        │
        ├───────────────┐
        │               │
Windows Server     Windows 11
2025 DC            Enterprise
```

Future

```text
                    Internet
                        │
                  Edge Firewall
                        │
                Core Enterprise Network
                        │
      ┌───────────┬────────────┬────────────┐
      │           │            │            │
  Domain      File Server   Linux      Security
 Controller                  Servers    Stack
      │
      ├──────── Azure
      │
      ├──────── Microsoft 365
      │
      ├──────── Entra ID
      │
      └──────── AWS
```

---

# Naming Standards

Virtual Machines

```
CDJ-DC01

CDJ-W11-01

CDJ-FS01

CDJ-CA01

CDJ-NPS01

CDJ-SPLUNK01

CDJ-WAZUH01

CDJ-KALI01
```

---

# Snapshot Strategy

Create snapshots:

- Before every new module
- Before major infrastructure changes
- Before software upgrades
- Before Active Directory changes

Naming Format

```
Phase-02-Module-04-Before-DHCP

Phase-04-Before-Entra

Phase-06-Before-Splunk
```

---

# Backup Strategy

Backup Frequency

Before every completed module

Backup Items

- Virtual Machines
- PowerShell Scripts
- Git Repository
- Architecture Diagrams
- Documentation

---

# Lab Growth Policy

The laboratory should evolve alongside the roadmap.

New technologies should only be added when they support an enterprise capability introduced during the current phase.

Avoid installing software prematurely.

The objective is to build the enterprise organically rather than assembling unrelated technologies.

---

# Future Expansion

Future additions may include:

- Hybrid Cloud
- Enterprise PKI
- SOC Environment
- Multi-Forest Active Directory
- Cross-Forest Trusts
- Azure Arc
- Kubernetes Production Cluster
- Enterprise AI Platform
- Identity Fabric
- Data Lake
- Security Data Lake
- Enterprise SIEM

Expansion should always align with the CDJ Enterprise Roadmap.

---

# Lab Philosophy

The laboratory is not intended to simulate every possible enterprise technology.

It exists to provide a realistic environment in which enterprise engineering concepts can be implemented, validated, documented, automated, and continuously improved.

Every new server, workstation, application, cloud service, and security platform should serve a clearly defined business purpose within the Cyber Defense Journey enterprise.

The lab grows because the enterprise grows.

The enterprise grows because the engineer grows.

**Build the Enterprise. Build the Engineer.**