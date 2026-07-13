<#
.SYNOPSIS
    Creates the standardized Cyber Defense Journey Labs directory structure.

.DESCRIPTION
    Creates the official CDJ phase folders and the currently defined Phase 01
    and Phase 02 module folders.

    Every module receives the standard structure required by
    PROJECT_STANDARDS.md:

    - README.md
    - Runbook
    - Lab Notes
    - Evidence

    Existing folders and files are preserved.

.PARAMETER RepositoryPath
    Root path of the Cyber-Defense-Journey repository.

.EXAMPLE
    .\New-CDJLabStructure.ps1

.EXAMPLE
    .\New-CDJLabStructure.ps1 -RepositoryPath "C:\Users\zacbe\Cyber-Defense-Journey"

.NOTES
    Project: Cyber Defense Journey
    Purpose: Repository structure automation
#>

[CmdletBinding()]
param(
    [Parameter()]
    [string]$RepositoryPath = "C:\Cyber-Defense-Journey"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# ---------------------------------------------------------------------------
# Variables
# ---------------------------------------------------------------------------

$LabsPath = Join-Path $RepositoryPath "Labs"

$Phases = [ordered]@{
    "Phase-01-Enterprise-Identity-Administration" = @(
        "Module-01-Enterprise-Active-Directory-Architecture"
        "Module-02-Forests-Trees-Domains-and-Trusts"
        "Module-03-Organizational-Units"
        "Module-04-Users-and-Groups"
        "Module-05-Group-Policy-Administration"
        "Module-06-Password-Policies"
        "Module-07-Group-Policy-Security-Filtering"
        "Module-08-Group-Policy-Troubleshooting"
        "Module-09-Group-Policy-Backup-and-Recovery"
        "Module-10-Group-Policy-Reporting"
        "Module-11-Windows-Event-Forwarding"
        "Module-12-Windows-Administration-Fundamentals"
        "Module-13-Windows-Internals"
        "Module-14-Sysinternals-Suite"
        "Module-15-Windows-Remote-Management"
        "Module-16-Desired-State-Configuration"
        "Module-17-Windows-Firewall-Administration"
        "Module-18-Windows-Security-Hardening"
    )

    "Phase-02-Enterprise-Infrastructure-Services" = @(
        "Module-01-Enterprise-DNS-Infrastructure"
        "Module-02-Enterprise-DNS-Records-and-Name-Resolution"
        "Module-03-Enterprise-DNS-Troubleshooting"
        "Module-04-Enterprise-DHCP-Administration"
        "Module-05-DHCP-Reservations-and-Scopes"
        "Module-06-Enterprise-File-Services"
        "Module-07-NTFS-Permissions"
        "Module-08-SMB-Shares"
        "Module-09-Distributed-File-System"
        "Module-10-Windows-Public-Key-Infrastructure"
        "Module-11-Certificate-Lifecycle-Management"
        "Module-12-Certificate-Revocation"
        "Module-13-Network-Policy-Server-and-RADIUS"
        "Module-14-Windows-Server-Update-Services"
        "Module-15-Windows-Failover-Clustering"
    )

    "Phase-03-Enterprise-Networking" = @()
    "Phase-04-Enterprise-Identity-and-Access-Management" = @()
    "Phase-05-Hybrid-Identity-and-Cloud-Security" = @()
    "Phase-06-Detection-Engineering-and-SOC-Operations" = @()
    "Phase-07-Incident-Response-and-Digital-Forensics" = @()
    "Phase-08-Malware-Analysis-and-Reverse-Engineering" = @()
    "Phase-09-Application-Security" = @()
    "Phase-10-DevSecOps-and-Automation" = @()
    "Phase-11-Programming-and-Automation" = @()
    "Phase-12-Linux-Administration-and-Security" = @()
    "Phase-13-Governance-Risk-and-Compliance" = @()
    "Phase-14-Data-Engineering-and-Security-Analytics" = @()
    "Phase-15-Enterprise-Architecture-and-Professional-Practice" = @()
    "Phase-16-Enterprise-AI-Security-and-Identity" = @()
}

$ModuleFolders = @(
    "Runbook"
    "Lab Notes"
    "Evidence"
)

# ---------------------------------------------------------------------------
# Functions
# ---------------------------------------------------------------------------

function New-CDJDirectory {
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -Path $Path -ItemType Directory | Out-Null
        Write-Host "[CREATED] $Path"
    }
    else {
        Write-Host "[EXISTS]  $Path"
    }
}

function New-CDJFile {
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -Path $Path -ItemType File | Out-Null
        Write-Host "[CREATED] $Path"
    }
    else {
        Write-Host "[EXISTS]  $Path"
    }
}

# ---------------------------------------------------------------------------
# Assessment
# ---------------------------------------------------------------------------

Write-Host ""
Write-Host "Cyber Defense Journey Repository Structure"
Write-Host "Repository: $RepositoryPath"
Write-Host ""

if (-not (Test-Path -LiteralPath $RepositoryPath)) {
    Write-Host "[INFO] Repository path does not exist and will be created."
}

# ---------------------------------------------------------------------------
# Implementation
# ---------------------------------------------------------------------------

New-CDJDirectory -Path $RepositoryPath
New-CDJDirectory -Path $LabsPath

foreach ($Phase in $Phases.GetEnumerator()) {
    $PhasePath = Join-Path $LabsPath $Phase.Key

    New-CDJDirectory -Path $PhasePath

    foreach ($Module in $Phase.Value) {
        $ModulePath = Join-Path $PhasePath $Module

        New-CDJDirectory -Path $ModulePath

        foreach ($Folder in $ModuleFolders) {
            New-CDJDirectory -Path (Join-Path $ModulePath $Folder)
        }

        New-CDJFile -Path (Join-Path $ModulePath "README.md")
        New-CDJFile -Path (
            Join-Path $ModulePath "Runbook\Runbook.md"
        )
        New-CDJFile -Path (
            Join-Path $ModulePath "Lab Notes\Lab Notes.md"
        )
    }
}

# ---------------------------------------------------------------------------
# Validation
# ---------------------------------------------------------------------------

Write-Host ""
Write-Host "Validating repository structure..."
Write-Host ""

$MissingPaths = @()

foreach ($Phase in $Phases.GetEnumerator()) {
    $PhasePath = Join-Path $LabsPath $Phase.Key

    if (-not (Test-Path -LiteralPath $PhasePath)) {
        $MissingPaths += $PhasePath
    }

    foreach ($Module in $Phase.Value) {
        $ModulePath = Join-Path $PhasePath $Module

        $RequiredPaths = @(
            $ModulePath
            (Join-Path $ModulePath "README.md")
            (Join-Path $ModulePath "Runbook")
            (Join-Path $ModulePath "Runbook\Runbook.md")
            (Join-Path $ModulePath "Lab Notes")
            (Join-Path $ModulePath "Lab Notes\Lab Notes.md")
            (Join-Path $ModulePath "Evidence")
        )

        foreach ($RequiredPath in $RequiredPaths) {
            if (-not (Test-Path -LiteralPath $RequiredPath)) {
                $MissingPaths += $RequiredPath
            }
        }
    }
}

# ---------------------------------------------------------------------------
# Completion
# ---------------------------------------------------------------------------

Write-Host ""

if ($MissingPaths.Count -gt 0) {
    Write-Host "[FAIL] One or more required paths were not created."

    foreach ($MissingPath in $MissingPaths) {
        Write-Host "  - $MissingPath"
    }

    throw "CDJ repository structure validation failed."
}

Write-Host "[PASS] CDJ Labs structure created successfully."
Write-Host ""
Write-Host "Location:"
Write-Host $LabsPath