<#
.SYNOPSIS
Backs up and validates Active Directory Group Policy Objects.

.DESCRIPTION
Creates a centralized Group Policy backup repository, backs up all GPOs
in the Cyber Defense Journey Active Directory environment, verifies backup
artifacts, inspects backup metadata, restores a selected GPO, and validates
successful recovery.

.NOTES
Author: Zac Belchar
Project: Cyber Defense Journey
Module: Week 1 - Day 3 - GPO Backup and Recovery
Script: Backup-GPOs.ps1
Version: 1.0
#>

#region Variables

$BackupPath = "C:\GPO-Backups"
$RestoreGPOName = "HR Security Policy"

#endregion

#region Validation

Write-Host ""
Write-Host "====================================="
Write-Host " Group Policy Backup and Recovery"
Write-Host "====================================="
Write-Host ""

Write-Host "Checking backup directory..."

if (!(Test-Path $BackupPath))
{
    Write-Host "Creating backup directory..."
    New-Item -ItemType Directory -Path $BackupPath | Out-Null
}
else
{
    Write-Host "Backup directory already exists."
}

#endregion

#region Backup

Write-Host ""
Write-Host "Backing up all Group Policy Objects..."

Backup-GPO -All -Path $BackupPath

#endregion

#region Backup Verification

Write-Host ""
Write-Host "====================================="
Write-Host " Backup Repository Contents"
Write-Host "====================================="

Get-ChildItem $BackupPath

Write-Host ""
Write-Host "====================================="
Write-Host " Backup XML Manifest Files"
Write-Host "====================================="

Get-ChildItem $BackupPath -Recurse -Filter "Backup.xml"

#endregion

#region Restore

Write-Host ""
Write-Host "Restoring Group Policy Object:"
Write-Host "  $RestoreGPOName"

Restore-GPO -Name $RestoreGPOName -Path $BackupPath

#endregion

#region Recovery Verification

Write-Host ""
Write-Host "====================================="
Write-Host " Post-Restore Verification"
Write-Host "====================================="

Get-GPO -Name $RestoreGPOName

#endregion

#region Completion

Write-Host ""
Write-Host "====================================="
Write-Host " GPO Backup and Recovery Complete"
Write-Host "====================================="
Write-Host ""
Write-Host "Backups saved to:"
Write-Host "  $BackupPath"
Write-Host ""

#endregion