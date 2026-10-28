# Ticket T-012: Employee Offboarding Task

- **Ticket ID**: T-012
- **Requester**: HR Department
- **Category**: Account and Access
- **Priority**: High
- **Status**: Closed

## User Reported Task
"Employee John Doe (jdoe) has departed the company today. Execute account offboarding immediately."

## Diagnostic & Execution
1. Followed standard offboarding SOP ([docs/runbooks/user-offboarding.md](docs/runbooks/user-offboarding.md)).
2. Ran PowerShell offboarding commands on DC01:
   ```powershell
   Disable-ADAccount -Identity "jdoe"
   Get-ADUser -Identity "jdoe" -Properties MemberOf | Select-Object -ExpandProperty MemberOf | Remove-ADGroupMember -Members "jdoe" -Confirm:$false
   Get-ADUser -Identity "jdoe" | Move-ADObject -TargetPath "OU=Disabled Users,DC=lab,DC=local"
