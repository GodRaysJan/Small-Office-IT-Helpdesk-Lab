# Ticket T-001: Password Reset Request

- **Ticket ID**: T-001
- **Requester**: Jane Smith (`jsmith`)
- **Category**: Account and Access
- **Priority**: Medium
- **Status**: Closed

## User Reported Symptom
"I forgot my domain password and cannot log into my workstation."

## Diagnostic Steps
1. Verified user identity following verification protocol.
2. Checked account state on DC01 via PowerShell:
   ```powershell
   Get-ADUser -Identity "jsmith" -Properties LockedOut, Enabled
