# SOP: Account Lockout and Password Reset

## Procedure

### 1. Identify Lockout Status
Execute on Domain Controller (DC01):
```powershell
Search-ADAccount -LockedOut | Select-Object Name, SamAccountName, LastBadPasswordAttempt
