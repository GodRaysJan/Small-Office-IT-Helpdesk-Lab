# Active Directory User and Group Provisioning Script
# Target Domain: lab.local

Import-Module ActiveDirectory

# Define OUs
$OUs = @(
    "OU=Sales,DC=lab,DC=local",
    "OU=HR,DC=lab,DC=local",
    "OU=Disabled Users,DC=lab,DC=local"
)

foreach ($OU in $OUs) {
    if (-not (Name -eq ($OU -split ',')[0] -replace 'OU=')) {
        $OUName = ($OU -split ',')[0] -replace 'OU='
        New-ADOrganizationalUnit -Name $OUName -Path "DC=lab,DC=local" -ErrorAction SilentlyContinue
    }
}

# Define Security Groups
$Groups = @("GG-Sales", "GG-HR")

foreach ($Group in $Groups) {
    if (-not (Get-ADGroup -Filter "Name -eq '$Group'")) {
        New-ADGroup -Name $Group -GroupScope Global -GroupCategory Security -Path "CN=Users,DC=lab,DC=local"
    }
}

Write-Host "Active Directory base structure verified successfully." -ForegroundColor Green
