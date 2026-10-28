# Ticket T-010: Workstation Performance Degradation

- **Ticket ID**: T-010
- **Requester**: Alex Turner (`aturner`)
- **Category**: Hardware
- **Priority**: Medium
- **Status**: Closed

## User Reported Symptom
"My computer is extremely slow and applications fail to launch."

## Diagnostic Steps
1. Checked running processes and system resources via PowerShell:
   ```powershell
   Get-Process | Sort-Object CPU -Descending | Select-Object -First 5
   Get-PSDrive C
