<#
.SYNOPSIS
    Installs, configures, and validates the Cyber Defense Journey DHCP service.

.DESCRIPTION
    Installs the DHCP Server role, authorizes the server in Active Directory,
    creates the enterprise IPv4 scope, configures DHCP options, and validates
    the resulting server-side configuration.

    The script checks for existing configuration before making changes and can
    be run more than once without intentionally creating duplicate objects.

.PARAMETER ScopeName
    Display name assigned to the DHCP scope.

.PARAMETER ScopeId
    Network identifier for the DHCP scope.

.PARAMETER StartRange
    First dynamically assignable IPv4 address.

.PARAMETER EndRange
    Last dynamically assignable IPv4 address.

.PARAMETER SubnetMask
    Subnet mask assigned to the DHCP scope.

.PARAMETER Router
    Default gateway distributed through DHCP option 003.

.PARAMETER DnsServer
    DNS server distributed through DHCP option 006.

.PARAMETER DnsDomain
    DNS suffix distributed through DHCP option 015.

.PARAMETER LeaseDuration
    Lease duration assigned to the DHCP scope.

.EXAMPLE
    .\Install-EnterpriseDHCP.ps1

.NOTES
    Project: Cyber Defense Journey
    Phase: 02 - Enterprise Infrastructure Services
    Module: 04 - Enterprise DHCP Administration

    Run from an elevated Windows PowerShell session on CDJ-DC01.

    The account running this script requires permission to authorize a DHCP
    server in Active Directory.
#>

[CmdletBinding()]
param(
    [string]$ScopeName = "Enterprise Client Network",

    [ipaddress]$ScopeId = "10.0.10.0",

    [ipaddress]$StartRange = "10.0.10.100",

    [ipaddress]$EndRange = "10.0.10.200",

    [ipaddress]$SubnetMask = "255.255.255.0",

    [ipaddress]$Router = "10.0.10.1",

    [ipaddress]$DnsServer = "10.0.10.10",

    [string]$DnsDomain = "corp.local",

    [timespan]$LeaseDuration = "8.00:00:00"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# ---------------------------------------------------------------------------
# Variables
# ---------------------------------------------------------------------------

$ComputerName = $env:COMPUTERNAME
$ExpectedComputerName = "CDJ-DC01"
$DhcpFqdn = "$ComputerName.$DnsDomain"

$ChangesMade = @()
$ValidationFailures = @()

function Write-Section {
    param(
        [Parameter(Mandatory)]
        [string]$Title
    )

    Write-Host ""
    Write-Host ("=" * 70)
    Write-Host $Title
    Write-Host ("=" * 70)
}

function Write-Status {
    param(
        [Parameter(Mandatory)]
        [ValidateSet("INFO", "PASS", "CHANGE", "WARN", "FAIL")]
        [string]$Level,

        [Parameter(Mandatory)]
        [string]$Message
    )

    Write-Host "[$Level] $Message"
}

function Test-Administrator {
    $Identity = [Security.Principal.WindowsIdentity]::GetCurrent()

    $Principal = New-Object Security.Principal.WindowsPrincipal($Identity)

    return $Principal.IsInRole(
        [Security.Principal.WindowsBuiltInRole]::Administrator
    )
}

# ---------------------------------------------------------------------------
# Assessment
# ---------------------------------------------------------------------------

Write-Section "ASSESSMENT"

if (-not (Test-Administrator)) {
    throw "Run this script from an elevated Windows PowerShell session."
}

Write-Status -Level PASS -Message "Administrative session confirmed."

if ($ComputerName -eq $ExpectedComputerName) {
    Write-Status -Level PASS -Message `
        "Computer name matches the CDJ naming standard: $ComputerName."
}
else {
    Write-Status -Level WARN -Message `
        "Computer name is $ComputerName. CDJ documentation expects $ExpectedComputerName."
}

try {
    Import-Module ActiveDirectory

    $Domain = Get-ADDomain

    if ($Domain.DNSRoot -ne $DnsDomain) {
        throw "The connected domain does not match $DnsDomain."
    }

    Write-Status -Level PASS -Message `
        "Active Directory domain $DnsDomain is available."
}
catch {
    throw "Active Directory assessment failed: $($_.Exception.Message)"
}

$PrimaryIPv4 = Get-NetIPAddress -AddressFamily IPv4 |
    Where-Object {
        $_.IPAddress -notlike "127.*" -and
        $_.AddressState -eq "Preferred"
    } |
    Select-Object -First 1

if (-not $PrimaryIPv4) {
    throw "A preferred non-loopback IPv4 address could not be detected."
}

Write-Status -Level INFO -Message `
    "Primary server IPv4 address: $($PrimaryIPv4.IPAddress)."

if ($PrimaryIPv4.IPAddress -ne $DnsServer.IPAddressToString) {
    Write-Status -Level WARN -Message `
        "The server address does not match the expected DNS address $DnsServer."
}

$DhcpFeature = Get-WindowsFeature -Name DHCP

Write-Status -Level INFO -Message `
    "DHCP role state: $($DhcpFeature.InstallState)."

# ---------------------------------------------------------------------------
# Implementation
# ---------------------------------------------------------------------------

Write-Section "IMPLEMENTATION"

# Install DHCP Server role when required.

if (-not $DhcpFeature.Installed) {
    Write-Status -Level CHANGE -Message `
        "Installing the DHCP Server role and management tools."

    $InstallResult = Install-WindowsFeature DHCP -IncludeManagementTools

    if (-not $InstallResult.Success) {
        throw "The DHCP Server role installation did not report success."
    }

    $ChangesMade += "Installed the DHCP Server role and management tools."

    Write-Status -Level PASS -Message `
        "DHCP Server role installed successfully."
}
else {
    Write-Status -Level PASS -Message `
        "DHCP Server role is already installed."
}

Import-Module DHCPServer

# Authorize DHCP in Active Directory when required.

$AuthorizedServer = Get-DhcpServerInDC |
    Where-Object {
        $_.DnsName -ieq $DhcpFqdn -or
        $_.IPAddress -eq $PrimaryIPv4.IPAddress
    }

if (-not $AuthorizedServer) {
    Write-Status -Level CHANGE -Message `
        "Authorizing $DhcpFqdn in Active Directory."

    try {
        Add-DhcpServerInDC `
            -DnsName $DhcpFqdn `
            -IPAddress $PrimaryIPv4.IPAddress

        $ChangesMade += `
            "Authorized $DhcpFqdn as an Active Directory DHCP server."

        Write-Status -Level PASS -Message `
            "DHCP authorization completed."
    }
    catch {
        throw @"
DHCP authorization failed.

Confirm that the current account has permission to authorize DHCP servers
in Active Directory.

Error: $($_.Exception.Message)
"@
    }
}
else {
    Write-Status -Level PASS -Message `
        "DHCP server is already authorized as $($AuthorizedServer.DnsName)."
}

# Create the DHCP scope when it does not already exist.

$ExistingScope = Get-DhcpServerv4Scope `
    -ScopeId $ScopeId `
    -ErrorAction SilentlyContinue

if (-not $ExistingScope) {
    Write-Status -Level CHANGE -Message `
        "Creating DHCP scope $ScopeName."

    Add-DhcpServerv4Scope `
        -Name $ScopeName `
        -StartRange $StartRange `
        -EndRange $EndRange `
        -SubnetMask $SubnetMask `
        -LeaseDuration $LeaseDuration `
        -State Active

    $ChangesMade += "Created DHCP scope $ScopeName."

    Write-Status -Level PASS -Message `
        "DHCP scope created successfully."
}
else {
    Write-Status -Level PASS -Message `
        "DHCP scope $ScopeId already exists."

    $ScopeRequiresUpdate = (
        $ExistingScope.Name -ne $ScopeName -or
        $ExistingScope.StartRange -ne $StartRange -or
        $ExistingScope.EndRange -ne $EndRange -or
        $ExistingScope.LeaseDuration -ne $LeaseDuration -or
        $ExistingScope.State -ne "Active"
    )

    if ($ScopeRequiresUpdate) {
        Write-Status -Level CHANGE -Message `
            "Updating the existing DHCP scope."

        Set-DhcpServerv4Scope `
            -ScopeId $ScopeId `
            -Name $ScopeName `
            -StartRange $StartRange `
            -EndRange $EndRange `
            -LeaseDuration $LeaseDuration `
            -State Active

        $ChangesMade += "Updated DHCP scope $ScopeId."

        Write-Status -Level PASS -Message `
            "Existing DHCP scope updated."
    }
}

# Configure DHCP options.

Write-Status -Level CHANGE -Message `
    "Configuring DHCP scope options."

Set-DhcpServerv4OptionValue `
    -ScopeId $ScopeId `
    -Router $Router `
    -DnsServer $DnsServer `
    -DnsDomain $DnsDomain

$ChangesMade += "Configured DHCP options for scope $ScopeId."

Write-Status -Level PASS -Message `
    "DHCP scope options configured."

# Start the DHCP service when required.

$DhcpService = Get-Service -Name DHCPServer

if ($DhcpService.Status -ne "Running") {
    Write-Status -Level CHANGE -Message `
        "Starting the DHCP Server service."

    Start-Service -Name DHCPServer

    $ChangesMade += "Started the DHCP Server service."
}

# ---------------------------------------------------------------------------
# Validation
# ---------------------------------------------------------------------------

Write-Section "VALIDATION"

$ValidatedFeature = Get-WindowsFeature -Name DHCP

if ($ValidatedFeature.Installed) {
    Write-Status -Level PASS -Message `
        "DHCP Server role is installed."
}
else {
    $ValidationFailures += "DHCP Server role is not installed."

    Write-Status -Level FAIL -Message `
        "DHCP Server role validation failed."
}

$ValidatedService = Get-Service `
    -Name DHCPServer `
    -ErrorAction SilentlyContinue

if ($ValidatedService.Status -eq "Running") {
    Write-Status -Level PASS -Message `
        "DHCP Server service is running."
}
else {
    $ValidationFailures += "DHCP Server service is not running."

    Write-Status -Level FAIL -Message `
        "DHCP Server service validation failed."
}

$ValidatedAuthorization = Get-DhcpServerInDC |
    Where-Object {
        $_.DnsName -ieq $DhcpFqdn -and
        $_.IPAddress -eq $PrimaryIPv4.IPAddress
    }

if ($ValidatedAuthorization) {
    Write-Status -Level PASS -Message `
        "DHCP authorization exists for $DhcpFqdn."
}
else {
    $ValidationFailures += `
        "DHCP authorization is missing or incorrect."

    Write-Status -Level FAIL -Message `
        "DHCP authorization validation failed."
}

$ValidatedScope = Get-DhcpServerv4Scope `
    -ScopeId $ScopeId `
    -ErrorAction SilentlyContinue

if (
    $ValidatedScope -and
    $ValidatedScope.State -eq "Active" -and
    $ValidatedScope.StartRange -eq $StartRange -and
    $ValidatedScope.EndRange -eq $EndRange
) {
    Write-Status -Level PASS -Message `
        "Scope $ScopeId is active with the expected address range."
}
else {
    $ValidationFailures += `
        "DHCP scope does not match the intended configuration."

    Write-Status -Level FAIL -Message `
        "DHCP scope validation failed."
}

$ScopeOptions = Get-DhcpServerv4OptionValue -ScopeId $ScopeId

$RouterOption = $ScopeOptions |
    Where-Object OptionId -eq 3

$DnsServerOption = $ScopeOptions |
    Where-Object OptionId -eq 6

$DnsDomainOption = $ScopeOptions |
    Where-Object OptionId -eq 15

if ($RouterOption.Value -contains $Router.IPAddressToString) {
    Write-Status -Level PASS -Message `
        "Router option is configured as $Router."
}
else {
    $ValidationFailures += `
        "Router option does not match $Router."

    Write-Status -Level FAIL -Message `
        "Router option validation failed."
}

if ($DnsServerOption.Value -contains $DnsServer.IPAddressToString) {
    Write-Status -Level PASS -Message `
        "DNS server option is configured as $DnsServer."
}
else {
    $ValidationFailures += `
        "DNS server option does not match $DnsServer."

    Write-Status -Level FAIL -Message `
        "DNS server option validation failed."
}

if ($DnsDomainOption.Value -contains $DnsDomain) {
    Write-Status -Level PASS -Message `
        "DNS domain option is configured as $DnsDomain."
}
else {
    $ValidationFailures += `
        "DNS domain option does not match $DnsDomain."

    Write-Status -Level FAIL -Message `
        "DNS domain option validation failed."
}

# ---------------------------------------------------------------------------
# Completion
# ---------------------------------------------------------------------------

Write-Section "COMPLETION"

if ($ChangesMade.Count -gt 0) {
    Write-Status -Level INFO -Message `
        "Changes completed during this execution:"

    foreach ($Change in $ChangesMade) {
        Write-Host "  - $Change"
    }
}
else {
    Write-Status -Level INFO -Message `
        "No changes were required. The intended configuration already existed."
}

if ($ValidationFailures.Count -gt 0) {
    Write-Status -Level FAIL -Message `
        "$($ValidationFailures.Count) validation check or checks failed."

    foreach ($Failure in $ValidationFailures) {
        Write-Host "  - $Failure"
    }

    throw "Enterprise DHCP deployment failed validation."
}

Write-Status -Level PASS -Message `
    "Enterprise DHCP configuration passed all server-side validation checks."

Write-Host ""
Write-Host "Client-side validation is still required."
Write-Host ""
Write-Host "On the enterprise client, run:"
Write-Host ""
Write-Host "  ipconfig /release"
Write-Host "  ipconfig /renew"
Write-Host "  ipconfig /all"
Write-Host ""
Write-Host "Confirm:"
Write-Host "  - IPv4 address between $StartRange and $EndRange"
Write-Host "  - DHCP server $DnsServer"
Write-Host "  - DNS server $DnsServer"
Write-Host "  - Router $Router"
Write-Host "  - DNS suffix $DnsDomain"