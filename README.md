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

  <!-- Title -->
  <text x="600" y="46" text-anchor="middle" font-size="26" font-weight="bold" fill="#1F3864">Small-Office IT Helpdesk Lab</text>
  <text x="600" y="74" text-anchor="middle" font-size="15" fill="#555555">Windows domain lab.local on an isolated virtual network</text>

  <!-- Host boundary -->
  <rect x="40" y="96" width="1120" height="650" rx="14" fill="#fafbfd" stroke="#9aa5b8" stroke-width="2" stroke-dasharray="8 6"/>
  <text x="62" y="124" font-size="14" font-weight="bold" fill="#6b7585">Host PC (VMware Workstation)</text>

  <!-- Active Directory info box -->
  <rect x="70" y="150" width="300" height="140" rx="10" fill="#eef2f9" stroke="#1F3864" stroke-width="1.5"/>
  <text x="220" y="176" text-anchor="middle" font-size="15" font-weight="bold" fill="#1F3864">Active Directory (lab.local)</text>
  <text x="90" y="202" font-size="13" fill="#333333">OUs: LabUsers &gt; Sales, HR, IT</text>
  <text x="90" y="224" font-size="13" fill="#333333">Groups: GG-Sales, GG-HR, GG-IT</text>
  <text x="90" y="246" font-size="13" fill="#333333">Users: akhan (Sales), skhan (HR)</text>
  <text x="90" y="268" font-size="13" fill="#333333">Policies: lockout, S: drive, P: drive</text>
  <line x1="370" y1="220" x2="420" y2="220" stroke="#1F3864" stroke-width="2" stroke-dasharray="4 4"/>

  <!-- File shares info box -->
  <rect x="830" y="150" width="300" height="140" rx="10" fill="#eef2f9" stroke="#1F3864" stroke-width="1.5"/>
  <text x="980" y="176" text-anchor="middle" font-size="15" font-weight="bold" fill="#1F3864">File shares on DC01</text>
  <text x="850" y="204" font-size="13" fill="#333333">\\DC01\Sales : Sales group (S:)</text>
  <text x="850" y="228" font-size="13" fill="#333333">\\DC01\HR : HR group only</text>
  <text x="850" y="252" font-size="13" fill="#333333">\\DC01\Public : all users, read (P:)</text>
  <line x1="780" y1="220" x2="830" y2="220" stroke="#1F3864" stroke-width="2" stroke-dasharray="4 4"/>

  <!-- DC01 -->
  <rect x="420" y="150" width="360" height="150" rx="12" fill="#1F3864"/>
  <text x="600" y="186" text-anchor="middle" font-size="24" font-weight="bold" fill="#ffffff">DC01</text>
  <text x="600" y="212" text-anchor="middle" font-size="14" fill="#dbe5f5">Windows Server 2022</text>
  <text x="600" y="236" text-anchor="middle" font-size="14" font-weight="bold" fill="#ffffff">192.168.50.10 (static)</text>
  <text x="600" y="260" text-anchor="middle" font-size="13" fill="#dbe5f5">AD DS · DNS · DHCP · File shares</text>
  <text x="600" y="282" text-anchor="middle" font-size="13" fill="#dbe5f5">Domain controller</text>

  <!-- Link DC01 to switch -->
  <line x1="600" y1="300" x2="600" y2="372" stroke="#1F3864" stroke-width="3"/>

  <!-- Network bar -->
  <rect x="100" y="372" width="1000" height="46" rx="23" fill="#dfe7f5" stroke="#1F3864" stroke-width="2"/>
  <text x="600" y="391" text-anchor="middle" font-size="15" font-weight="bold" fill="#1F3864">LabNet (VMware LAN Segment): 192.168.50.0/24</text>
  <text x="600" y="409" text-anchor="middle" font-size="12" fill="#444444">DHCP pool 192.168.50.100 to 192.168.50.150 · DNS server 192.168.50.10</text>

  <!-- Links to clients -->
  <line x1="210" y1="418" x2="210" y2="500" stroke="#1F3864" stroke-width="3"/>
  <line x1="470" y1="418" x2="470" y2="500" stroke="#1F3864" stroke-width="3"/>
  <line x1="730" y1="418" x2="730" y2="500" stroke="#1F3864" stroke-width="3"/>
  <line x1="990" y1="418" x2="990" y2="500" stroke="#1F3864" stroke-width="3"/>

  <!-- CLIENT01 -->
  <rect x="95" y="500" width="230" height="180" rx="12" fill="#2E75B6"/>
  <text x="210" y="534" text-anchor="middle" font-size="22" font-weight="bold" fill="#ffffff">CLIENT01</text>
  <text x="210" y="560" text-anchor="middle" font-size="13" fill="#e4effa">Windows 10 (domain-joined)</text>
  <text x="210" y="586" text-anchor="middle" font-size="13" font-weight="bold" fill="#ffffff">DHCP: 192.168.50.100+</text>
  <text x="210" y="612" text-anchor="middle" font-size="12" fill="#e4effa">Logins: akhan, skhan</text>
  <text x="210" y="634" text-anchor="middle" font-size="12" fill="#e4effa">Drives: S: Sales, P: Public</text>
  <text x="210" y="656" text-anchor="middle" font-size="12" fill="#e4effa">Role: end-user PC</text>

  <!-- UBUNTU01 -->
  <rect x="355" y="500" width="230" height="180" rx="12" fill="#B8470F"/>
  <text x="470" y="534" text-anchor="middle" font-size="22" font-weight="bold" fill="#ffffff">UBUNTU01</text>
  <text x="470" y="560" text-anchor="middle" font-size="13" fill="#fbe9df">Ubuntu Desktop</text>
  <text x="470" y="586" text-anchor="middle" font-size="13" font-weight="bold" fill="#ffffff">DHCP: 192.168.50.x</text>
  <text x="470" y="612" text-anchor="middle" font-size="12" fill="#fbe9df">Role: Linux client</text>
  <text x="470" y="634" text-anchor="middle" font-size="12" fill="#fbe9df">DNS lookups against DC01</text>

  <!-- GLPI01 (planned) -->
  <rect x="615" y="500" width="230" height="180" rx="12" fill="#ffffff" stroke="#1F3864" stroke-width="2.5" stroke-dasharray="8 5"/>
  <text x="730" y="534" text-anchor="middle" font-size="22" font-weight="bold" fill="#1F3864">GLPI01</text>
  <text x="730" y="560" text-anchor="middle" font-size="13" fill="#444444">Ubuntu Server</text>
  <text x="730" y="586" text-anchor="middle" font-size="13" font-weight="bold" fill="#1F3864">192.168.50.20 (static)</text>
  <text x="730" y="612" text-anchor="middle" font-size="12" fill="#444444">Role: helpdesk ticketing</text>
  <text x="730" y="634" text-anchor="middle" font-size="12" fill="#444444">GLPI + Apache + MariaDB</text>
  <text x="730" y="658" text-anchor="middle" font-size="11" font-style="italic" fill="#888888">(dashed = planned)</text>

  <!-- KALI01 -->
  <rect x="875" y="500" width="230" height="180" rx="12" fill="#2B2D42"/>
  <text x="990" y="534" text-anchor="middle" font-size="22" font-weight="bold" fill="#ffffff">KALI01</text>
  <text x="990" y="560" text-anchor="middle" font-size="13" fill="#d9dbea">Kali Linux 26.1</text>
  <text x="990" y="586" text-anchor="middle" font-size="13" font-weight="bold" fill="#ffffff">DHCP: 192.168.50.x</text>
  <text x="990" y="612" text-anchor="middle" font-size="12" fill="#d9dbea">Role: security testing</text>
  <text x="990" y="634" text-anchor="middle" font-size="12" fill="#d9dbea">(optional machine)</text>

  <!-- Legend -->
  <text x="62" y="720" font-size="12" fill="#6b7585">Solid line = connected to LabNet · Dotted line = service detail · Dashed box = planned machine</text>
  <text x="62" y="738" font-size="12" fill="#6b7585">Replace "x" with the address each VM shows in ipconfig / ip a.</text>
</svg>

