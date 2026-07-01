# Day 3 Notes - Group Policy Administration

## Objective

Learn how Active Directory Group Policies are created, linked, inherited, and audited within a domain environment.

---

# Password Policy Administration

Reviewed the Default Domain Password Policy.

Modified:

- Minimum Password Length
- Account Lockout Threshold
- Password Expiration

Key Takeaway:

Password policies provide centralized control over authentication security across the domain.

---

# Account Lockout Protection

Configured:

- 5 failed login attempts

Purpose:

- Reduce brute-force attacks
- Protect user accounts from password guessing

Key Takeaway:

Account lockout policies help defend against unauthorized access attempts.

---

# Password Hardening

Updated:

- Password Length from 7 to 12 characters

Key Takeaway:

Longer passwords significantly increase resistance against password cracking.

---

# Group Policy Objects (GPOs)

Created:

- Managed Devices Security Policy
- HR Security Policy

Purpose:

- Apply centralized security settings
- Manage policy by department and device category

Key Takeaway:

GPOs allow administrators to manage large environments from a central location.

---

# GPO Linking

Linked:

- Managed Devices Security Policy → Managed Devices OU
- HR Security Policy → HR OU

Key Takeaway:

GPOs do not become active until linked to a site, domain, or OU.

---

# GPO Inheritance

Verified:

- Managed Devices OU inherited domain policies
- HR OU inherited domain policies

Key Takeaway:

Inherited policies simplify administration and ensure consistent security standards.

---

# GPO Auditing

Performed:

- Domain GPO Inventory
- Policy Status Verification
- Inheritance Verification

Key Takeaway:

Regular policy audits help maintain security and compliance.

---

# Skills Practiced

- Group Policy Management
- Password Policy Administration
- Security Hardening
- Organizational Unit Administration
- GPO Linking
- GPO Inheritance
- Policy Auditing
- PowerShell Administration

---

# End of Day Reflection

Day 3 focused on centralized policy management within Active Directory. I learned how enterprise administrators configure password requirements, create Group Policy Objects, link policies to Organizational Units, verify inheritance, and audit domain-wide policy deployments.