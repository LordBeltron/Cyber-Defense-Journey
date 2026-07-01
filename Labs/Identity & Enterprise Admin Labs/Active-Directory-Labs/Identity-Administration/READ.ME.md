# Week 2 - Day 2: Identity Administration and Access Management

## Overview

In this lab, I continued building my Active Directory environment by performing common Identity and Access Management (IAM) administrative tasks. The focus of this lab was managing user accounts, security groups, organizational units (OUs), computer objects, and access assignments using PowerShell.

This lab simulates tasks commonly performed by Active Directory Administrators, IAM Analysts, Help Desk Technicians, and System Administrators in enterprise environments.

---

## Objectives

- Create and manage Organizational Units (OUs)
- Manage user account lifecycle operations
- Disable and re-enable user accounts
- Move users between OUs
- Audit user and group memberships
- Create and manage computer objects
- Audit Active Directory objects
- Create and onboard new employees
- Validate Role-Based Access Control (RBAC)

---

## Environment

| Component | Value |
|------------|------------|
| Hypervisor | Oracle VirtualBox |
| Operating System | Windows Server 2025 Standard Evaluation |
| Hostname | DC01 |
| Domain | corp.local |
| Directory Service | Active Directory Domain Services (AD DS) |
| DNS | Active Directory Integrated DNS |

---

# Tasks Completed

## 1. Created Disabled Users OU

Created a dedicated Organizational Unit for disabled user accounts.

### Purpose

Separating disabled accounts from active users helps maintain directory organization and simplifies account audits.

### Screenshot

![Disabled Users OU](Screenshots/01-disabled-users-ou.png)

---

## 2. Disabled a User Account

Disabled the account for Alice Smith.

### Purpose

Simulates employee termination or account suspension.

### Screenshot

![Disable User](Screenshots/02-disable-user.png)

---

## 3. Moved Disabled User to Disabled Users OU

Moved Alice Smith from the HR OU to the Disabled Users OU.

### Purpose

Demonstrates proper account lifecycle management and organizational separation.

### Screenshot

![Disabled User OU Move](Screenshots/03-disabled-user-ou-move.png)

---

## 4. Re-enabled User Account

Reactivated Alice Smith and returned her to the HR OU.

### Purpose

Simulates employee reinstatement or internal transfer.

### Screenshot

![User Reactivation](Screenshots/04-user-reactivation.png)

---

## 5. Verified RBAC Group Memberships

Audited group memberships for:

- John Doe
- Alice Smith
- Mike Jones

### Groups Verified

- IT_Admins
- HR_Users
- Finance_Users

### Purpose

Validates Role-Based Access Control (RBAC) assignments.

### Screenshot

![RBAC Verification](Screenshots/05-rbac-membership-verification.png)

---

## 6. Created Computer Objects

Created workstation objects:

- WS01
- WS02
- WS03

### Purpose

Demonstrates device identity management within Active Directory.

### Screenshot

![Computer Object Creation](Screenshots/06-computer-object-creation.png)

---

## 7. Audited Computer Objects

Verified:

- Computer names
- Enabled status
- Distinguished Names

### Purpose

Introduces Active Directory object auditing techniques.

### Screenshot

![Computer Object Audit](Screenshots/07-computer-object-audit.png)

---

## 8. Created Managed Devices OU

Created a new Organizational Unit named:

- Managed Devices

Moved workstation objects into the new OU.

### Purpose

Demonstrates organizational management and Group Policy preparation.

### Screenshot

![Computer OU Move](Screenshots/08-computer-ou-move.png)

---

## 9. Performed OU-Scoped Auditing

Queried Active Directory objects within specific OUs.

### Audited OUs

- HR
- Finance
- Managed Devices

### Purpose

Demonstrates targeted searches and administrative auditing.

### Screenshot

![OU Targeted Auditing](Screenshots/09-ou-targeted-auditing.png)

---

## 10. Audited Disabled Accounts

Identified disabled accounts within Active Directory.

### Accounts Found

- Guest
- krbtgt

### Purpose

Introduces account lifecycle auditing and security review procedures.

### Screenshot

![Disabled Account Audit](Screenshots/10-disabled-account-audit.png)

---

## 11. New Employee Onboarding Workflow

Created a new employee:

### User Information

| Field | Value |
|---------|---------|
| Name | Robert Brown |
| Username | rbrown |
| Department | Sales |
| Group | Sales_Users |

### Tasks Performed

- Created user account
- Assigned OU placement
- Added security group membership
- Verified RBAC assignment

### Screenshot

![New User Onboarding](Screenshots/11-new-user-onboarding.png)

---

# Skills Demonstrated

## Identity Administration

- User lifecycle management
- Account provisioning
- Account deprovisioning
- Account reactivation

## Active Directory Administration

- Organizational Unit management
- User management
- Group management
- Computer object management

## Access Management

- Role-Based Access Control (RBAC)
- Group membership auditing
- Access verification

## PowerShell

- Active Directory module usage
- User administration cmdlets
- Group administration cmdlets
- Computer administration cmdlets
- Active Directory auditing

---

# Key Concepts Learned

### Organizational Units (OUs)

Containers used to organize Active Directory objects.

### Role-Based Access Control (RBAC)

Permissions are assigned to groups rather than individual users.

### User Lifecycle Management

Managing users through:

- Creation
- Modification
- Disablement
- Reactivation
- Deletion

### Device Identity Management

Computer accounts are treated as identities within Active Directory and can receive permissions, policies, and administrative controls.

---

# Outcome

Successfully built and administered a functional Active Directory environment while performing common Identity and Access Management (IAM) tasks including user administration, RBAC validation, directory auditing, device management, and employee onboarding workflows.

This lab provides foundational experience applicable to:

- IAM Analyst
- Active Directory Administrator
- Systems Administrator
- Help Desk Administrator
- Security Operations
- Governance, Risk, and Compliance (GRC)
- Identity Governance and Administration (IGA)