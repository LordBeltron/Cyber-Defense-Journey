# ============================================================
# GPO Security Filtering Lab
# Windows Server 2025 Active Directory
# ============================================================

# Verify that the HR_Users security group exists.
Get-ADGroup HR_Users

# Review the default permissions on the HR Security Policy GPO.
# This shows which users and groups can read, edit, or apply the GPO.
Get-GPPermission -Name "HR Security Policy" -All

# Add HR_Users to the HR Security Policy GPO with Apply Group Policy permission.
Set-GPPermission -Name "HR Security Policy" -TargetName "HR_Users" -TargetType Group -PermissionLevel GpoApply

# Verify that HR_Users was added to the GPO permissions.
Get-GPPermission -Name "HR Security Policy" -All

# Attempted but intentionally cancelled:
# Removing Authenticated Users triggered a Microsoft warning explaining that
# computers need permission to read GPO data from a domain controller.
# The operation was cancelled to preserve reliable Group Policy processing.

# Command tested:
# Set-GPPermission -Name "HR Security Policy" -TargetName "Authenticated Users" -TargetType Group -PermissionLevel None

# Final verification of GPO permissions.
Get-GPPermission -Name "HR Security Policy" -All

# ============================================================
# Key Takeaway:
# Security filtering can target GPOs to specific groups, but removing
# Authenticated Users without ensuring proper Read permissions can break
# Group Policy processing.
# ============================================================