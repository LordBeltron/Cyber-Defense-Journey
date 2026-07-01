# Core GPO Administration

---

# Executive Summary

This module focuses on implementing centralized configuration management using Group Policy Objects (GPOs) within a Windows Server 2025 Active Directory environment.

Group Policy is one of the most powerful administrative technologies available in Active Directory. Rather than configuring each workstation individually, administrators define centralized policies that automatically apply security settings, administrative templates, user restrictions, software configurations, and operating system settings across the enterprise.

Throughout this module, I designed, created, linked, verified, and documented multiple Group Policy Objects while following Microsoft's recommended administrative practices. The implementation established a scalable policy structure that will support future security filtering, disaster recovery, compliance reporting, endpoint management, and enterprise hardening initiatives.

Rather than simply creating Group Policy Objects, this module establishes the configuration management foundation upon which the remainder of the Cyber Defense Journey enterprise will be built.

---

# Module Classification

**Domain**

Windows Infrastructure

**Category**

Configuration Management

**Focus Areas**

- Active Directory
- Group Policy
- Configuration Management
- PowerShell
- Windows Administration
- Enterprise Standardization

**Difficulty**

Intermediate

**Estimated Completion Time**

45–60 Minutes

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

Following the successful deployment of Active Directory, the Cyber Defense Journey organization requires a centralized method for managing workstation configuration, user settings, and security policies.

Managing computers individually is inefficient, inconsistent, and difficult to scale.

To improve operational consistency and reduce administrative overhead, Infrastructure Operations has selected Active Directory Group Policy as the organization's centralized configuration management platform.

As the Windows Systems Administrator, your responsibility is to create and deploy Group Policy Objects that establish standardized administrative control while preparing the environment for future security initiatives.

The implementation must:

- Centralize configuration management
- Reduce manual workstation administration
- Improve operational consistency
- Support organizational growth
- Prepare the environment for future security hardening

---

# Enterprise Relevance

Group Policy serves as Microsoft's primary configuration management technology for Active Directory environments.

Nearly every enterprise that operates Windows domain infrastructure relies on Group Policy to standardize configuration across users and computers.

Common administrative uses include:

- Password policies
- Account lockout policies
- Windows Defender configuration
- Windows Firewall management
- Software deployment
- Administrative Templates
- Desktop restrictions
- Security baselines
- Windows Update configuration
- Drive mappings
- Login scripts

Without centralized configuration management, administrators would be forced to configure every workstation manually, resulting in inconsistent security settings, increased administrative effort, and greater operational risk.

---

# Technologies Used

- Windows Server 2025
- Active Directory Domain Services (AD DS)
- Group Policy
- Group Policy Management
- PowerShell
- VirtualBox

---

# Related Microsoft Technologies

- SYSVOL
- Active Directory
- Group Policy Management Console (GPMC)
- Organizational Units (OUs)
- Group Policy Objects (GPOs)
- Administrative Templates
- Windows Registry
- Windows Client Configuration

---

# Objectives

By the end of this module, I will have:

- Created multiple Group Policy Objects.
- Linked Group Policies to Organizational Units.
- Verified Group Policy links.
- Established centralized configuration management.
- Documented enterprise deployment procedures.
- Validated policy deployment.
- Prepared the environment for future policy management.

---

# Learning Outcomes

Upon completing this module, I can confidently:

- Create Group Policy Objects.
- Link Group Policies to Organizational Units.
- Verify policy deployment.
- Explain Group Policy processing.
- Document Group Policy implementations.
- Apply Microsoft Group Policy best practices.
- Build scalable configuration management solutions.

---

# Implementation Summary

During this module I successfully:

- Created multiple enterprise Group Policy Objects.
- Linked policies to Organizational Units.
- Verified Group Policy deployment.
- Validated Group Policy links.
- Established centralized configuration management.
- Built reusable administrative policies.
- Documented deployment procedures.
- Prepared the environment for future policy expansion.

---

# Step-by-Step Workflow

---

# Step 1 – Create the HR Security Policy

## Objective

Create a dedicated Group Policy Object for Human Resources.

---

## Why This Is Important

One of Microsoft's primary recommendations is to organize Group Policy Objects by function rather than placing every setting into a single policy.

Creating dedicated Group Policy Objects improves:

- Organization
- Troubleshooting
- Delegation
- Documentation
- Scalability
- Change Management

Separating policies also reduces the risk that unrelated configuration changes will affect multiple departments.

---

## Command

```powershell
New-GPO -Name "HR Security Policy"
```

---

## What This Command Does

This command creates a new, unlinked Group Policy Object named **HR Security Policy** within Active Directory.

The policy is stored inside Active Directory and replicated through SYSVOL for future deployment.

---

## Artifact Created

```
Group Policy Object

HR Security Policy
```

---

## Evidence

- Evidence/01-create-hr-security-policy.png

---

## What If This Step Were Skipped?

Without creating a dedicated policy, administrators would be forced to reuse existing Group Policy Objects, increasing complexity and making future administration more difficult.

---

> 💡 **Administrator Tip**
>
> Create separate Group Policy Objects for different administrative purposes. Smaller, focused policies are significantly easier to maintain than one large "catch-all" policy.

---

> 🔒 **Security Best Practice**
>
> Avoid storing unrelated security settings inside a single Group Policy Object. Modular policies simplify auditing and reduce administrative risk.

---

> 🏢 **Enterprise Insight**
>
> Large organizations frequently manage hundreds or thousands of Group Policy Objects. Consistent naming conventions and modular design are essential for long-term scalability.

---

## Enterprise Relevance

Creating dedicated policies establishes a scalable administrative structure that supports future growth while simplifying troubleshooting and policy delegation.

---

## Skills Demonstrated

- Active Directory Administration
- Group Policy Administration
- Configuration Management
- PowerShell
- Enterprise Design

---

# Step 2 – Create the Managed Devices Security Policy

## Objective

Create a dedicated Group Policy Object for managed Windows devices.

---

## Why This Is Important

Separating workstation configuration from user-specific policies improves administrative flexibility.

Organizations commonly deploy computer configuration policies independently from departmental user policies.

This allows administrators to update workstation security without affecting user-specific configurations.

---

## Command

```powershell
New-GPO -Name "Managed Devices Security Policy"
```

---

## What This Command Does

Creates a second Group Policy Object dedicated to computer configuration and managed device security.

---

## Artifact Created

```
Group Policy Object

Managed Devices Security Policy
```

---

## Evidence

- Evidence/02-create-managed-devices-policy.png

---

## What If This Step Were Skipped?

Combining workstation settings with departmental user policies increases administrative complexity and reduces policy flexibility.

---

> 💡 **Administrator Tip**
>
> Separate User Configuration policies from Computer Configuration policies whenever practical. This improves policy organization and simplifies troubleshooting.

---

> 🧠 **Why This Matters**
>
> As organizations grow, separating policy responsibilities makes administration significantly easier and reduces unintended configuration changes.

---

## Enterprise Relevance

Dedicated workstation policies improve scalability while supporting standardized endpoint management.

---

## Skills Demonstrated

- Windows Administration
- Configuration Management
- Group Policy
- PowerShell

---

# Step 3 – Link the HR Security Policy to the Human Resources Organizational Unit

## Objective

Deploy the HR Security Policy by linking it to the Human Resources Organizational Unit (OU).

---

## Why This Is Important

Creating a Group Policy Object alone does not apply it to any users or computers.

A Group Policy Object must be linked to an Active Directory container before Windows clients can evaluate and process the policy.

Linking the policy to the Human Resources Organizational Unit ensures that all future users placed within the HR OU inherit the organization's HR-specific security configuration.

This approach supports centralized administration while eliminating the need to configure individual user accounts.

---

## Command

```powershell
New-GPLink `
    -Name "HR Security Policy" `
    -Target "OU=Human Resources,DC=corp,DC=local"
```

---

## What This Command Does

This command:

- Locates the **HR Security Policy**
- Creates a Group Policy Link
- Associates the policy with the Human Resources Organizational Unit
- Makes the policy available for Group Policy processing by objects within that OU

The policy itself remains stored in Active Directory while the Organizational Unit now references it through a Group Policy Link.

---

## Artifact Created

```
Group Policy Link

HR Security Policy

↓

Human Resources OU
```

---

## Evidence

- Evidence/03-link-hr-policy.png

---

## What If This Step Were Skipped?

Without linking the Group Policy Object, Active Directory has no way to determine where the policy should be applied.

The policy would exist but would never be processed by any users or computers.

---

> 💡 **Administrator Tip**
>
> Creating a Group Policy Object and linking a Group Policy Object are two completely separate administrative tasks.
>
> Many new administrators create policies but forget to deploy them.

---

> 🔒 **Security Best Practice**
>
> Link Group Policies to Organizational Units rather than directly managing local computer settings. Centralized administration improves consistency and reduces configuration drift.

---

> 🏢 **Enterprise Insight**
>
> Organizations commonly structure Organizational Units around departments, geographic locations, or business functions. Linking policies to Organizational Units allows configuration changes to automatically follow users as they move throughout the organization.

---

> 🧠 **Why This Matters**
>
> Organizational Units determine **where** policies are available.
>
> Security Filtering determines **who** is authorized to receive them.
>
> Understanding this distinction is fundamental to mastering Active Directory.

---

## Enterprise Relevance

Linking Group Policies to Organizational Units enables centralized configuration management while supporting organizational scalability and simplified administration.

---

## Skills Demonstrated

- Active Directory Administration
- Group Policy Administration
- Organizational Units
- Configuration Management
- PowerShell

---

# Step 4 – Link the Managed Devices Security Policy

## Objective

Deploy the Managed Devices Security Policy to the Managed Devices Organizational Unit.

---

## Why This Is Important

Organizations typically manage workstation configuration separately from user configuration.

Linking a dedicated policy to the Managed Devices Organizational Unit allows administrators to standardize computer security without affecting user-specific policies.

This separation supports modular policy design and simplifies future administration.

---

## Command

```powershell
New-GPLink `
    -Name "Managed Devices Security Policy" `
    -Target "OU=Managed Devices,DC=corp,DC=local"
```

---

## What This Command Does

This command creates a Group Policy Link between the Managed Devices Security Policy and the Managed Devices Organizational Unit.

As additional computers are joined to this Organizational Unit, they automatically become eligible to process the policy.

---

## Artifact Created

```
Group Policy Link

Managed Devices Security Policy

↓

Managed Devices OU
```

---

## Evidence

- Evidence/04-link-managed-devices-policy.png

---

## What If This Step Were Skipped?

Managed workstations would not receive centralized configuration, forcing administrators to configure devices manually or through other management platforms.

---

> 💡 **Administrator Tip**
>
> Design Group Policies around administrative responsibilities rather than individual departments whenever practical. This allows policies to be reused across multiple Organizational Units.

---

> 🏢 **Enterprise Insight**
>
> Large organizations commonly separate User Configuration policies from Computer Configuration policies. This modular design improves troubleshooting and reduces unintended policy interactions.

---

> 🔒 **Security Best Practice**
>
> Keep workstation hardening policies separate from user preference policies. This simplifies auditing and change management.

---

## Enterprise Relevance

Separating user and computer policies improves scalability while supporting standardized endpoint administration.

---

## Skills Demonstrated

- Windows Administration
- Group Policy Administration
- Configuration Management
- Organizational Design
- PowerShell

---

# Step 5 – Verify Group Policy Links

## Objective

Validate that both Group Policy Objects are correctly linked to their intended Organizational Units.

---

## Why This Is Important

Creating and linking policies does not guarantee they were deployed correctly.

Verification confirms:

- The correct Group Policy was linked.
- The correct Organizational Unit received the policy.
- The deployment process completed successfully.
- Future users and computers will process the intended configuration.

Verification is a standard operational step following every administrative change.

---

## Command

```powershell
Get-GPInheritance `
    -Target "OU=Human Resources,DC=corp,DC=local"

Get-GPInheritance `
    -Target "OU=Managed Devices,DC=corp,DC=local"
```

---

## What This Command Does

This command retrieves the Group Policy inheritance information for each Organizational Unit.

The output confirms:

- Linked Group Policies
- Link order
- Enforcement status
- Inheritance status

Administrators use this information to validate Group Policy deployment and troubleshoot policy application.

---

## Artifacts Verified

```
Human Resources OU

↓

HR Security Policy

Managed Devices OU

↓

Managed Devices Security Policy
```

---

## Evidence

- Evidence/05-verify-gpo-links.png

---

## What If This Step Were Skipped?

Incorrectly linked policies may go unnoticed until users begin reporting configuration problems.

Verification immediately confirms that deployment completed successfully and reduces troubleshooting time.

---

> 💡 **Administrator Tip**
>
> Verification should be treated as part of the implementation process—not as an optional follow-up task.

---

> 🧠 **Why This Matters**
>
> Group Policy processing begins with Organizational Unit inheritance.
>
> If the link is incorrect, no amount of troubleshooting inside the policy itself will resolve the issue because Windows never evaluates the policy.

---

> 🏢 **Enterprise Insight**
>
> One of the first troubleshooting steps performed by experienced Windows administrators is verifying Group Policy inheritance before examining individual policy settings.

---

> 📋 **Governance Note**
>
> Verification provides documented evidence that administrative changes were successfully implemented, supporting audit requirements and formal change management processes.

---

## Enterprise Relevance

Verifying Group Policy deployment improves operational reliability while reducing configuration errors and supporting enterprise change management.

---

## Skills Demonstrated

- Active Directory Administration
- Group Policy Administration
- Operational Verification
- Change Management
- PowerShell

---

# Microsoft Best Practices

Microsoft recommends the following practices when designing and deploying Group Policy:

- Avoid modifying the **Default Domain Policy** except for domain-wide settings such as password and account lockout policies.
- Avoid modifying the **Default Domain Controllers Policy** except for settings that specifically apply to domain controllers.
- Create separate Group Policy Objects for different administrative functions.
- Link policies to Organizational Units instead of individual users or computers.
- Use descriptive naming conventions for Group Policy Objects.
- Verify Group Policy deployment after every configuration change.
- Test new policies before deploying them to production.
- Document administrative changes and maintain rollback procedures.
- Keep policies modular to simplify troubleshooting and change management.

Following these recommendations creates an environment that is easier to administer, troubleshoot, audit, and expand.

---

# Common Administrative Mistakes

Administrators new to Active Directory often make the following mistakes:

- Placing every setting into a single Group Policy Object.
- Editing the Default Domain Policy unnecessarily.
- Linking policies to incorrect Organizational Units.
- Forgetting to verify Group Policy links.
- Applying user settings inside computer policies.
- Applying computer settings inside user policies.
- Making configuration changes without documentation.
- Skipping validation after deployment.

Avoiding these mistakes improves operational reliability and reduces future troubleshooting.

---

# Questions Answered During This Module

## Why use Group Policy instead of configuring computers individually?

Managing computers individually does not scale.

Group Policy allows administrators to centrally define configurations once and automatically deploy them across the enterprise, reducing administrative effort while improving consistency.

---

## Why create multiple Group Policy Objects?

Separating policies by function improves organization, troubleshooting, delegation, auditing, and change management.

Smaller policies are easier to maintain and present less operational risk than one large policy containing unrelated settings.

---

## Why link policies to Organizational Units?

Organizational Units provide logical administrative boundaries.

Linking policies to Organizational Units allows Windows to automatically determine which users and computers should evaluate a policy during Group Policy processing.

---

## Why verify Group Policy links?

A Group Policy Object that is not linked cannot be processed.

Verification confirms that policies are deployed correctly before administrators begin troubleshooting policy settings.

---

## Why avoid modifying the Default Domain Policy?

Microsoft reserves the Default Domain Policy primarily for domain-wide security settings.

Creating dedicated Group Policy Objects reduces administrative complexity while preserving Microsoft's supported design.

---

## Operational Use Cases

Core Group Policy administration is commonly used for:

- Enterprise workstation management
- Security baseline deployment
- Password policy management
- Administrative template deployment
- Windows Update configuration
- Software deployment
- Desktop standardization
- Login and startup scripts
- Regulatory compliance
- Enterprise security hardening
- Configuration management

---

# Security Best Practices

- Follow Microsoft's recommended Group Policy design.
- Keep policies modular and focused.
- Verify deployments after every change.
- Document administrative changes.
- Avoid modifying default policies unnecessarily.
- Use Organizational Units to organize administration.
- Design policies for future growth.
- Test policies before production deployment.

---

# Troubleshooting

## Issue

The Group Policy Object exists but is not applying.

### Cause

The policy was created but never linked to an Organizational Unit.

### Resolution

Create the appropriate Group Policy Link and verify inheritance.

---

## Issue

Policy linked to the wrong Organizational Unit.

### Cause

Incorrect deployment target.

### Resolution

Review Organizational Unit structure and validate Group Policy links using PowerShell.

---

## Issue

Unexpected policy behavior.

### Cause

Multiple Group Policy Objects may be processing in an unexpected order.

### Resolution

Review Group Policy inheritance, precedence, and link order before modifying policy settings.

---

# Skills Practiced

Throughout this module I gained practical experience with:

- Windows Server 2025 Administration
- Active Directory Administration
- Group Policy Administration
- Organizational Unit Management
- Configuration Management
- PowerShell Administration
- Policy Deployment
- Operational Verification
- Change Management
- Enterprise Documentation

---

# Resume Relevance

This module demonstrates hands-on experience with:

- Active Directory Domain Services (AD DS)
- Group Policy Administration
- Windows Server Administration
- PowerShell
- Configuration Management
- Enterprise Policy Deployment
- Organizational Unit Design
- Operational Verification
- Enterprise Documentation
- Change Management

These responsibilities are commonly found in Windows Administrator, Systems Administrator, Infrastructure Engineer, Endpoint Administrator, IAM Administrator, SOC Analyst, and GRC Analyst roles.

---

# Interview Talking Points

## Interview Question

**Describe a time you've implemented centralized configuration management.**

### Example Response

> I implemented centralized configuration management in a Windows Server Active Directory lab by creating dedicated Group Policy Objects, linking them to Organizational Units, verifying policy deployment, and documenting the implementation. Rather than configuring systems individually, I established reusable administrative policies that can automatically apply standardized configurations across the environment.

---

## Interview Question

**Why is Group Policy important in an enterprise environment?**

### Example Response

> Group Policy allows administrators to centrally manage configuration across thousands of systems. It improves consistency, reduces manual administration, strengthens security, and supports scalable management by allowing administrators to define policies once and automatically deploy them throughout the Active Directory environment.

---

## Interview Question

**Why should Group Policies remain modular?**

### Example Response

> Modular Group Policy design simplifies troubleshooting, delegation, auditing, and change management. Rather than placing unrelated settings into one large policy, I created separate Group Policy Objects for different administrative purposes, following Microsoft's recommended design practices.

---

## Interview Question

**How do Organizational Units and Group Policy work together?**

### Example Response

> Organizational Units define the administrative boundary where Group Policies are deployed. Group Policy Objects contain the configuration, while Organizational Units determine where Windows evaluates those policies during Group Policy processing. Later, Security Filtering can be used to further control which users or computers are authorized to apply the policy.

---

# Evidence

The following evidence was generated throughout this module.

## Group Policy Creation

- Evidence/01-create-hr-security-policy.png
- Evidence/02-create-managed-devices-policy.png

## Group Policy Deployment

- Evidence/03-link-hr-policy.png
- Evidence/04-link-managed-devices-policy.png

## Group Policy Verification

- Evidence/05-verify-gpo-links.png

---

# Generated Artifacts

The following Active Directory objects were created during this module.

```
Group Policy Objects

├── HR Security Policy
└── Managed Devices Security Policy

↓

Linked To

├── Human Resources OU
└── Managed Devices OU
```

These objects form the configuration management foundation of the Cyber Defense Journey enterprise and will be expanded throughout future modules.

---

# Lessons Learned

This module reinforced that Group Policy is far more than a collection of Windows settings—it is the foundation of centralized configuration management within an Active Directory environment.

One of the most valuable lessons was understanding the relationship between Group Policy Objects and Organizational Units. Creating a policy is only the first step; linking it to the correct Organizational Unit is what makes it operational. This distinction highlighted the importance of planning Group Policy architecture rather than simply configuring settings.

The exercise also emphasized Microsoft's recommendation to keep Group Policies modular. Separating policies by function improves troubleshooting, simplifies change management, and makes enterprise administration more scalable. Instead of viewing Group Policy as a single administrative tool, I now understand it as a structured framework for managing Windows environments efficiently and consistently.

---

# Key Takeaways

- Group Policy is Microsoft's primary enterprise configuration management technology.
- Creating a policy and deploying a policy are separate administrative tasks.
- Organizational Units define where policies are processed.
- Modular policy design improves scalability and simplifies administration.
- Verification is an essential part of every deployment.
- Following Microsoft's best practices leads to more maintainable environments.
- Well-designed Group Policy architecture becomes the foundation for future security, compliance, and endpoint management.

---

# From the Administrator's Desk

This module gave me a much deeper appreciation for how enterprise Windows environments are managed. Before completing it, I viewed Group Policy as a tool for changing Windows settings. I now recognize it as the primary mechanism for delivering standardized configuration across an entire organization.

What stood out most was the importance of thoughtful design. Creating dedicated Group Policy Objects, linking them to the correct Organizational Units, and validating deployment showed that successful administration depends as much on planning and organization as it does on technical execution.

I also gained a greater understanding of Microsoft's design philosophy. Group Policy is intentionally modular, allowing organizations to build reusable policies that can evolve as business requirements change. That flexibility is one of the reasons Active Directory has remained a cornerstone of enterprise infrastructure for decades.

As the Cyber Defense Journey enterprise continues to mature, the configuration management foundation established in this module will support future work involving Security Filtering, Backup & Recovery, Reporting, Windows Defender, LAPS, WSUS, endpoint hardening, and centralized security management.

---

# Enterprise Maturity

## Before This Module

- Active Directory deployed
- Organizational Units created
- Users and groups provisioned

## Added During This Module

- Centralized configuration management
- Enterprise Group Policy architecture
- Modular policy design
- Organizational Unit policy deployment
- Policy verification workflow
- Configuration management documentation

## Enterprise State After Completion

The Cyber Defense Journey enterprise now includes a scalable Group Policy infrastructure capable of centrally managing Windows configuration across departments and managed devices. This establishes the operational foundation for future security baselines, identity governance, disaster recovery, compliance reporting, endpoint management, and enterprise-scale Windows administration.