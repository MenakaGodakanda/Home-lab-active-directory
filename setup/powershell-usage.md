# PowerShell Usage for Active Directory

This guide provides detailed instructions on using PowerShell to add users to your Active Directory (AD) domain. This will help automate user management tasks in your AD environment.

## Prerequisites

- Windows Server VM with Active Directory Domain Services (AD DS) installed and configured (refer to `windows-server-setup.md` and `active-directory-setup.md`).
- Administrator access to the Windows Server VM.
- Basic understanding of PowerShell scripting.

## Step-by-Step Instructions

### 1. Open PowerShell with Administrative Privileges

1. **Log in to the Windows Server**:
   - Log in to your Windows Server using a domain administrator account (e.g., `mydomain\Administrator`).

2. **Open PowerShell**:
   - Right-click on the Start menu and select `Windows PowerShell (Admin)`.

### 2. Import Active Directory Module

1. **Import the AD Module**:
   - Ensure the Active Directory module for PowerShell is imported. This module is automatically installed when you add the AD DS role.

   ```powershell
   Import-Module ActiveDirectory

