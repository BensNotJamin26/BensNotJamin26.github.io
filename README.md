# Ben's Technical Portfolio & Enterprise Homelab

Welcome to my hands-on systems and network engineering portfolio. This live lab environment serves as a sandboxed testing ground for deploying, securing, and automating enterprise-grade infrastructure.

## 🛠️ Infrastructure Overview
* **Hypervisor:** VMware Workstation Pro hosting virtualized core services.
* **Next-Gen Firewall:** pfSense handling edge routing, DHCP, custom network interfaces, and firewall rule enforcement.
* **Directory Services:** Windows Server 2025 Active Directory Domain Controller (`HOME.HQ`).

---

## 💻 Core Projects

### 1. Active Directory Infrastructure & Identity Management
* Designed and implemented a scalable Organizational Unit (OU) hierarchy to handle enterprise users, groups, and computer objects.
* Configured Group Policy Objects (GPOs) to enforce local security baselines and account password policies.
* **Disaster Recovery:** Successfully executed emergency offline recovery procedures on a disabled domain controller via ISO-booted command environments, restoring system integrity while ensuring strict post-incident cleanup.

### 2. PowerShell Automation
* Developed custom PowerShell tools to automate administrative lifecycle management.
* *Project Featured:* **AD-StaleAccountAuditor** — A script that dynamically queries Active Directory to audit, disable, and relocate inactive user accounts across specified OUs to reduce attack surface.

### 3. Network Architecture & Security
* Configured multi-interface routing paths within pfSense to isolate user traffic from core management zones.
* Optimized domain-wide internal name resolution by configuring robust DNS forwarders, reverse lookup zones, and conditional forwarders.

---

## 🗂️ Repository Structure
* `/Scripts` - Production-ready PowerShell scripts for AD management.
* `/Documentation` - Detailed network diagrams, topology layouts, and configuration files.
