# PowerShell Usage for Active Directory

This guide provides detailed instructions on using PowerShell to add users to your Active Directory (AD) domain. This will help automate user management tasks in your AD environment.

## Prerequisites

- Windows Server VM with Active Directory Domain Services (AD DS) installed and configured (refer to `windows-server-setup.md` and `active-directory-setup.md`).
- Administrator access to the Windows Server VM.
- Basic understanding of PowerShell scripting.

## Step-by-Step Instructions

### 1. Open PowerShell with Administrative Privileges

1. **Log in to the Windows Server**:
   - Log in to your Windows Server using a domain administrator account (e.g., `mydomain\Administrator` or `a-mgodakanda`).

2. **Open PowerShell**:
   - Go to `Start menu` > `Windows PowerShell` >  right click on `Windows PowerShell ISE` > `More` > `Run as adminstrator`.

### 2. Import Active Directory Module

1. **Import the AD Module**:
   - Ensure the Active Directory module for PowerShell is imported. This module is automatically installed when you add the AD DS role.<br>
   `Import-Module ActiveDirectory`

### 3. Run Powershell Script 01

1. **Download Powershell Script**:
   - Download the `Script` and extract it on `Desktop`.
   - Ensure `Create_User01.ps1` and `names.txt` are save on same folder.

2. **Open Powershell Script**:
   - Go to `Windows Powershell ISE` and click `Open`.
   - Locate the `Create_User01.ps1` and click `Open`.

3. **Enable Execution of All Scripts**:
   - Run below command to set the policy to Unrestricted.<br>
   `Set-ExecutionPolicy Unrestricted`

4. **Run Powershell Script**:
   - Run below command to go to actual directory where the script is saved (Run `ls` command to ensure the file path and files are correct). <br>
   `cd c:\users\a-mgodakanda\desktop\Script01`

   - Click on `Run`to run the Powershell script or run below command.<br>
   `c:\users\a-mgodakanda\desktop\Script\Create_User01.ps1`

   - Click `Run once` on the `Security warning` window.
   - The Powershell script will start creating the users. <br><br>
   ![99](https://github.com/MenakaGodakanda/Home-lab-active-directory/assets/156875412/b98f5cc3-f0b2-44c7-9c58-3c8b70599855)


5. **Verify Created Users**:
   - Go to `Start` > `Windows Administrative Tools` >`Active Directory Users and Computers` window.
   - Go to `mydomain.com` > `_USERS`.
   - You can see the created users.
   ![100](https://github.com/MenakaGodakanda/Home-lab-active-directory/assets/156875412/2e2373ca-7e7c-4478-9132-f47bab16401a)











