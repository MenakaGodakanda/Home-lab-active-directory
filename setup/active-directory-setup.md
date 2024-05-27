# Active Directory Setup

This guide provides detailed instructions for configuring Active Directory (AD) on a Windows Server virtual machine (VM) in your home lab. This server will act as a domain controller for your AD domain.

## Prerequisites

- Windows Server VM created and running (refer to `windows-server-setup.md` for setup details).
- Administrator access to the Windows Server VM.

## Step-by-Step Instructions

### 1. Add Active Directory Domain Services (AD DS) Role

1. **Open Server Manager**:
   - Server Manager should open automatically upon logging in. If not, open it from the Start menu.

2. **Add Roles and Features**:
   - In Server Manager, click on `Manage` > `Add Roles and Features`.
   - Click `Next` through the `Before you begin` page.

3. **Select Installation Type**:
   - Choose `Role-based or feature-based installation` and click `Next`.

4. **Select Destination Server**:
   - Ensure your local server is selected and click `Next`.

5. **Select Server Roles**:
   - Check the box for `Active Directory Domain Services`.
   - A dialog box will appear asking to add required features. Click `Add Features`.
   - Click `Next`.

6. **Select Features**:
   - Click `Next` on the `Features` page (no additional features are needed).

7. **AD DS Information**:
   - Click `Next` on the `Active Directory Domain Services` page.

8. **Confirm Installation Selections**:
   - Click `Install`. The installation will begin and may take a few minutes.
   - Do not close the window until the installation is complete.

### 2. Promote Server to a Domain Controller

1. **Post-Deployment Configuration**:
   - Once the AD DS role is installed, a notification flag will appear in Server Manager.
   - Click the flag and then click `Promote this server to a domain controller`.

2. **Deployment Configuration**:
   - Choose `Add a new forest` and enter a root domain name (e.g., `mydomain.local`).
   - Click `Next`.

3. **Domain Controller Options**:
   - Set the Forest functional level and Domain functional level to `Windows Server 2016`.
   - Check `Domain Name System (DNS) server` and `Global Catalog (GC)`.
   - Set a Directory Services Restore Mode (DSRM) password and click `Next`.

4. **DNS Options**:
   - Click `Next` on the `DNS Options` page (ignore the delegation warning if it appears).

5. **Additional Options**:
   - The NetBIOS domain name should be filled automatically. Click `Next`.

6. **Paths**:
   - Keep the default file paths for the database, log files, and SYSVOL. Click `Next`.

7. **Review Options**:
   - Review your selections and click `Next`.

8. **Prerequisites Check**:
   - The installer will perform a prerequisites check. Ensure all checks pass and click `Install`.

9. **Restart the Server**:
   - The server will automatically restart upon completion of the installation.

### 3. Post-Installation Configuration

1. **Log In**:
   - After restarting, log in using the domain credentials (`mydomain\Administrator`).

2. **Verify AD Installation**:
   - Open `Server Manager`.
   - Go to `Tools` > `Active Directory Users and Computers`.
   - Ensure your domain (`mydomain.local`) is listed and accessible.

### 4. DNS Configuration

1. **Open DNS Manager**:
   - In Server Manager, go to `Tools` > `DNS`.

2. **Configure Forward Lookup Zones**:
   - Expand the server name, then expand `Forward Lookup Zones`.
   - Ensure there is a zone for your domain (e.g., `mydomain.local`).

3. **Configure Reverse Lookup Zones** (Optional):
   - Right-click on `Reverse Lookup Zones` and select `New Zone`.
   - Follow the wizard to create a reverse lookup zone (use your network’s subnet, e.g., `192.168.1.x`).

### 5. Creating Organizational Units (OUs) and Users

1. **Create Organizational Units (OUs)**:
   - In `Active Directory Users and Computers`, right-click on your domain (e.g., `mydomain.local`), select `New` > `Organizational Unit`.
   - Name the OU (e.g., `Employees`) and click `OK`.

2. **Create User Accounts**:
   - Right-click on the OU you created (e.g., `Employees`), select `New` > `User`.
   - Enter user details and click `Next`.
   - Set a password and configure password options.
   - Click `Next` and then `Finish`.

### Conclusion

Your Windows Server is now configured as an Active Directory Domain Controller. You have verified the AD installation and configured DNS. You can now proceed to join client machines to the domain and manage users and groups through Active Directory.

For further steps, refer to other setup guides in this repository, such as configuring a Windows Client and using PowerShell to automate tasks.
