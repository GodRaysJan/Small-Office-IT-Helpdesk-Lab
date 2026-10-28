
# SOP: New Starter Account Provisioning

## Pre-requisites
- Approved HR Onboarding Request ticket containing Full Name, Department, and Start Date.

## Provisioning Steps (PowerShell)
Execute on DC01:

```powershell
$FirstName = "John"
$LastName = "Doe"
$Username = "jdoe"
$OU = "OU=Sales,DC=lab,DC=local"
$Group = "GG-Sales"
$TempPassword = ConvertTo-SecureString "Welcome123!" -AsPlainText -Force

# 1. Create User
New-ADUser -Name "$FirstName$LastName" `
           -GivenName $FirstName `
           -Surname $LastName `
           -SamAccountName $Username `
           -UserPrincipalName "$Username@lab.local" `
           -Path $OU `
           -AccountPassword $TempPassword `
           -ChangePasswordAtLogon $true `
           -Enabled $true

# 2. Assign Security Group
Add-ADGroupMember -Identity $Group -Members$Username
