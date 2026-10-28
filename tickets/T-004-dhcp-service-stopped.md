# Ticket T-004: Network Unreachable (DHCP Failure)

- **Ticket ID**: T-004
- **Requester**: Alex Turner (`aturner`)
- **Category**: Network
- **Priority**: High
- **Status**: Closed

## User Reported Symptom
"No network connectivity, cannot reach internal sites or internet."

## Diagnostic Steps
1. Ran `ipconfig /all` on CLIENT01.
2. Identified APIPA address (`169.254.x.x`), indicating client failed to obtain DHCP lease.
3. Checked DHCP Server service status on DC01:
   ```powershell
   Get-Service -Name DHCPServer
