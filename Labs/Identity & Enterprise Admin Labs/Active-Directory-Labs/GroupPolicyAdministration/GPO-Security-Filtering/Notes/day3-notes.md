# Security Filtering Notes

## Default Behavior

New Group Policy Objects grant **Authenticated Users** the ability to read and apply policy.

This allows domain computers and users to retrieve policy information during Group Policy processing.

---

## Targeted Deployment

Added:

- HR_Users

Permission:

- Apply Group Policy

Purpose:

Limit policy application to a specific department while maintaining normal Group Policy functionality.

---

## Microsoft Warning

Attempted to remove:

- Authenticated Users

Windows Server generated a warning indicating that removing Authenticated Users could prevent client computers from reading Group Policy data.

Because of this, the change was not completed.

---

## Lesson Learned

Enterprise administration is not simply applying commands.

Understanding Microsoft's recommendations and preserving reliable Group Policy processing is often more important than making aggressive security changes.

Security should always be balanced with system functionality.

---

## Key Takeaway

Security Filtering should be implemented carefully.

Removing default permissions without understanding Group Policy processing can unintentionally prevent policies from applying correctly.