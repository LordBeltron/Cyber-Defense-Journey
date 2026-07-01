# ============================================================
# Day 2 - Identity Administration Lab
# Windows Server 2025 Active Directory
# ============================================================

# ============================================================
# SECTION 1 - Create Disabled Users OU
# ============================================================

# Creates an Organizational Unit used to store disabled accounts.
New-ADOrganizationalUnit -Name "Disabled Users" -Path "DC=corp,DC=local"

# Lists all Organizational Units in the domain.
Get-ADOrganizationalUnit -Filter * | Select-Object Name,DistinguishedName

# ============================================================
# SECTION 2 - User Lifecycle Management
# ============================================================

# Lists all user accounts and displays account status.
Get-ADUser -Filter * | Select-Object Name,SamAccountName,Enabled

# Disables Alice Smith's account.
Disable-ADAccount -Identity asmith

# Verifies Alice Smith is disabled.
Get-ADUser asmith | Select-Object Name,Enabled

# Displays Alice Smith's Distinguished Name.
Get-ADUser asmith -Properties DistinguishedName

# Moves Alice Smith into the Disabled Users OU.
Get-ADUser asmith | Move-ADObject -TargetPath "OU=Disabled Users,DC=corp,DC=local"

# Verifies Alice Smith's new location.
Get-ADUser asmith -Properties DistinguishedName

# Re-enables Alice Smith's account.
Enable-ADAccount -Identity asmith

# Moves Alice Smith back to the HR OU.
Get-ADUser asmith | Move-ADObject -TargetPath "OU=HR,DC=corp,DC=local"

# Verifies account status and location.
Get-ADUser asmith -Properties Enabled,DistinguishedName | Select-Object Name,Enabled,DistinguishedName

# ============================================================
# SECTION 3 - RBAC Verification
# ============================================================

# Displays all groups John Doe belongs to.
Get-ADPrincipalGroupMembership jdoe

# Displays all groups Alice Smith belongs to.
Get-ADPrincipalGroupMembership asmith

# Displays all groups Mike Jones belongs to.
Get-ADPrincipalGroupMembership mjones

# ============================================================
# SECTION 4 - Computer Object Administration
# ============================================================

# Creates workstation computer object WS01.
New-ADComputer -Name "WS01" -Path "OU=Workstations,DC=corp,DC=local"

# Creates workstation computer object WS02.
New-ADComputer -Name "WS02" -Path "OU=Workstations,DC=corp,DC=local"

# Creates workstation computer object WS03.
New-ADComputer -Name "WS03" -Path "OU=Workstations,DC=corp,DC=local"

# Lists all computer objects.
Get-ADComputer -Filter * | Select-Object Name

# Displays WS01 details and Distinguished Name.
Get-ADComputer WS01 -Properties DistinguishedName

# Audits all computer accounts and status.
Get-ADComputer -Filter * | Select-Object Name,Enabled

# ============================================================
# SECTION 5 - Managed Devices OU
# ============================================================

# Creates a Managed Devices Organizational Unit.
New-ADOrganizationalUnit -Name "Managed Devices" -Path "DC=corp,DC=local"

# Lists all Organizational Units.
Get-ADOrganizationalUnit -Filter * | Select-Object Name

# Moves WS01 to the Managed Devices OU.
Get-ADComputer WS01 | Move-ADObject -TargetPath "OU=Managed Devices,DC=corp,DC=local"

# Verifies WS01 location.
Get-ADComputer WS01 -Properties DistinguishedName

# ============================================================
# SECTION 6 - OU Scoped Auditing
# ============================================================

# Searches only within the HR OU.
Get-ADUser -Filter * -SearchBase "OU=HR,DC=corp,DC=local"

# Searches only within the Finance OU.
Get-ADUser -Filter * -SearchBase "OU=Finance,DC=corp,DC=local"

# Searches only within the Managed Devices OU.
Get-ADComputer -Filter * -SearchBase "OU=Managed Devices,DC=corp,DC=local"

# ============================================================
# SECTION 7 - Disabled Account Auditing
# ============================================================

# Displays all disabled user accounts.
Search-ADAccount -AccountDisabled -UsersOnly

# Displays only disabled account names.
Search-ADAccount -AccountDisabled -UsersOnly | Select-Object Name

# ============================================================
# SECTION 8 - New Employee Onboarding
# ============================================================

# Creates a new Sales employee account.
New-ADUser -Name "Robert Brown" -GivenName "Robert" -Surname "Brown" -SamAccountName rbrown -UserPrincipalName rbrown@corp.local -Path "OU=Sales,DC=corp,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd123!" -AsPlainText -Force) -Enabled $true

# Adds Robert Brown to the Sales_Users security group.
Add-ADGroupMember -Identity Sales_Users -Members rbrown

# Verifies Robert Brown's Active Directory location.
Get-ADUser rbrown -Properties DistinguishedName

# Displays Robert Brown's group memberships.
Get-ADPrincipalGroupMembership rbrown

# Displays a simplified list of Robert Brown's groups.
Get-ADPrincipalGroupMembership rbrown | Select-Object Name

# ============================================================
# END OF DAY 2 LAB
# Skills Practiced:
# - User Lifecycle Management
# - Organizational Unit Administration
# - Role-Based Access Control (RBAC)
# - Computer Object Management
# - Active Directory Auditing
# - New Employee Provisioning
# ============================================================