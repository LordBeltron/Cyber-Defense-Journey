<#
.SYNOPSIS
Generates enterprise Group Policy reports.

.DESCRIPTION
Creates HTML, XML, and CSV reports for the Cyber Defense Journey
Active Directory environment.

.NOTES
Author: Zac Belchar
Project: Cyber Defense Journey
Module: Week 1 - Day 3 - GPO Reporting
Script: Generate-GPOReports.ps1
Version: 1.0
#>

#region Variables

$ReportPath = "C:\GPO-Reports"

#endregion

#region Validation

Write-Host ""
Write-Host "====================================="
Write-Host " Group Policy Reporting"
Write-Host "====================================="
Write-Host ""

Write-Host "Checking reporting directory..."

if (!(Test-Path $ReportPath))
{
    Write-Host "Creating reporting directory..."
    New-Item -ItemType Directory -Path $ReportPath | Out-Null
}
else
{
    Write-Host "Reporting directory already exists."
}

#endregion

#region Report Generation

Write-Host ""
Write-Host "Generating HR Security Policy HTML Report..."

Get-GPOReport `
    -Name "HR Security Policy" `
    -ReportType Html `
    -Path "$ReportPath\HR-Security-Policy.html"

Write-Host ""
Write-Host "Generating HR Security Policy XML Report..."

Get-GPOReport `
    -Name "HR Security Policy" `
    -ReportType Xml `
    -Path "$ReportPath\HR-Security-Policy.xml"

Write-Host ""
Write-Host "Generating Managed Devices Security Policy HTML Report..."

Get-GPOReport `
    -Name "Managed Devices Security Policy" `
    -ReportType Html `
    -Path "$ReportPath\Managed-Devices-Security-Policy.html"

Write-Host ""
Write-Host "Generating Managed Devices Security Policy XML Report..."

Get-GPOReport `
    -Name "Managed Devices Security Policy" `
    -ReportType Xml `
    -Path "$ReportPath\Managed-Devices-Security-Policy.xml"

Write-Host ""
Write-Host "Generating Domain GPO Inventory..."

Get-GPO -All |
    Select-Object DisplayName,CreationTime,ModificationTime,GpoStatus,Owner |
    Sort-Object DisplayName |
    Export-Csv "$ReportPath\Domain-GPO-Inventory.csv" -NoTypeInformation

#endregion

#region Verification

Write-Host ""
Write-Host "====================================="
Write-Host " Generated Reports"
Write-Host "====================================="

Get-ChildItem $ReportPath

#endregion

#region Completion

Write-Host ""
Write-Host "====================================="
Write-Host " Group Policy Reporting Complete"
Write-Host "====================================="
Write-Host ""
Write-Host "Reports saved to:"
Write-Host "  $ReportPath"
Write-Host ""

#endregion