# Ticket T-008: Hostname Resolution Failure

- **Ticket ID**: T-008
- **Requester**: Alex Turner (`aturner`)
- **Category**: Network
- **Priority**: High
- **Status**: Closed

## User Reported Symptom
"Cannot open \\DC01\Sales by hostname, but works when typing IP address."

## Diagnostic Steps
1. Executed DNS lookup:
   ```cmd
   nslookup dc01.lab.local
