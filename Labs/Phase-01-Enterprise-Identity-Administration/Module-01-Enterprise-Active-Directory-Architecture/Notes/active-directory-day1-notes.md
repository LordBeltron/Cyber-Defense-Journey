# Active Directory Lab – Day 1 Notes

## Overview

During this lab, a Windows Server 2025 virtual machine was deployed and configured as an Active Directory Domain Controller. Active Directory Domain Services (AD DS) and DNS were installed, a new forest was created, Organizational Units (OUs) were implemented, and security groups were configured to support Role-Based Access Control (RBAC).

---

# Windows Server Core

The server was installed using the Windows Server Core deployment option.

Key characteristics:

- Command-line administration
- Reduced attack surface
- Lower resource consumption
- Commonly used for infrastructure services

Most administrative tasks were completed through PowerShell rather than a graphical interface.

---

# Server Identity

The server was renamed from its default hostname to:

```text
DC01
```

Naming servers according to their role improves management and identification within an environment.

In this case:

```text
DC01
```

indicates:

- Domain Controller
- First domain controller in the environment

---

# Active Directory Domain Services (AD DS)

Active Directory Domain Services provides centralized authentication and authorization.

AD DS allows administrators to:

- Create users
- Create groups
- Manage computers
- Control access to resources
- Apply security policies

Installing AD DS transformed the server from a standalone system into a centralized identity management platform.

---

# Domain Name System (DNS)

DNS was installed alongside Active Directory.

DNS is required because Active Directory relies on DNS to locate services and domain controllers.

The DNS server was configured locally:

```text
127.0.0.1
```

This configuration allows the domain controller to resolve Active Directory services internally.

---

# Active Directory Forest

A new forest was created:

```text
corp.local
```

A forest is the highest-level container within Active Directory.

The forest contains:

- Domains
- Organizational Units
- Users
- Groups
- Computers

The forest deployed during this lab:

```text
Forest: corp.local
Domain: corp.local
NetBIOS Name: CORP
```

---

# Organizational Units (OUs)

Organizational Units were created to organize resources based on business function.

Created OUs:

```text
IT
HR
Finance
Sales
Servers
Workstations
```

Benefits of OUs:

- Logical organization
- Easier administration
- Delegation of permissions
- Group Policy targeting

---

# Security Groups

Security groups were created to support role-based access control.

Created groups:

```text
IT_Admins
HR_Users
Finance_Users
Sales_Users
```

Security groups simplify permission management by assigning permissions to groups rather than individual users.

Benefits:

- Easier administration
- Reduced permission errors
- Scalable access control

---

# Role-Based Access Control (RBAC)

The environment was structured around RBAC principles.

RBAC assigns permissions based on job responsibilities rather than individual identities.

Example:

```text
Finance Users
    ↓
Finance_Users Group
    ↓
Finance Resources
```

This approach improves security and simplifies administration.

---

# PowerShell Administration

PowerShell was used to perform all major deployment tasks.

Tasks completed through PowerShell included:

- Verifying network configuration
- Renaming the server
- Installing AD DS
- Installing DNS
- Creating the Active Directory forest
- Creating Organizational Units
- Creating Security Groups
- Managing user objects

PowerShell provides consistency, automation, and repeatability for administrative tasks.

---

# Environment Summary

Successfully deployed:

- Windows Server 2025
- Active Directory Domain Services
- DNS Server
- Active Directory Forest
- Domain Controller (DC01)
- Organizational Units
- Security Groups

Environment Structure:

```text
corp.local
│
├── IT
│   └── IT_Admins
│
├── HR
│   └── HR_Users
│
├── Finance
│   └── Finance_Users
│
├── Sales
│   └── Sales_Users
│
├── Servers
└── Workstations
```

---

# Key Takeaways

- Active Directory depends heavily on DNS.
- Domain Controllers provide centralized identity management.
- Organizational Units provide logical organization.
- Security Groups support scalable access control.
- PowerShell can be used to fully deploy and manage Active Directory environments.
- RBAC simplifies permission management and improves security.


# Concepts Learned

## Active Directory Hierarchy

Active Directory follows a hierarchical structure:

Forest
    ↓
Domain
    ↓
Organizational Units
    ↓
Users / Groups / Computers

In this lab:

Forest: corp.local
Domain: corp.local

The domain contains Organizational Units which contain users and security groups.

---

## Authentication vs Authorization

Authentication answers:

"Who are you?"

Examples:

- Username
- Password
- Kerberos ticket

Authorization answers:

"What are you allowed to access?"

Examples:

- Security groups
- File permissions
- Administrative privileges

Active Directory provides both authentication and authorization services.

---

## Why DNS Is Critical To Active Directory

Active Directory uses DNS to locate:

- Domain Controllers
- Authentication Services
- Kerberos Services
- LDAP Services

Without functioning DNS:

- User logons fail
- Domain joins fail
- Group Policy fails
- Authentication becomes unreliable

DNS is one of the most critical dependencies in an Active Directory environment.

---

## Organizational Unit Design

Organizational Units should represent administrative boundaries rather than physical structure.

Example:

Good:

- IT
- HR
- Finance
- Sales

Poor:

- Floor1
- Floor2
- BuildingA

Business-function OUs simplify permission management and Group Policy deployment.

---

## Security Groups and RBAC

Role-Based Access Control (RBAC) assigns permissions to groups instead of individual users.

Example:

User
    ↓
Finance_Users Group
    ↓
Finance Resources

Benefits:

- Easier administration
- Consistent permissions
- Reduced configuration errors
- Better scalability

---

## Domain Controller Responsibilities

A Domain Controller is responsible for:

- User authentication
- Authorization
- Directory services
- DNS integration
- Group Policy processing

In this lab:

DC01 serves as:

- Domain Controller
- DNS Server
- Authentication Server

for the corp.local domain.

---

## Why Server Core Matters

Server Core provides:

- Smaller attack surface
- Reduced resource usage
- Fewer running services
- Reduced patching requirements

Many enterprise environments use Server Core for infrastructure roles such as:

- Domain Controllers
- DNS Servers
- DHCP Servers

because it improves security and performance.

---

## PowerShell Administration

PowerShell enables administrators to:

- Automate deployments
- Standardize configurations
- Reduce manual errors
- Manage large environments efficiently

Every major task performed in this lab was completed through PowerShell commands rather than a graphical interface.

This approach improves repeatability and operational efficiency.