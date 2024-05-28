# Windows Server Setup

This guide provides detailed instructions for setting up a Windows Server virtual machine (VM) on Oracle VirtualBox, which will serve as the domain controller for your Active Directory (AD) environment.

## Prerequisites

- Oracle VirtualBox installed on your host machine.
- Windows Server ISO file (evaluation version available from [Microsoft Evaluation Center](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2019)).

## Step-by-Step Instructions

### 1. Create the Virtual Machine

1. **Open Oracle VirtualBox**:
   - Launch VirtualBox from your applications menu.

2. **Create a New VM**:
   - Click on `New` to create a new VM.
   - Name the VM (e.g., "DC").
   - Set the Type to `Microsoft Windows` and the Version to `Windows 2019 (64-bit)`.
   - Click `Next`.

3. **Allocate Memory**:
   - Allocate at least 2 GB (2048 MB) of memory. More is better if your host system can support it.
   - Click `Next`.

4. **Create a Virtual Hard Disk**:
   - Select `Create a virtual hard disk now` and click `Create`.
   - Choose `VDI (VirtualBox Disk Image)` and click `Next`.
   - Select `Dynamically allocated` and click `Next`.
   - Set the disk size to at least 20 GB and click `Create`.

### 2. Configure the Virtual Machine

1. **Attach the Windows Server ISO**:
   - Select your newly created VM and click `Settings`.
   - Go to the `Storage` section.
   - Under `Controller: IDE`, click on the empty CD icon labeled `Empty`.
   - Click the CD icon on the right side and select `Choose a disk file`.
   - Browse to and select the Windows Server ISO file.
   - Click `OK` to save the settings.

2. **Processor Configuration**:
   - Go to the `System` section.
   - Under `Processor`, allocate 2 processors. More is better if your host system can support it.
   - Click `OK` to save the settings.
  
3. **Network Configuration**:
   - Go to the `Network` section.
   - Ensure `Adapter 1` is enabled and attached to `NAT`. This will allow your VM to connect to the same network as your host machine.
   - Ensure `Adapter 2` is enabled and attached to `Internal Network` and name to `intnet`. This will allow your VM to connect to client VM.
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

### 4. Configure NIC

1. **Open Network Connections**:
   - Go to `Control Panel` > `Network and Sharing Center` > `Change adapter settings`. You will see two networks and are required to rename them appropriately.<br><br>
     ![Screenshot 2024-05-26 144351](https://github.com/MenakaGodakanda/Home-lab-active-directory/assets/156875412/3d0bbbe5-99a8-45c4-b12e-a743e40d7499)
     
   - `Ethernet 2` is the network adapter that connects to the Internet. You can right-click `Ethernet 2` and click status to check its IP address. Rename the `Ethernet 2` (e.g., "_INTERNET_").
   - `Ethernet` is the internal network. You can right-click `Ethernet` and click status to check its IP address. Rename the `Ethernet` (e.g., "X_Internal_X").<br><br>
![Screenshot 2024-05-26 145147](https://github.com/MenakaGodakanda/Home-lab-active-directory/assets/156875412/123f57a6-5e2d-484f-af3e-6a3975eb37e5)

2. **Assign IP Address**:
   - It is required to assign IP addrress to the internal network adapter (`X_Internal_X`). Right-click on your network adapter and select `Properties`.
   - Select `Internet Protocol Version 4 (TCP/IPv4)` and click `Properties`.
   - Set a static IP (e.g., `172.16.0.1`), subnet mask (e.g., `255.255.255.0`), and default gateway.
   - Set the Preferred DNS server to the static IP of the AD server itself (e.g., `127.0.0.1`).<br><br>
   ![Screenshot 2024-05-26 145957](https://github.com/MenakaGodakanda/Home-lab-active-directory/assets/156875412/ffe9a799-e9fb-4e58-a2e8-7acd07c758cf)


### Conclusion

Your Windows Server VM is now set up as a domain controller for your Active Directory domain. Proceed to configure your Windows Client VM and join it to this domain.

For further steps, refer to other setup guides in this repository.
- [Windows Client Setup](setup/windows-client-setup.md)
- [Install and Configure Active Directory](setup/active-directory-setup.md)
- [Use PowerShell to Add Users](setup/powershell-usage.md)
