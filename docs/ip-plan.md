# Network IP Plan & Infrastructure Mapping

| Hostname | Operating System | Primary Role | IP Address | Subnet Mask | Preferred DNS | Gateway |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **DC01** | Windows Server 2022 | AD DS, DNS, DHCP | `192.168.50.10` | `255.255.255.0` | `127.0.0.1` | `192.168.50.1` |
| **GLPI01** | Ubuntu 22.04 LTS | GLPI Service, Web Stack | `192.168.50.20` | `255.255.255.0` | `192.168.50.10` | `192.168.50.1` |
| **CLIENT01** | Windows 10/11 Pro | Domain Client | DHCP (`192.168.50.100+`) | `255.255.255.0` | `192.168.50.10` | `192.168.50.1` |
| **Router/GW**| Virtual Switch | Gateway Interface | `192.168.50.1` | `255.255.255.0` | N/A | N/A |

## Active Directory Organizational Units (OUs) & Groups
- `OU=Sales,DC=lab,DC=local`
  - Group: `GG-Sales` (Grants access to `\\DC01\Sales` SMB share mapped to `S:\`)
- `OU=HR,DC=lab,DC=local`
  - Group: `GG-HR` (Grants access to `\\DC01\HR` SMB share)
- `OU=Disabled Users,DC=lab,DC=local`
  - Staging container for offboarded user accounts with stripped privileges.
