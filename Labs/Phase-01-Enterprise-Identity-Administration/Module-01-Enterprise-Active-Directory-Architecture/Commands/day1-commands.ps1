# Day 1 Active Directory Lab Commands

# Verify network adapter
Get-NetAdapter

# Verify network configuration
ipconfig

# Verify current user
whoami

# Verify hostname
hostname

# Rename server
Rename-Computer -NewName "DC01" -Restart

# Install AD DS and DNS
Install-WindowsFeature AD-Domain-Services,DNS -IncludeManagementTools

# Verify installation
Get-WindowsFeature AD-Domain-Services,DNS

# Promote server to Domain Controller
Install-ADDSForest -DomainName "corp.local" -DomainNetbiosName "CORP" -InstallDNS

# Verify domain
Get-ADDomain

# Create Organizational Units
New-ADOrganizationalUnit -Name "Workstations" -Path "DC=corp,DC=local"
New-ADOrganizationalUnit -Name "Servers" -Path "DC=corp,DC=local"
New-ADOrganizationalUnit -Name "Sales" -Path "DC=corp,DC=local"
New-ADOrganizationalUnit -Name "Finance" -Path "DC=corp,DC=local"
New-ADOrganizationalUnit -Name "HR" -Path "DC=corp,DC=local"
New-ADOrganizationalUnit -Name "IT" -Path "DC=corp,DC=local"

# Verify OUs
Get-ADOrganizationalUnit -Filter *

# Create Security Groups
New-ADGroup -Name "IT_Admins" -GroupScope Global -GroupCategory Security -Path "OU=IT,DC=corp,DC=local"

New-ADGroup -Name "HR_Users" -GroupScope Global -GroupCategory Security -Path "OU=HR,DC=corp,DC=local"

New-ADGroup -Name "Finance_Users" -GroupScope Global -GroupCategory Security -Path "OU=Finance,DC=corp,DC=local"

New-ADGroup -Name "Sales_Users" -GroupScope Global -GroupCategory Security -Path "OU=Sales,DC=corp,DC=local"

# Verify Groups
Get-ADGroup -Filter *

# Move User Example
Get-ADUser mjones | Move-ADObject -TargetPath "OU=Finance,DC=corp,DC=local"

# Verify User Location
Get-ADUser mjones -Properties DistinguishedName