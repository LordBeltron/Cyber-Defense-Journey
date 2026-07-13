# GPO Security Filtering

---

# Executive Summary

This module focuses on implementing and validating Group Policy Security Filtering within an Active Directory environment using Windows Server 2025 and PowerShell.

While Organizational Units (OUs) provide logical organization for users and computers, Security Filtering provides a second layer of control by determining exactly which security principals are permitted to apply a Group Policy Object (GPO).

Throughout this lab, I verified existing security groups, reviewed the default Group Policy security configuration, implemented targeted Security Filtering using Active Directory groups, evaluated Microsoft's recommendations regarding Group Policy processing, and documented enterprise best practices for deploying Group Policy securely.

Unlike the previous module, which focused on creating and linking Group Policy Objects, this module focuses on controlling who is authorized to receive those policies.

---

# Lab Environment

## Organization

Cyber Defense Journey Enterprise Lab

## Domain

corp.local

## Domain Controller

DC01

## Platform

- Windows Server 2025 Standard Evaluation
- Server Core Installation
- Active Directory Domain Services
- Group Policy
- PowerShell
- VirtualBox

---

# Enterprise Scenario

The Human Resources department has requested a security policy that should apply only to authorized HR personnel.

The policy has already been created and linked to the Human Resources Organizational Unit.

As the Windows Systems Administrator, your task is to implement Security Filtering so that only members of the designated HR security group receive the policy while maintaining Microsoft's recommended Group Policy processing model.

The implementation must:

- Restrict policy application to authorized HR users
- Preserve reliable Group Policy processing
- Follow Microsoft's security recommendations
- Document the implementation for future administrators
- Support future auditing and change management

---

# Enterprise Relevance

Security Filtering is one of the primary methods organizations use to implement the Principle of Least Privilege within Active Directory.

Rather than applying every Group Policy to every user within an Organizational Unit, administrators can target policies to specific users, departments, security groups, or computer objects.

This approach provides several advantages:

- Reduces unnecessary policy processing
- Limits administrative exposure
- Improves security
- Simplifies policy management
- Supports Role-Based Access Control (RBAC)
- Improves governance and compliance

Security Filtering is widely used in enterprise environments to deploy department-specific configurations, privileged administrative policies, workstation baselines, and application settings.

---

# Objectives

By the end of this module, I will have:

- Verified existing Active Directory security groups
- Reviewed default Group Policy permissions
- Implemented Security Filtering using an Active Directory security group
- Validated updated Group Policy permissions
- Evaluated Microsoft's recommendations regarding Group Policy processing
- Documented enterprise deployment considerations
- Produced operational documentation for future administrators

---

# What I Accomplished

During this module I successfully:

- Verified the HR_Users security group
- Audited the default security permissions assigned to a Group Policy Object
- Granted Apply Group Policy permissions to the HR_Users security group
- Verified the updated security filtering configuration
- Evaluated Microsoft's warning regarding the removal of Authenticated Users
- Documented why Microsoft's default configuration should typically be preserved
- Demonstrated targeted Group Policy deployment while maintaining reliable Group Policy processing

---

# Step-by-Step Workflow

---

# Step 1 – Verify the HR Security Group

## Objective

Verify that the Human Resources security group exists before assigning Group Policy permissions.

---

## Why This Is Important

Before administrators assign Security Filtering permissions, they must confirm that the appropriate Active Directory security group already exists.

Verifying the security group ensures:

- Correct group selection
- Accurate permission assignment
- Proper RBAC implementation
- Reduced administrative errors

This step also confirms that identity administration has been completed successfully before Group Policy administration begins.

---

## Command

```powershell
Get-ADGroup HR_Users
```

---

## What This Command Does

This command queries Active Directory for the HR_Users security group and displays its configuration.

Information reviewed included:

- Group Name
- Distinguished Name
- Group Category
- Group Scope
- Security Identifier (SID)

---

## Artifact Verified

```
Active Directory Security Group

HR_Users
```

---

## Evidence

```
Evidence/
└── 01-hr-group-verification.png
```

---

> 💡 **Administrator Tip**
>
> Always verify the target security group before modifying Group Policy permissions. Assigning permissions to the wrong group can unintentionally expose security settings to unauthorized users.

---

> 🔒 **Security Best Practice**
>
> Use descriptive security group names that clearly identify their purpose. Consistent naming conventions simplify administration, auditing, and troubleshooting.

---

> 🏢 **Enterprise Insight**
>
> Most enterprise environments use Role-Based Access Control (RBAC), where security groups represent job functions rather than individual users. Security Filtering builds directly upon this model.

---

## Enterprise Relevance

Verifying identity objects before assigning permissions helps reduce administrative mistakes while ensuring policies are deployed only to authorized personnel.

---

## Skills Demonstrated

- Active Directory Administration
- Identity Administration
- PowerShell
- RBAC
- Enterprise Verification

---

# Step 2 – Review the Default Security Filtering Configuration

## Objective

Review the existing permissions assigned to the HR Security Policy before implementing Security Filtering.

---

## Why This Is Important

Understanding the current configuration is an essential part of change management.

Enterprise administrators should always establish a baseline before making configuration changes.

Reviewing the existing permissions provides:

- Current policy scope
- Existing security principals
- Existing delegation
- Change validation
- Rollback reference

---

## Command

```powershell
Get-GPPermission -Name "HR Security Policy" -All
```

---

## What This Command Does

This command enumerates every security principal currently assigned permissions to the HR Security Policy.

The results identify:

- Security Groups
- Permission Levels
- Apply Group Policy rights
- Administrative Delegation

---

## Artifact Reviewed

```
HR Security Policy

Existing Group Policy Permissions
```

---

## Evidence

```
Evidence/
└── 02-default-security-filtering.png
```

---

> 💡 **Administrator Tip**
>
> Always document the original permissions before making changes. Having a baseline simplifies troubleshooting and rollback if unexpected behavior occurs.

---

> 🏢 **Enterprise Insight**
>
> Establishing a baseline before implementing changes is a fundamental practice in enterprise change management and is commonly required for CAB (Change Advisory Board) approval.

---

> 📋 **Governance Note**
>
> Maintaining records of the original configuration supports auditability, accountability, and compliance with change management policies.

---

## Enterprise Relevance

Reviewing the existing configuration before modification ensures administrators understand the current environment before implementing new security controls.

---

## Skills Demonstrated

- Group Policy Administration
- PowerShell
- Change Management
- Configuration Review
- Operational Documentation

---

# Step 3 – Grant the HR Security Group Permission to Apply the Policy

## Objective

Grant the **HR_Users** Active Directory security group permission to apply the **HR Security Policy** without affecting existing Group Policy processing.

---

## Why This Is Important

Organizational Units determine **where** a Group Policy can be applied.

Security Filtering determines **who** is actually allowed to receive that policy.

By combining Organizational Units with Security Groups, administrators can deploy highly targeted policies while maintaining a centralized Group Policy structure.

This approach supports the Principle of Least Privilege by ensuring that only authorized users receive specific security settings.

---

## Command

```powershell
Set-GPPermission `
    -Name "HR Security Policy" `
    -TargetName "HR_Users" `
    -TargetType Group `
    -PermissionLevel GpoApply
```

---

## What This Command Does

This command:

- Locates the **HR Security Policy**
- Adds the **HR_Users** security group
- Grants **Read** and **Apply Group Policy** permissions
- Leaves all existing permissions unchanged

The policy is now capable of being targeted specifically to HR personnel.

---

## Artifact Modified

```
Group Policy Object

HR Security Policy
```

---

## Evidence

```
Evidence/
└── 03-hr-users-security-filter-added.png
```

---

> 💡 **Administrator Tip**
>
> When implementing Security Filtering, always add the new security group before removing or modifying existing permissions. This reduces the risk of accidentally preventing legitimate users or computers from processing the policy.

---

> 🔒 **Security Best Practice**
>
> Grant permissions to security groups rather than individual user accounts. This simplifies administration and supports Role-Based Access Control (RBAC).

---

> 🏢 **Enterprise Insight**
>
> Large organizations rarely assign permissions directly to users. Instead, users inherit access through departmental or functional security groups, making administration significantly easier.

---

> 📋 **Governance Note**
>
> Assigning permissions through security groups improves accountability because group membership can be audited independently from Group Policy configuration.

---

## Enterprise Relevance

Security Filtering allows organizations to deploy department-specific policies without creating duplicate Group Policy Objects.

This reduces administrative overhead while improving security.

---

## Skills Demonstrated

- Active Directory Administration
- Group Policy Administration
- RBAC
- Identity Governance
- PowerShell
- Least Privilege

---

# Step 4 – Verify Updated Security Filtering

## Objective

Confirm that the **HR_Users** security group has been successfully granted permission to apply the Group Policy.

---

## Why This Is Important

Configuration changes should always be verified.

Verification ensures that:

- The intended security group received permissions.
- The command executed successfully.
- No unexpected configuration changes occurred.
- The environment is ready for production use.

---

## Command

```powershell
Get-GPPermission `
    -Name "HR Security Policy" `
    -All
```

---

## What This Command Does

Displays every security principal currently assigned permissions to the HR Security Policy.

The verification confirms that:

- HR_Users has **Apply Group Policy**
- Existing administrative permissions remain intact
- Default security principals remain present

---

## Artifact Verified

```
HR Security Policy

Updated Group Policy Permissions
```

---

## Evidence

```
Evidence/
└── 03-hr-users-security-filter-added.png
```

---

> 💡 **Administrator Tip**
>
> Never assume a configuration change succeeded simply because the command completed without errors. Verification is an essential part of every administrative workflow.

---

> 🏢 **Enterprise Insight**
>
> Verification is a required step in mature Change Management processes. Production changes are typically not considered complete until they have been independently validated.

---

## Enterprise Relevance

Verifying configuration changes improves operational reliability and reduces troubleshooting time.

---

## Skills Demonstrated

- PowerShell
- Operational Verification
- Configuration Validation
- Group Policy Administration

---

# Step 5 – Evaluate Microsoft's Warning

## Objective

Understand why Microsoft discourages removing **Authenticated Users** from the Group Policy security configuration.

---

## Why This Is Important

One of the responsibilities of an enterprise administrator is understanding **why** a configuration exists before changing it.

Removing security principals without understanding their purpose can unintentionally prevent Group Policy from functioning correctly.

This step focuses on understanding Microsoft's recommended design rather than simply following commands.

---

## Attempted Command

```powershell
Set-GPPermission `
    -Name "HR Security Policy" `
    -TargetName "Authenticated Users" `
    -TargetType Group `
    -PermissionLevel None
```

---

## Result

Windows Server displayed a warning explaining that removing **Authenticated Users** may prevent client computers from reading Group Policy information.

The operation was intentionally cancelled.

---

## Evidence

```
Evidence/
└── 04-microsoft-security-filtering-warning.png
```

---

## Why Microsoft's Warning Matters

Many new administrators assume that removing **Authenticated Users** makes a Group Policy "more secure."

In reality, **Authenticated Users** often provides the **Read** permission required for computers and users to evaluate Group Policy during processing.

Removing it incorrectly can prevent legitimate systems from processing policy.

The warning exists to prevent administrators from unintentionally disrupting Group Policy.

---

> 💡 **Administrator Tip**
>
> Microsoft's warnings are often educational.
>
> Rather than immediately bypassing them, take time to understand **why** the warning exists.

---

> 🔒 **Security Best Practice**
>
> Avoid removing default security principals unless you fully understand the operational impact and have verified an alternative permission model.

---

> ⚠️ **Common Mistake**
>
> Confusing **Apply Group Policy** with **Read** permissions.
>
> These are separate permissions that serve different purposes during Group Policy processing.

---

> 🏢 **Enterprise Insight**
>
> Mature organizations rarely remove Microsoft's default permissions without extensive testing. Maintaining supported configurations simplifies troubleshooting and future upgrades.

---

> 📋 **Governance Note**
>
> Deviating from vendor-recommended security configurations should always be documented, tested, and approved through formal change management.

---

## Enterprise Relevance

Understanding vendor recommendations enables administrators to make informed security decisions instead of blindly hardening configurations.

---

## Skills Demonstrated

- Identity Governance
- Active Directory
- Group Policy
- Security Architecture
- Change Management
- Risk Assessment

---

# Questions Answered During This Module

## Why use Security Filtering instead of creating multiple Group Policy Objects?

Creating separate Group Policy Objects for every department quickly becomes difficult to manage in large environments.

Security Filtering allows administrators to maintain a single Group Policy Object while controlling exactly which users or computers are permitted to apply it. This reduces administrative overhead, simplifies change management, and improves consistency across the environment.

---

## Why use Active Directory security groups instead of assigning permissions directly to users?

Assigning permissions directly to individual user accounts does not scale in enterprise environments.

Security groups allow administrators to manage access through Role-Based Access Control (RBAC). As employees join, transfer between departments, or leave the organization, administrators only need to modify group membership rather than editing Group Policy permissions.

This approach reduces administrative effort while improving security and consistency.

---

## Why did Microsoft warn against removing Authenticated Users?

Many administrators mistakenly believe removing **Authenticated Users** improves security.

In reality, Authenticated Users commonly provides the **Read** permission required for computers and users to evaluate Group Policy during processing.

Removing this permission without understanding the underlying processing model can prevent policies from being evaluated correctly.

Microsoft displays the warning to help administrators avoid unintentionally disrupting Group Policy processing.

---

## Why is verification performed after every configuration change?

Enterprise administrators should never assume a configuration change succeeded simply because a command completed successfully.

Verification confirms:

- The intended change occurred.
- No unexpected changes were introduced.
- Administrative documentation remains accurate.
- The environment is operating as expected.

Verification is a standard part of operational change management.

---

## Why does Security Filtering support the Principle of Least Privilege?

Least Privilege states that users and systems should receive only the permissions necessary to perform their job functions.

Security Filtering enforces this principle by ensuring that only authorized users or computers receive specific Group Policy settings.

This minimizes unnecessary policy application while reducing the organization's overall attack surface.

---

## Operational Use Cases

Security Filtering is commonly used to:

- Deploy department-specific security policies
- Restrict privileged administrative settings
- Apply workstation hardening policies
- Deploy application configurations
- Separate contractor and employee access
- Apply policies to pilot testing groups
- Perform phased deployments
- Support mergers and acquisitions
- Reduce unnecessary Group Policy processing
- Improve Active Directory organization

---

# Security Best Practices

- Use security groups rather than individual user accounts.
- Follow the Principle of Least Privilege.
- Verify all configuration changes.
- Document permission modifications.
- Preserve Microsoft's default permissions unless a supported alternative has been validated.
- Test Security Filtering before production deployment.
- Use descriptive naming conventions for security groups.
- Periodically review Group Policy permissions.

---

# Troubleshooting

## Issue

Unable to determine whether the Group Policy was correctly filtered.

### Cause

Configuration changes were not verified after implementation.

### Resolution

Used PowerShell to enumerate current Group Policy permissions and confirm that the HR_Users security group had been granted Apply Group Policy permissions.

---

## Issue

Microsoft displayed a warning when attempting to remove Authenticated Users.

### Cause

Removing Authenticated Users can prevent computers and users from reading Group Policy information during policy processing.

### Resolution

The operation was intentionally cancelled after reviewing Microsoft's warning. The default configuration was preserved because it represents Microsoft's recommended deployment model.

---

## Issue

Confusion between Read permissions and Apply Group Policy permissions.

### Cause

Many administrators assume these permissions perform the same function.

### Resolution

Reviewed Microsoft's Group Policy processing model and confirmed that Read and Apply Group Policy are separate permissions that serve different purposes.

---

# Skills Practiced

Throughout this module I gained practical experience with:

- Windows Server 2025 Administration
- Active Directory Administration
- Group Policy Administration
- Security Filtering
- Role-Based Access Control (RBAC)
- Identity Governance
- Least Privilege
- PowerShell Administration
- Configuration Validation
- Operational Verification
- Change Management
- Governance Documentation

---

# Resume Relevance

This module demonstrates hands-on experience with:

- Active Directory Domain Services (AD DS)
- Group Policy Management
- Group Policy Security Filtering
- Role-Based Access Control (RBAC)
- Identity and Access Management (IAM)
- PowerShell
- Windows Server Administration
- Change Management
- Configuration Management
- Enterprise Security Administration

These responsibilities are commonly found in System Administrator, Windows Administrator, IAM Administrator, Infrastructure Engineer, Security Administrator, SOC Analyst, and GRC Analyst positions.

---

# Interview Talking Points

## Interview Question

**Can you explain how Security Filtering works in Active Directory?**

### Example Response

> I implemented Security Filtering by assigning Apply Group Policy permissions to an Active Directory security group instead of relying solely on Organizational Units. This allowed me to target a single Group Policy Object to authorized HR users while maintaining a centralized Group Policy structure. Throughout the implementation I verified permissions, documented changes, and evaluated Microsoft's recommendations regarding default security principals.

---

## Interview Question

**How have you applied the Principle of Least Privilege?**

### Example Response

> In my Active Directory environment I used Security Filtering to ensure that only members of the HR_Users security group received the HR Security Policy. Rather than broadly applying policies across an Organizational Unit, I used Active Directory security groups to limit policy application to authorized personnel, supporting the Principle of Least Privilege and reducing unnecessary policy processing.

---

## Interview Question

**Have you worked with Role-Based Access Control?**

### Example Response

> Yes. I used Active Directory security groups to represent organizational roles rather than assigning permissions directly to individual users. Group Policy permissions were assigned to the security group, allowing user access to be managed through group membership. This approach improves scalability, simplifies administration, and aligns with enterprise RBAC practices.

---

## Interview Question

**Why is removing Authenticated Users not always recommended?**

### Example Response

> During my lab I intentionally evaluated Microsoft's warning regarding the removal of Authenticated Users from a Group Policy Object. I learned that Authenticated Users commonly provides the Read permission required during Group Policy processing. Rather than removing the permission simply to harden the configuration, I preserved Microsoft's recommended design after understanding the operational impact and documenting the reasoning.

---

# Evidence

The following evidence was generated throughout this module.

## Security Group Verification

- Evidence/01-hr-group-verification.png

## Baseline Configuration

- Evidence/02-default-security-filtering.png

## Security Filtering Implementation

- Evidence/03-hr-users-security-filter-added.png

## Microsoft Warning Evaluation

- Evidence/04-microsoft-security-filtering-warning.png

## Generated Configuration

The following Active Directory objects were used throughout this module.

```

Active Directory

├── HR_Users (Security Group)

│

Group Policy

├── HR Security Policy

│

Permissions

├── Read

├── Apply Group Policy

└── Administrative Delegation

```

---

# Lessons Learned

One of the most valuable lessons from this module was recognizing that Group Policy deployment is fundamentally an identity management problem rather than simply a configuration task.

Organizational Units determine where policies are linked, while Security Filtering determines who is authorized to receive those policies. Combining these two mechanisms allows administrators to deploy targeted security controls without unnecessarily increasing administrative complexity.

This exercise also reinforced the importance of understanding Microsoft's recommended configurations before making security changes. Rather than removing default permissions simply because they appeared overly permissive, I evaluated the operational purpose behind those permissions and learned why maintaining supported configurations often leads to more reliable enterprise environments.

Finally, implementing Security Filtering demonstrated how Active Directory supports the Principle of Least Privilege through Role-Based Access Control. Managing permissions through security groups instead of individual user accounts improves scalability, simplifies administration, and aligns with enterprise identity governance practices.

---

# Key Takeaways

- Organizational Units determine scope; Security Filtering determines authorization.
- Role-Based Access Control simplifies administration by assigning permissions to security groups rather than individual users.
- Least Privilege reduces unnecessary policy application and strengthens security.
- Verification should follow every administrative change.
- Understanding vendor recommendations is as important as understanding the commands themselves.
- Well-documented identity management practices improve security, governance, and operational consistency.

---

# From the Administrator's Desk

This module shifted my perspective on Group Policy administration. Before completing this exercise, I viewed Group Policy primarily as a mechanism for configuring Windows settings. Through implementing Security Filtering, I realized that Group Policy is equally an exercise in identity and access management.

Rather than asking, "Where should this policy be linked?" I learned to ask, "Who should be authorized to receive this policy, and why?" That change in perspective reflects how enterprise administrators approach security. Configuration is only one part of the process; authorization, governance, documentation, and validation are equally important.

One of the most valuable aspects of this lab was evaluating Microsoft's warning regarding the removal of Authenticated Users. Instead of blindly following a hardening recommendation, I took the time to understand the reasoning behind Microsoft's design. That reinforced an important lesson: secure administration is not about removing permissions wherever possible, but about understanding how each permission contributes to a reliable and supportable environment.

As the Cyber Defense Journey enterprise continues to mature, the identity governance concepts introduced in this module will become the foundation for future work involving privileged access management, endpoint security, SIEM correlation, compliance reporting, and enterprise-scale access control. Understanding who has access—and why—is a fundamental responsibility of every systems administrator and cybersecurity professional.

---

# Enterprise Maturity

## Before This Module

- Active Directory deployed
- Organizational Units created
- Users and groups provisioned
- Group Policies created and linked

## Added During This Module

- Group Policy Security Filtering
- Role-Based Access Control implementation
- Permission validation workflow
- Identity governance documentation
- Enterprise Security Filtering procedures
- Operational verification process

## Enterprise State After Completion

The Cyber Defense Journey enterprise now supports targeted Group Policy deployment through Security Filtering. Administrative policies can be assigned to authorized departments using Active Directory security groups while preserving Microsoft's recommended Group Policy processing model. This capability strengthens identity governance, improves operational security, and establishes a scalable access control model that will support future endpoint management, compliance initiatives, and enterprise security operations.