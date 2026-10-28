Post-Provisioning Validation

1)Log into CLIENT01 as LAB\jdoe.

2)Verify requirement to update initial password.

3)Open File Explorer and confirm mapped network drive (S:\) is available.

# SOP: Employee Offboarding Workflow

## Procedure

### 1. Disable User Account
Execute on DC01:
```powershell
Disable-ADAccount -Identity "<SamAccountName>"
