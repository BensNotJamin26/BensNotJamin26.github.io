# Ben's Portfolio & Homelab Build

Welcome to my hands-on systems and network lab. This environment is my personal testing ground for building, breaking, and securing enterprise-grade infrastructure.

## 🛠️ The Tech Stack
* **Hypervisor:** VMware Workstation Pro hosting all virtual machines.
* **Firewall/Router:** pfSense handling edge routing, DHCP, interface segmentation, and custom firewall rules.
* **Directory Services:** Windows Server 2025 Active Directory Domain Controller (`HOME.HQ`).
* **Scripting & Automation:** Python (system administration utilities, disk space monitoring, and validation tools) & PowerShell.

---

## 💻 Projects & Labs

### 1. Active Directory Setup & Recovery Win
* Set up a complete Active Directory domain from scratch, mapping out an enterprise-style OU hierarchy, managing test user accounts, and configuring GPOs for security policies.
* **Disaster Recovery:** Ran into a lockout scenario when my main account was accidentally disabled. Instead of just wiping the VM and losing my progress, I booted into the Windows installation environment via VMware to access the offline system files. I used a trick to temporarily swap the utility manager with `cmd.exe` to get system-level command line access right at the login screen, flipped the account back to enabled using Active Directory Users and Computers, and then used PowerShell (`takeown` and `icacls`) to securely restore the original files and patch the loophole.

### 2. PowerShell Automation
* Built a custom PowerShell script to automate cleaning up stale user accounts in the domain.
* **AD-StaleAccountAuditor:** The script automatically queries specific OUs for accounts that haven't logged in for a set number of days, disables them to minimize the attack surface, and moves them into a dedicated "Stale Accounts" holding OU.

### 3. pfSense Networking & DNS
* Configured multiple virtual interfaces inside pfSense to route and isolate traffic properly across the lab.
* Hardened internal name resolution by setting up custom DNS forwarders, reverse lookup zones, and conditional forwarders to keep everything communicating perfectly.

### 4. Python System Administration & Automation
* **Toolkit Development:** Built modular Python scripts in PyCharm focused on practical IT and system administration tasks.
* **Disk Space Alert Generator:** Developed a monitoring script that checks available disk capacity against a defined threshold and triggers automated warnings to prevent storage exhaustion.
* **Input Validation & Utilities:** Engineered robust command-line validation tools and interactive countdown timers to practice secure user input handling and exception management.

### 5. Linux & Network Segmentation Labs
* **VLAN Configuration & Routing:** Configured isolated network segments (including dedicated IoT VLANs) inside virtual lab environments to restrict broadcast domains and enforce security boundaries.
* **DHCP & Firewall Policies:** Implemented custom DHCP server pools and granular firewall rules to control inter-VLAN traffic and harden the lab's perimeter.

---

## 📁 Repo Folders
* [./Scripts](./Scripts/AD-StaleAccountAuditor.ps1) - My custom PowerShell automation scripts.
* [./Python](./Python) - Custom Python system administration scripts and automation tools.
* [./Documentation](./Documentation/Network-Topology.md) - Detailed network blueprints, topology diagrams, and configuration logs.
