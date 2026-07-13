# Day 2 Notes - Identity Administration

## Objective

Learn core Identity and Access Management (IAM) tasks within Active Directory using PowerShell.

---

# Organizational Unit Administration

Created a dedicated OU for disabled user accounts.

New OU:

- Disabled Users

Purpose:

- Separate inactive accounts from active users
- Improve organization
- Simplify account audits
- Support user lifecycle management

---

# User Lifecycle Management

Worked with existing user accounts:

- John Doe
- Alice Smith
- Mike Jones

Performed the following actions:

- Disabled Alice Smith's account
- Verified account status
- Moved Alice Smith from the HR OU to the Disabled Users OU
- Re-enabled Alice Smith
- Moved Alice Smith back to the HR OU

Key takeaway:

User accounts can be managed throughout their lifecycle without deleting them from Active Directory.

---

# Role-Based Access Control (RBAC)

Verified security group assignments.

Groups:

- IT_Admins
- HR_Users
- Finance_Users
- Sales_Users

Memberships verified:

| User | Group |
|--------|--------|
| John Doe | IT_Admins |
| Alice Smith | HR_Users |
| Mike Jones | Finance_Users |

Key takeaway:

Permissions should be assigned to groups rather than individual users.

Users inherit access through group membership.

---

# Computer Object Administration

Created computer objects:

- WS01
- WS02
- WS03

Verified:

- Computer creation
- Enabled status
- Distinguished Names

Key takeaway:

Computers are identities in Active Directory and can be managed similarly to users.

---

# Organizational Unit Management

Created a new OU:

- Managed Devices

Moved workstation objects into the OU.

Purpose:

- Organize managed assets
- Prepare for future Group Policy deployment
- Improve administrative control

---

# Active Directory Auditing

Performed targeted searches using SearchBase.

Audited:

- HR OU
- Finance OU
- Managed Devices OU

Key takeaway:

Administrators can scope searches to specific OUs rather than querying the entire directory.

---

# Disabled Account Auditing

Used Search-ADAccount to identify disabled accounts.

Results:

- Guest
- krbtgt

Key takeaway:

Regular audits help identify inactive, disabled, or unnecessary accounts.

---

# New User Onboarding

Created:

- Robert Brown
- Username: rbrown

Tasks completed:

- Created user account
- Assigned Sales OU
- Added Sales_Users group membership
- Verified RBAC assignment

Verified membership:

- Domain Users
- Sales_Users

Key takeaway:

New employee onboarding follows a repeatable process:

1. Create account
2. Assign OU
3. Assign security groups
4. Verify access

---

# Skills Practiced

- Active Directory Administration
- Identity Administration
- Access Management
- Role-Based Access Control (RBAC)
- Organizational Unit Management
- User Lifecycle Management
- Computer Object Management
- Active Directory Auditing
- PowerShell Administration

---

# Lessons Learned

- OUs provide administrative organization for Active Directory objects.
- Security groups simplify permission management.
- User accounts can be disabled and reactivated without deletion.
- Computer accounts are managed identities within Active Directory.
- Active Directory auditing is critical for security and compliance.
- RBAC improves scalability and reduces administrative overhead.
- PowerShell provides an efficient method for large-scale Active Directory administration.

---

# End of Day Reflection

Day 2 focused on identity administration and access management. I learned how organizations manage users, groups, computers, and organizational units while implementing role-based access controls and performing common administrative tasks. These skills form the foundation of enterprise identity and access management operations.