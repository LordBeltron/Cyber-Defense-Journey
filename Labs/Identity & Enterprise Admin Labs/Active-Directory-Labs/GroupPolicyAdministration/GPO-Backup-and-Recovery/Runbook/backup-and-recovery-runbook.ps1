# ===================================================================
# Module: GPO Backup and Recovery
# Environment: Windows Server 2025
# Domain: corp.local
#
# Purpose:
# Demonstrate the complete lifecycle of backing up, validating,
# inspecting, restoring, and verifying Group Policy Objects (GPOs)
# within an Active Directory environment.
#
# Enterprise Relevance:
# Backing up GPOs before major configuration changes is a standard
# enterprise best practice. Recoverable backups reduce downtime,
# simplify rollback procedures, and support disaster recovery efforts.
# ===================================================================

# ===================================================================
# STEP 1 - Create Backup Repository
# ===================================================================

# Creates a dedicated directory to store Group Policy backups.
New-Item -ItemType Directory -Path "C:\GPO-Backups"

# ===================================================================
# STEP 2 - Backup All Group Policy Objects
# ===================================================================

# Creates backups of every Group Policy Object in the domain.
Backup-GPO -All -Path "C:\GPO-Backups"

# ===================================================================
# STEP 3 - Verify Backup Files
# ===================================================================

# Displays each backup directory that Windows created.
Get-ChildItem "C:\GPO-Backups"

# ===================================================================
# STEP 4 - Troubleshooting
# ===================================================================

# NOTE:
# The following cmdlet was tested during the lab but does not exist
# in the Microsoft Group Policy module.
#
# It is intentionally preserved here for documentation purposes.
#
# Expected Result:
# CommandNotFoundException
#
# Lesson:
# Always validate available cmdlets before building automation.

# Get-GPOBackup -Path "C:\GPO-Backups"

# ===================================================================
# STEP 5 - Verify Backup Manifest Files
# ===================================================================

# Searches every backup folder for Backup.xml.
Get-ChildItem "C:\GPO-Backups" -Recurse -Filter "Backup.xml"

# ===================================================================
# STEP 6 - Inspect Backup Manifest
# ===================================================================

# Reads the XML manifest for the HR Security Policy backup.
#
# Replace the backup folder ID if a new backup is created.
Get-Content "C:\GPO-Backups\5E45EFA6-82FA-4F67-B95D-4BFE90E057E5\Backup.xml"

# ===================================================================
# STEP 7 - Restore Group Policy
# ===================================================================

# Restores the most recent backup of the HR Security Policy.
Restore-GPO -Name "HR Security Policy" -Path "C:\GPO-Backups"

# ===================================================================
# STEP 8 - Verify Successful Recovery
# ===================================================================

# Displays the restored Group Policy.
Get-GPO -Name "HR Security Policy"

# ===================================================================
# Enterprise Best Practices
# ===================================================================

# Before modifying production Group Policies:
#
# 1. Create a backup.
# 2. Verify backup completion.
# 3. Confirm backup files exist.
# 4. Inspect backup metadata.
# 5. Test recovery procedures.
# 6. Verify restored objects.
# 7. Document every recovery operation.
#
# These practices support:
#
# - Disaster Recovery
# - Change Management
# - Configuration Management
# - Security Compliance
# - Business Continuity

# ===================================================================
# Skills Practiced
# ===================================================================

# - Group Policy Administration
# - Disaster Recovery
# - Active Directory Administration
# - Backup Validation
# - Recovery Validation
# - PowerShell Administration
# - XML Manifest Inspection
# - Troubleshooting
# - Change Management

# ===================================================================
# End of Module
# ===================================================================