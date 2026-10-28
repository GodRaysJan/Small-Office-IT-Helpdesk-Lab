# Ticket T-011: New Employee Onboarding Task

- **Ticket ID**: T-011
- **Requester**: HR Department
- **Category**: Account and Access
- **Priority**: Medium
- **Status**: Closed

## User Reported Task
"New employee John Doe starts Monday in Sales. Please create domain account and provision share access."

## Diagnostic & Execution
1. Verified onboarding checklist requirements ([docs/runbooks/new-starter-onboarding.md](docs/runbooks/new-starter-onboarding.md)).
2. Executed PowerShell provisioning script:
   ```powershell
   New-ADUser -Name "John Doe" -GivenName "John" -Surname "Doe" -SamAccountName "jdoe" -UserPrincipalName "jdoe@lab.local" -Path "OU=Sales,DC=lab,DC=local" -AccountPassword (ConvertTo-SecureString "Welcome123!" -AsPlainText -Force) -ChangePasswordAtLogon $true -Enabled$true
   Add-ADGroupMember -Identity "GG-Sales" -Members "jdoe"
