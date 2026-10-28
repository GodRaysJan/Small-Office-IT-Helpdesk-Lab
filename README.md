# Small-Office-IT-Helpdesk-Lab

## Overview
This repository documents a fully functional Tier 1/2 IT Support virtualized environment simulating a mid-sized corporate network. The project models real-world enterprise infrastructure including Active Directory, Group Policy, DNS, DHCP, and an ITIL-compliant ticket management lifecycle using GLPI.

The primary focus of this lab is hands-on incident response following a strict **"Log First, Fix Later"** protocol to emulate operational helpdesk workflows.

## Infrastructure Topology
- **DC01 (Windows Server 2022)**: Active Directory Domain Controller (`lab.local`), DNS Server, DHCP Server, Group Policy Management.
- **CLIENT01 (Windows 10/11 Enterprise)**: Domain-joined endpoint for end-user operations, testing GPOs, and issue replication.
- **GLPI01 (Ubuntu Server 22.04 LTS)**: Web-based ticketing system running Apache, MariaDB, and PHP.

## Network Subnet Allocation
- **Subnet**: `192.168.50.0/24`
- **Gateway**: `192.168.50.1`
- **Domain**: `lab.local`

For complete IP mapping, view [docs/ip-plan.md](docs/ip-plan.md).

## Key Skills Demonstrated
- Active Directory Administration & PowerShell Automation (`ActiveDirectory` module).
- Network Protocol Troubleshooting (DNS, DHCP, TCP/IP routing).
- Group Policy Object (GPO) deployment and client side processing (`gpupdate`, `gpresult`).
- Helpdesk Management using ITIL categories, priority matrices, and ticket lifecycles in GLPI.
- Incident Root Cause Analysis (RCA) and Standard Operating Procedure (SOP) documentation.

## Lab Execution Protocol
Every scenario followed a strict 5-stage lifecycle:
1. **Trigger Fault**: Simulate user error or infrastructure failure.
2. **Log Ticket**: Capture user-reported symptoms in GLPI prior to troubleshooting.
3. **Diagnose**: Identify root cause via CLI utilities (`ipconfig`, `nslookup`, `w32tm`, Event Viewer).
4. **Remediate**: Apply administrative fixes via PowerShell, MMC, or Netplan.
5. **Verify & Close**: Validate client resolution and close ticket with RCA notes.

## Network Diagram
<img width="1200" height="780" alt="network-diagram" src="https://github.com/user-attachments/assets/55ccd819-3034-4788-b0c2-601450c48379" />
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 780" width="1200" height="780" font-family="DejaVu Sans, Arial, Helvetica, sans-serif">
  <rect width="1200" height="780" fill="#ffffff"/>

 
</svg>

