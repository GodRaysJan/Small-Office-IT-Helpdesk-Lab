# Ticket T-009: Domain Authentication Clock Skew

- **Ticket ID**: T-009
- **Requester**: Alex Turner (`aturner`)
- **Category**: Account and Access
- **Priority**: High
- **Status**: Closed

## User Reported Symptom
"Domain login fails with error: 'An primary authentication error occurred due to clock skew'."

## Diagnostic Steps
1. Evaluated system clock on CLIENT01 vs DC01. Client clock was skewed by +15 minutes.
2. Checked Windows Time service status:
   ```cmd
   w32tm /query /status
