# Windows Server Setup

This guide provides detailed instructions for setting up a Windows Server virtual machine (VM) on Oracle VirtualBox, which will serve as the domain controller for your Active Directory (AD) environment.

## Prerequisites

- Oracle VirtualBox installed on your host machine.
- Windows Server ISO file (evaluation version available from [Microsoft Evaluation Center](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server)).

## Step-by-Step Instructions

### 1. Create the Virtual Machine

1. **Open Oracle VirtualBox**:
   - Launch VirtualBox from your applications menu.

2. **Create a New VM**:
   - Click on `New` to create a new VM.
   - Name the VM (e.g., "AD_Server").
   - Set the Type to `Microsoft Windows` and the Version to `Windows 2019 (64-bit)`.
   - Click `Next`.

3. **Allocate Memory**:
   - Allocate at least 2 GB (2048 MB) of memory. More is better if your host system can support it.
   - Click `Next`.

4. **Create a Virtual Hard Disk**:
   - Select `Create a virtual hard disk now` and click `Create`.
   - Choose `VDI (VirtualBox Disk Image)` and click `Next`.
   - Select `Dynamically allocated` and click `Next`.
   - Set the disk size to at least 40 GB and click `Create`.

### 2. Configure the Virtual Machine

1. **Attach the Windows Server ISO**:
   - Select your newly created VM and click `Settings`.
   - Go to the `Storage` section.
   - Under `Controller: IDE`, click on the empty CD icon labeled `Empty`.
   - Click the CD icon on the right side and select `Choose a disk file`.
   - Browse to and select the Windows Server ISO file.
   - Click `OK` to save the settings.

2. **Network Configuration**:
   - Go to the `Network` section.
   - Ensure `Adapter 1` is enabled and attached to `Bridged Adapter`. This will allow your VM to be on the same network as your host machine.
   - Click `OK` to save the settings.

### 3. Install Windows Server

1. **Start the VM**:
   - Select your VM and click `Start`.

2. **Install the Operating System**:
   - Follow the prompts to install Windows Server.
   - Choose the `Windows Server 2019 Standard (Desktop Experience)` version.
   - Accept the license terms and click `Next`.
   - Select `Custom: Install Windows only (advanced)` when prompted.
   - Choose the virtual hard disk and click `Next` to start the installation.

3. **Initial Configuration**:
   - After installation, set a strong password for the Administrator account.
   - Log in with the Administrator account.

### 4. Configure Active Directory

1. **Open Server Manager**:
   - Server Manager should open automatically upon login. If not, open it from the Start menu.

2. **Add Roles and Features**:
   - In Server Manager, click on `Manage` > `Add Roles and Features`.
   - Click `Next` through the initial prompts.
   - Choose `Role-based or feature-based installation` and click `Next`.
   - Select the local server (it should be highlighted by default) and click `Next`.

3. **Install Active Directory Domain Services (AD DS)**:
   - In the `Select server roles` step, check the box for `Active Directory Domain Services`.
   - Click `Add Features` when prompted, then click `Next`.
   - Click `Next` through the `Features` and `AD DS` pages.
   - Click `Install`. Do not close the window until the installation is complete.

4. **Promote the Server to a Domain Controller**:
   - Once the installation is complete, click the `Promote this server to a domain controller` link.
   - Choose `Add a new forest` and enter a domain name (e.g., `mydomain.local`). Click `Next`.
   - Set the Forest and Domain functional levels to `Windows Server 2016`. Enter a Directory Services Restore Mode (DSRM) password. Click `Next`.
   - Click `Next` through the DNS Options and Additional Options pages.
   - In the `Paths` page, keep the default locations and click `Next`.
   - Review the options and click `Next`, then click `Install`.

5. **Restart the Server**:
   - The server will automatically restart after the installation.

### 5. Post-Installation Configuration

1. **Verify AD Installation**:
   - Log in to the server using the domain credentials (`mydomain\Administrator`).
   - Open `Server Manager`.
   - Go to `Tools` > `Active Directory Users and Computers`. Ensure that the domain is correctly set up.

### 6. Network and DNS Configuration

1. **Configure Network Adapter**:
   - Ensure that your network adapter is set to a static IP address within your network range.
   - Go to `Control Panel` > `Network and Sharing Center` > `Change adapter settings`.
   - Right-click on your network adapter and select `Properties`.
   - Select `Internet Protocol Version 4 (TCP/IPv4)` and click `Properties`.
   - Set a static IP (e.g., `192.168.1.10`), subnet mask (e.g., `255.255.255.0`), and default gateway.
   - Set the Preferred DNS server to the static IP of the AD server itself (e.g., `192.168.1.10`).

### Conclusion

Your Windows Server VM is now set up as a domain controller for your Active Directory domain. Proceed to configure your Windows Client VM and join it to this domain.

For further steps, refer to other setup guides in this repository, such as joining a Windows Client to the AD domain and using PowerShell for automation.
