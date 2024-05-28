# Install and Configure Active Directory

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
   - Ensure your local server is selected and click `Next`.<br><br>
   ![Screenshot 2024-05-26 150451](https://github.com/MenakaGodakanda/Home-lab-active-directory/assets/156875412/37a9cfe2-ce08-42f4-a91a-31955e485570)

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
   - Choose `Add a new forest` and enter a root domain name (e.g., `mydomain.com`).
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
   - Ensure your domain (`mydomain.com`) is listed and accessible.<br><br>
   ![Screenshot 2024-05-26 213505](https://github.com/MenakaGodakanda/Home-lab-active-directory/assets/156875412/3c0c2524-3895-4d86-a0fb-f14334244570)

### 4. Creating Organizational Units (OUs) for Admins

1. **Create Organizational Units (OUs)**:
   - In `Active Directory Users and Computers`, right-click on your domain (e.g., `mydomain.local`), select `New` > `Organizational Unit`.
   - Name the OU (e.g., `_ADMINS`) and click `OK`.

2. **Create Admin Accounts**:
   - Right-click on the OU you created (e.g., `_ADMINS`), select `New` > `User`.
   - Enter user details and click `Next`. <br><br>
   ![26](https://github.com/MenakaGodakanda/Home-lab-active-directory/assets/156875412/eb468fbc-f763-4477-b047-1da9da90951a) <br><br>
   - Set a password and configure password options.
   - Click `Next` and then `Finish`.
  
3. **Make a Domain Admin**:
   - Right-click on the Admin account you created (e.g., `Menaka Godakanda`), select `Properties`.
   - Select `Member Of` > `Add`.
   - Enter the object names to select (e.g., `domain admins`) > `Check Names` and `OK`.
   - Click `Apply` and then `OK`.

4. **Verify Domain Admin Account**:
   - Sign out from the domain controller.
   - After Sign out, log in using the domain admin credentials (`a-mgodakanda`).

### 5. Install RAS / NAT

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
   - Check the box for `Remote Access` and click `Next`.

6. **Select Features**:
   - Click `Next` on the `Features` page (no additional features are needed).

7. **Select Remote Access**:
   - Click `Next` on the `Remote Access` page.

8. **Select Role Services of Remote Access**:
   - Check the box for `Routing` and click `Add Features`.
   - Then `DirectAccess and VPN (RAS)` will be automatically checked.
   - Click `Next` on the `Role Services of Remote Access` page.

9. **Select Web Server Role (IIS)**:
   - Click `Next` on the ` Web Server Role` page.
  
10. **Select Role Services of Web Server Role**:
   - Click `Next` on the `Role Services of Web Server Role` page.  

11. **Confirm Installation Selections**:
   - Click `Install`. The installation will begin and may take a few minutes.
   - Do not close the window until the installation is complete.

### 6. Routing and Remote Access Server Configuration

1. **Open Routing and Remote Access**:
   - In Server Manager, go to `Tools` > `Routing and Remote Access`.

2. **Configure Routing and Remote Access**:
   -  Right-click on `DC (local)` and select `Configure and Enable Routing and Remote Access`.
   -  Click `Next` on the ` Routing and Remote Access Server Setup Wizard` page.
   -  Check the `NAT` on the `Configueration` page and click `Next`.
   -  Check the `Use this public interface to connect to the Internet` on the `NAT Internet Connection` page and select a network interface to connect to the Internet (e.g., `_INTERNET_`).
   -  Click `Next` and `Finish`.
   -  Ensure your Routing and Remote Access is configured.<br><br>
   ![57](https://github.com/MenakaGodakanda/Home-lab-active-directory/assets/156875412/de3aa67d-f2ff-4ac5-9040-1bfbf81334d2)

### 7. Add a DHCP Server

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
   - Check the box for `DHCP Server` > `Add Features` and click `Next`.

6. **Select Features**:
   - Click `Next` on the `Features` page (no additional features are needed).

7. **Select DHCP Server**:
   - Click `Next` on the `DHCP Server` page.

8. **Confirm Installation Selections**:
   - Click `Install`. The installation will begin and may take a few minutes.
   - Do not close the window until the installation is complete.

### 8. DHCP Configuration to Setup Scope

1. **Open DHCP Manager**:
   - In Server Manager, go to `Tools` > `DHCP`.

2. **Setup Scope**:
   - Expand the server name, then right click on the `IPv4`, and select `New Scope`.
   - Click `Next` on the `New Scope Wizard`.

3. **Scope Name**:
   - Name the scope (e.g., `172.16.0.100-200`) and click `Next`.
  
4. **IP Address Range**:
   - Enter IP Address Range details and click `Next`. <br><br>
   ![74](https://github.com/MenakaGodakanda/Home-lab-active-directory/assets/156875412/a3a78ed5-0816-406c-a4d8-0ab58b3517bb)

5. **Add Exclusions and Delay**:
   - Click `Next` on the `Add Exclusions and Delay` page.

6. **Lease Duration**:
   - Set the duration for scope lease (e.g., `8 Days`) and click `Next`.

7. **Configure DHCP Options**:
   - Check the box for `Yes, I want to configure these options now` and click `Next`.

8. **Router (Default Gateway**:
   - Add an IP address for a router used by client (e.g., `172.16.0.1`) > `Add` and click `Next`.

9. **Domain Name and DNS Servers**:
   - Specify the parent domain (e.g., `mydomain.com`)
   - Ensure the IP address is added and click `Next`.

10. **WINS Servers**:
   - Click `Next` on the `WINS Servers` page.

11. **Activate Scope**:
   - Check the box for `Yes, I want to activate this scope now` and click `Next`.
   - Click `Finish` to complete the new scope wizard.

12. **Authorize DHCP Server**:
   - Right-click on DHCP server and click `Authorize`.
   - Right-click again on DHCP server and click `Refresh`.
   - You can see the scope and the IPv4 turns green. <br><br>
   ![86](https://github.com/MenakaGodakanda/Home-lab-active-directory/assets/156875412/2114d70e-505f-4eb4-9b8a-08ead8114da3)

### 9. Enhance Security Configuration (optional) 

1. **Open Server Manager**:
   - Server Manager should open automatically upon logging in. If not, open it from the Start menu.

2. **Open Local Server Dashboard**:
   - In Server Manager, click on `Configure this local server`.
  
3. **Disable Enhanced Security**:
   - Click  on `IE Enhanced Security Configuration` property to turn it off.
   - Check the `off` button for `Adminstrators` and `Users`.
   - Click `OK` to complete the enhanced security configuration. (This will allow you to access the Internet without any warnings, but it is not recommended in the production environment.)
 
### Conclusion

Your Windows Server is now configured as an Active Directory Domain Controller. You have verified the AD installation and configured DNS. You can now proceed to join client machines to the domain and manage users and groups through Active Directory.

For further steps, refer to other setup guides in this repository, 
- [Windows Server Setup](setup/windows-server-setup.md)
- [Windows Client Setup](setup/windows-client-setup.md)
- [Use PowerShell to Add Users](setup/powershell-usage.md)
