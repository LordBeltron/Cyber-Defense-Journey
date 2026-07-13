# ============================================================
# Day 3 - Group Policy Administration
# ============================================================

# Review current domain password policy
Get-ADDefaultDomainPasswordPolicy

# Configure account lockout threshold
Set-ADDefaultDomainPasswordPolicy -Identity corp.local -LockoutThreshold 5

# Verify changes
Get-ADDefaultDomainPasswordPolicy

# Increase minimum password length
Set-ADDefaultDomainPasswordPolicy -Identity corp.local -MinPasswordLength 12

# Verify changes
Get-ADDefaultDomainPasswordPolicy

# Increase maximum password age
Set-ADDefaultDomainPasswordPolicy -Identity corp.local -MaxPasswordAge 90.00:00:00

# Verify changes
Get-ADDefaultDomainPasswordPolicy

# Create Managed Devices GPO
New-GPO -Name "Managed Devices Security Policy"

# Verify GPO creation
Get-GPO -Name "Managed Devices Security Policy"

# Verify Managed Devices OU
Get-ADOrganizationalUnit -Filter 'Name -eq "Managed Devices"' | Select-Object Name,DistinguishedName

# List all GPOs
Get-GPO -All | Select-Object DisplayName

# Store Managed Devices OU DN
$TargetOU = (Get-ADOrganizationalUnit -Filter 'Name -eq "Managed Devices"').DistinguishedName

# Link GPO
New-GPLink -Name "Managed Devices Security Policy" -Target $TargetOU

# Verify inheritance
Get-GPInheritance -Target "OU=Managed Devices,DC=corp,DC=local"

# Domain GPO Audit
Get-GPO -All | Select-Object DisplayName,GpoStatus

# Create HR Security Policy
New-GPO -Name "HR Security Policy"

# Store HR OU DN
$HROU = (Get-ADOrganizationalUnit -Filter 'Name -eq "HR"').DistinguishedName

# Link HR GPO
New-GPLink -Name "HR Security Policy" -Target $HROU

# Verify HR inheritance
Get-GPInheritance -Target "OU=HR,DC=corp,DC=local"

# Final domain audit
Get-GPO -All | Select-Object DisplayName,CreationTime,GpoStatus