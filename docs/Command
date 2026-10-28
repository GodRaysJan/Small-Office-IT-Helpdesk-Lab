Identify Lockout Source (Event ID 4740) 

Search Security Event Logs on DC01:

`Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4740} | Select-Object TimeCreated, Message`

Account Remediation : Unlock Account

`Unlock-ADAccount -Identity "<SamAccountName>"`

Reset Password & Force Change:

`Set-ADAccountPassword -Identity "<SamAccountName>" -NewPassword (ConvertTo-SecureString "<TempPassword>" -AsPlainText -Force)
Set-ADUser -Identity "<SamAccountName>" -ChangePasswordAtLogon $true`

Remove Security Group Memberships

Strip all group memberships except Domain Users:

`Get-ADUser -Identity "<SamAccountName>" -Properties MemberOf | 
Select-Object -ExpandProperty MemberOf | 
Remove-ADGroupMember -Members "<SamAccountName>" -Confirm:$false`

Relocate Account Object

Move account to the Disabled Users OU for compliance auditing

`Get-ADUser -Identity "<SamAccountName>" | Move-ADObject -TargetPath "OU=Disabled Users,DC=lab,DC=local"`

Session Termination

Force disconnect active client sessions and purge Kerberos tickets:

`klist purge`
