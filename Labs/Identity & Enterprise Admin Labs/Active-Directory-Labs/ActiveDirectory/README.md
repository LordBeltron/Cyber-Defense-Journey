# Active Directory Lab – Day 1
## Windows Server 2025 Domain Controller Deployment

## Skills Demonstrated

- Windows Server 2025 Administration
- Active Directory Domain Services (AD DS)
- DNS Administration
- PowerShell Administration
- Active Directory Forest Deployment
- Organizational Unit (OU) Design
- Security Group Management
- Role-Based Access Control (RBAC)
- Identity and Access Management (IAM) Fundamentals
- Troubleshooting and System Deployment

---

# Lab Objective

The objective of this lab was to deploy a Windows Server 2025 Active Directory environment from scratch using VirtualBox.

The lab included:

- Windows Server installation
- Initial server configuration
- Active Directory Domain Services deployment
- DNS installation and configuration
- Active Directory forest creation
- Organizational Unit (OU) creation
- Security group implementation
- User and access management

All administrative tasks were completed using PowerShell and Windows Server Core.

---

# Environment Configuration

| Component | Configuration |
|------------|---------------|
| Hypervisor | Oracle VirtualBox |
| Operating System | Windows Server 2025 Standard Evaluation (Server Core) |
| RAM | 4096 MB |
| CPU | 2 vCPU |
| Storage | 80 GB VDI |
| Network | NAT |

---

# Lab Architecture

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

# Deployment Process

## 1. Virtual Machine Configuration

Configured a Windows Server 2025 virtual machine in Oracle VirtualBox.

### Screenshots

![VM Memory and Boot Configuration](Screenshots/01-vm-memory-boot-configuration.png)

![VM Display Configuration](Screenshots/02-vm-display-configuration.png)

---

## 2. Windows Server Installation

Installed Windows Server 2025 and configured storage for deployment.

### Screenshots

![Disk Selection](Screenshots/03-windows-server-installation-disk-selection.png)

![Partition Error](Screenshots/04-windows-server-partition-error.png)

![Installation Progress](Screenshots/05-windows-installation-progress.png)

### Lessons Learned

An installation error occurred during partition selection and was resolved by recreating the partition structure.

---

## 3. Initial Server Configuration

Verified network connectivity and initial server settings.

### Commands

```powershell
Get-NetAdapter
ipconfig
whoami
hostname
```

### Screenshots

![SConfig](Screenshots/06-sconfig-initial-server-configuration.png)

![Network Adapter Verification](Screenshots/07-network-adapter-verification.png)

![Initial Server Verification](Screenshots/08-initial-server-verification.png)

---

## 4. Server Renaming

Renamed the server to DC01.

### Command

```powershell
Rename-Computer -NewName "DC01" -Restart
```

### Screenshot

![Server Rename](Screenshots/09-server-rename-dc01.png)

---

## 5. Active Directory and DNS Installation

Installed Active Directory Domain Services and DNS.

### Command

```powershell
Install-WindowsFeature AD-Domain-Services,DNS -IncludeManagementTools
```

### Screenshot

![AD DS Installation](Screenshots/10-adds-dns-installation.png)

---

## 6. Forest Creation

Created a new Active Directory forest.

### Command

```powershell
Install-ADDSForest -DomainName "corp.local" -DomainNetbiosName "CORP" -InstallDNS
```

### Screenshots

![Forest Creation](Screenshots/11-forest-creation.png)

![Forest Verification](Screenshots/12-forest-creation-verification.png)

### Result

Successfully deployed:

- Forest: corp.local
- Domain: corp.local
- Domain Controller: DC01
- DNS Integration Enabled

---

## 7. Organizational Unit Creation

Created Organizational Units to organize resources and support Group Policy deployment.

### Organizational Units

- IT
- HR
- Finance
- Sales
- Servers
- Workstations

### Screenshot

![OU Creation](Screenshots/13-organizational-unit-creation.png)

---

## 8. Security Group Creation

Implemented Role-Based Access Control (RBAC) using Active Directory security groups.

### Security Groups

- IT_Admins
- HR_Users
- Finance_Users
- Sales_Users

### Screenshots

![Security Group Creation](Screenshots/14-security-group-creation.png)

![Security Group Verification](Screenshots/15-security-group-verification.png)

---

# Key Concepts Learned

## Active Directory Domain Services

Provides centralized authentication and authorization services.

## DNS

Critical service used by Active Directory for locating Domain Controllers and authentication services.

## Forest

The highest security boundary within Active Directory.

## Organizational Units

Containers used to organize users, groups, and computers while supporting Group Policy and delegated administration.

## Security Groups

Used to simplify permission management and implement Role-Based Access Control.

## PowerShell Administration

All major deployment and administration tasks were performed through PowerShell, reinforcing automation and command-line administration skills.

---

# Files Included

## Documentation

- README.md
- Notes/active-directory-day1-notes.md

## Commands

- Commands/day1-commands.ps1

## Screenshots

- 15 deployment screenshots documenting the complete build process

---

# Outcome

Successfully deployed a fully functional Active Directory environment consisting of:

- Windows Server 2025
- Active Directory Domain Services
- DNS Server
- Active Directory Forest
- Organizational Units
- Security Groups
- User Accounts
- RBAC Foundations

This environment will be expanded in future labs to include:

- Group Policy Management
- Windows 11 Domain Join
- Active Directory Administration
- Microsoft Entra ID
- Identity Governance
- Conditional Access
- Zero Trust Concepts