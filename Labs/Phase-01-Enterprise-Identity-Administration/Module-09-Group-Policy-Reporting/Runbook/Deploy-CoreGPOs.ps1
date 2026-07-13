<#
.SYNOPSIS
Creates, links, and validates core Group Policy Objects.

.DESCRIPTION
Creates foundational Group Policy Objects for the Cyber Defense Journey
Active Directory environment, links them to the appropriate Organizational
Units, and verifies Group Policy inheritance.

.NOTES
Author: Zac Belchar
Project: Cyber Defense Journey
Module: Week 1 - Day 3 - Core GPO Administration
Script: Deploy-CoreGPOs.ps1
Version: 1.0
#>

#region Variables

$HRGPO = "HR Security Policy"
$ManagedDevicesGPO = "Managed Devices Security Policy"

$HROU = "OU=HR,DC=corp,DC=local"
$ManagedDevicesOU = "OU=Managed Devices,DC=corp,DC=local"

#endregion

#region Validation

Write-Host ""
Write-Host "====================================="
Write-Host " Core GPO Administration"
Write-Host "====================================="
Write-Host ""

Write-Host "Validating target Organizational Units..."

Get-ADOrganizationalUnit -Filter 'Name -eq "HR"'
Get-ADOrganizationalUnit -Filter 'Name -eq "Managed Devices"'

#endregion

#region GPO Creation

Write-Host ""
Write-Host "Creating Group Policy Objects..."

if (!(Get-GPO -Name $HRGPO -ErrorAction SilentlyContinue))
{
    New-GPO -Name $HRGPO
}
else
{
    Write-Host "$HRGPO already exists."
}

if (!(Get-GPO -Name $ManagedDevicesGPO -ErrorAction SilentlyContinue))
{
    New-GPO -Name $ManagedDevicesGPO
}
else
{
    Write-Host "$ManagedDevicesGPO already exists."
}

#endregion

#region GPO Linking

Write-Host ""
Write-Host "Linking Group Policy Objects..."

New-GPLink -Name $HRGPO -Target $HROU -ErrorAction SilentlyContinue
New-GPLink -Name $ManagedDevicesGPO -Target $ManagedDevicesOU -ErrorAction SilentlyContinue

#endregion

#region Verification

Write-Host ""
Write-Host "====================================="
Write-Host " GPO Link Verification"
Write-Host "====================================="

Write-Host ""
Write-Host "HR OU Inheritance:"
Get-GPInheritance -Target $HROU

Write-Host ""
Write-Host "Managed Devices OU Inheritance:"
Get-GPInheritance -Target $ManagedDevicesOU

Write-Host ""
Write-Host "Domain GPO Inventory:"
Get-GPO -All | Select-Object DisplayName,GpoStatus

#endregion

#region Completion

Write-Host ""
Write-Host "====================================="
Write-Host " Core GPO Administration Complete"
Write-Host "====================================="
Write-Host ""

#endregion