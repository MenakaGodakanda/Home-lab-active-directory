# Windows Client Setup

This guide provides detailed instructions for setting up a Windows Client virtual machine (VM) on Oracle VirtualBox and joining it to the Active Directory (AD) domain.

## Prerequisites

- Oracle VirtualBox installed on your host machine.
- Windows 10 ISO file (available from [Microsoft Windows 10 download page](https://www.microsoft.com/en-us/software-download/windows10)).
- An Active Directory domain controller VM already set up (refer to `windows-server-setup.md`).

## Step-by-Step Instructions

### 1. Create the Virtual Machine

1. **Open Oracle VirtualBox**:
   - Launch VirtualBox from your applications menu.

2. **Create a New VM**:
   - Click on `New` to create a new VM.
   - Name the VM (e.g., "CLIENT1").
   - Set the Type to `Microsoft Windows` and the Version to `Windows 10 (64-bit)`.
   - Click `Next`.

3. **Allocate Memory**:
   - Allocate at least 4 GB (4096 MB) of memory. More is better if your host system can support it.
   - Click `Next`.

4. **Create a Virtual Hard Disk**:
   - Select `Create a virtual hard disk now` and click `Create`.
   - Choose `VDI (VirtualBox Disk Image)` and click `Next`.
   - Select `Dynamically allocated` and click `Next`.
   - Set the disk size to at least 25 GB and click `Create`.

### 2. Configure the Virtual Machine

1. **Attach the Windows 10 ISO**:
   - Select your newly created VM and click `Settings`.
   - Go to the `Storage` section.
   - Under `Controller: IDE`, click on the empty CD icon labeled `Empty`.
   - Click the CD icon on the right side and select `Choose a disk file`.
   - Browse to and select the Windows 10 ISO file.
   - Click `OK` to save the settings.

2. **System Configuration**:
   - Go to the `System` > `Processor` section.
   - Allocate 4 processors. More is better if your host system can support it.
   - Click `OK` to save the settings.

2. **Network Configuration**:
   - Go to the `Network` section.
   - Ensure `Adapter 1` is enabled and attached to `Internal Nettwork` and name to `intnet`. This will allow your VM to be on the same network as your host machine.
   - Click `OK` to save the settings.

### 3. Install Windows 10

1. **Start the VM**:
   - Select your VM and click `Start`.

2. **Install the Operating System**:
   - Follow the prompts to install Windows 10.
   - Choose your `language`, `time`, and `keyboard preferences` and click `Next`.
   - Click `Install now`.
   - Enter your product key or choose `I don't have a product key` to use the trial version.
   - Select `Windows 10 Pro` and click `Next`.
   - Accept the license terms and click `Next`.
   - Choose `Custom: Install Windows only (advanced)` when prompted.
   - Choose the virtual hard disk and click `Next` to start the installation.

3. **Initial Configuration**:
   - After installation, set up a `region`, `keyboard preference` and `Skip` the `Second Keyboard Layout`.
   - Click on `I don't have internet` in the `Network` page.
   - Next click on `continiue with limited setup`.
   - Set up a local account (you can use a temporary user, e.g., `user` and not require to enter a password).
   - Complete the initial setup process and log in with the local account.


### 4. Join the Windows Client to the AD Domain

1. **Review Client Environment**:
   - Open `Command Prompt` and type `ipconfig`. Ensure it shows your `IP Address` and `Default Gateway`. <br><br>
   ![25](https://github.com/MenakaGodakanda/Home-lab-active-directory/assets/156875412/bb7b5c37-d153-4ee9-966f-1cfe347dc9d9)

   - Ensure `DNS server` is working. type `ping www.google.com`.<br><br>
   ![29](https://github.com/MenakaGodakanda/Home-lab-active-directory/assets/156875412/15823385-e5f1-40b3-ab9a-57a4d90e5f6f)

   - Ensure `Domain Controller` is working. type `ping mydomain.com`.<br><br>
   ![30](https://github.com/MenakaGodakanda/Home-lab-active-directory/assets/156875412/bb178ace-d7f5-4fa1-9540-3b2f120a1e1e)

2. **Join the Domain**:
   - Type `hostname` to view the current client name.<br><br>
   ![31](https://github.com/MenakaGodakanda/Home-lab-active-directory/assets/156875412/6b3902cb-2694-4fd5-8c37-01239a1e167b)

   - Right click on `Start Menu` > `System` > `Rename this PC (advanced)`.
   - Click `Computer Name` > `Change` on the `System Properties` window.
   - In the `System Properties` window, click `Change`.
   - In the `Computer Name/Domain Changes` window, enter the computer name (e.g., `CLIENT1`), select `Domain` and enter the domain name (e.g., `mydomain.com`).
   - Click `OK` and provide the credentials of a domain administrator when prompted.
   - Restart the client machine.

### 5. Post-Domain Join Configuration

1. **Log in with a Domain Account**:
   - After restarting, log in using a domain account (e.g., `mydomain\mgodakanda`).

2. **Verify Domain Membership**:
   - Open `Command Prompt` and type `whoami`. Ensure it shows your domain username.<br><br>
   ![39](https://github.com/MenakaGodakanda/Home-lab-active-directory/assets/156875412/4c2812b5-ede4-451c-93c0-3f0f588d94df)
   - Go to `Control Panel` > `System and Security` > `System`. Verify the domain listed under `Computer name, domain, and workgroup settings`.


### 6. Verify Domain Join Configuration

1. **Log into Domain Controller**:
   - Log into Domain Controller (Windows Server) VM.
  
2. **Verify DHCP**:
   - Server Manager should open automatically upon logging in. If not, open it from the Start menu.
   - In Server Manager window, go to `Tools` > `DHCP`.
   - In DHCP window, go to `DHCP` > `dc. mydomain.com` > `IPv4` > `Scope [172.16.0.0] 172.16.0.100-200` > `Address Leases`.
   - You can see one lease from client computer.
  
1. **Verify Active Directory Users and Computers**:
   - Go to `Start` > `Windows Administrative Tools` > `Active Directory Users and Computers`.
   - In Active Directory Users and Computers window, go to `mydomain.com` > `Computers`.
   - You can see client computer.
  

### Conclusion

Your Windows Client VM is now set up and joined to the Active Directory domain. You can now manage this client through the AD domain controller and use PowerShell scripts for automation.

For further steps, refer to other setup guides in this repository.
- [Windows Server Setup](setup/windows-server-setup.md)
- [Install and Configure Active Directory](setup/active-directory-setup.md)
- [Use PowerShell to Add Users](setup/powershell-usage.md)

