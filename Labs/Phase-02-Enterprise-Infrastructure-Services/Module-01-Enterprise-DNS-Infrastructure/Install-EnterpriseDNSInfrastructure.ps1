<#
.SYNOPSIS
Assesses, configures, and validates enterprise DNS infrastructure.

.DESCRIPTION
This script performs the full Module 01 Enterprise DNS Infrastructure workflow
for the Cyber Defense Journey lab environment.

It validates the DNS Server role and service, inventories DNS zones and resource
records, validates forward DNS resolution, creates an Active Directory-integrated
reverse lookup zone, verifies the zone, and validates reverse DNS resolution.

.NOTES
Author: Zac Belchar
Project: Cyber Defense Journey
Phase: Phase 02 - Core Infrastructure Services
Module: Module 01 - Enterprise DNS Infrastructure
Script: Install-EnterpriseDNSInfrastructure.ps1
Version: 1.0
#>

#region Variables

$DomainName = "corp.local"
$DomainControllerFQDN = "dc01.corp.local"
$DomainControllerIP = "10.0.2.15"
$NetworkId = "10.0.2.0/24"
$ReverseZoneName = "2.0.10.in-addr.arpa"

#endregion

#region Start

Write-Host ""
Write-Host "====================================="
Write-Host " Enterprise DNS Infrastructure"
Write-Host "====================================="
Write-Host ""

#endregion

#region Assessment

Write-Host "STEP 1 - Verifying DNS Server role..."
Get-WindowsFeature DNS

Write-Host ""
Write-Host "STEP 2 - Verifying DNS service status..."
Get-Service DNS

Write-Host ""
Write-Host "STEP 3 - Inventorying DNS zones..."
Get-DnsServerZone

Write-Host ""
Write-Host "STEP 4 - Reviewing enterprise resource records..."
Get-DnsServerResourceRecord -ZoneName $DomainName

Write-Host ""
Write-Host "STEP 5 - Validating forward DNS resolution..."
Resolve-DnsName $DomainControllerFQDN

#endregion

#region Implementation

Write-Host ""
Write-Host "STEP 6 - Enterprise network identified:"
Write-Host "  $NetworkId"
Write-Host ""

Write-Host "STEP 7 - Creating reverse lookup zone if needed..."

if (Get-DnsServerZone -Name $ReverseZoneName -ErrorAction SilentlyContinue)
{
    Write-Host "Reverse lookup zone already exists:"
    Write-Host "  $ReverseZoneName"
}
else
{
    Add-DnsServerPrimaryZone `
        -NetworkId $NetworkId `
        -ReplicationScope Domain

    Write-Host "Reverse lookup zone created:"
    Write-Host "  $ReverseZoneName"
}

#endregion

#region Validation

Write-Host ""
Write-Host "STEP 8 - Verifying reverse lookup zone..."
Get-DnsServerZone | Where-Object {$_.ZoneName -eq $ReverseZoneName}

Write-Host ""
Write-Host "STEP 9 - Validating reverse DNS resolution..."
Resolve-DnsName $DomainControllerIP

#endregion

#region Completion

Write-Host ""
Write-Host "====================================="
Write-Host " Enterprise DNS Infrastructure Complete"
Write-Host "====================================="
Write-Host ""
Write-Host "Validated:"
Write-Host "  DNS Server role"
Write-Host "  DNS service"
Write-Host "  DNS zones"
Write-Host "  Enterprise resource records"
Write-Host "  Forward DNS resolution"
Write-Host "  Reverse lookup zone"
Write-Host "  Reverse DNS resolution"
Write-Host ""

#endregion