# Ticket T-007: Mapped Network Drive Missing

- **Ticket ID**: T-007
- **Requester**: Alex Turner (`aturner`)
- **Category**: Software
- **Priority**: Medium
- **Status**: Closed

## User Reported Symptom
"My S: drive (Sales Share) has disappeared from File Explorer."

## Diagnostic Steps
1. Checked applied Group Policy Objects on CLIENT01:
   ```cmd
   gpresult /r
