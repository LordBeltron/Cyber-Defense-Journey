<#
.SYNOPSIS
Configures and validates Group Policy Security Filtering.

.DESCRIPTION
Verifies the HR_Users security group, reviews default GPO permissions,
adds HR_Users with Apply Group Policy permissions, validates the updated
configuration, and documents the Microsoft warning related to removing
Authenticated Users.

.NOTES
Author: Zac Belchar
Project: Cyber Defense Journey
Module: Week 1 - Day 3 - GPO Security Filtering
Script: Configure-GPOSecurityFiltering.ps1
Version: 1.0
#>

#region Variables

$GPOName = "HR Security Policy"
$SecurityGroup = "HR_Users"

#endregion

#region Validation

Write-Host ""
Write-Host "====================================="
Write-Host " GPO Security Filtering"
Write-Host "====================================="
Write-Host ""

Write-Host "Verifying security group:"
Write-Host "  $SecurityGroup"

Get-ADGroup $SecurityGroup

#endregion

#region Baseline Permissions

Write-Host ""
Write-Host "====================================="
Write-Host " Baseline GPO Permissions"
Write-Host "====================================="

Get-GPPermission -Name $GPOName -All

#endregion

#region Security Filtering

Write-Host ""
Write-Host "Adding security group to GPO with Apply permissions..."
Write-Host "GPO:"
Write-Host "  $GPOName"
Write-Host "Security Group:"
Write-Host "  $SecurityGroup"

Set-GPPermission `
    -Name $GPOName `
    -TargetName $SecurityGroup `
    -TargetType Group `
    -PermissionLevel GpoApply

#endregion

#region Verification

Write-Host ""
Write-Host "====================================="
Write-Host " Updated GPO Permissions"
Write-Host "====================================="

Get-GPPermission -Name $GPOName -All

#endregion

#region Documentation Note

Write-Host ""
Write-Host "====================================="
Write-Host " Security Filtering Note"
Write-Host "====================================="
Write-Host ""
Write-Host "Authenticated Users was intentionally preserved."
Write-Host "Microsoft warns that removing Authenticated Users can prevent"
Write-Host "computers from reading Group Policy data during processing."
Write-Host ""
Write-Host "This script demonstrates targeted Security Filtering while"
Write-Host "maintaining reliable Group Policy processing."
Write-Host ""

#endregion

#region Completion

Write-Host ""
Write-Host "====================================="
Write-Host " GPO Security Filtering Complete"
Write-Host "====================================="
Write-Host ""

#endregion