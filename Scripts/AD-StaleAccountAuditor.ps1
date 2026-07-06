<#
.SYNOPSIS
    Audits and manages inactive user accounts within Active Directory.
.DESCRIPTION
    Queries a specified OU for user accounts that haven't logged in for a set number of days, 
    disables them, and moves them to a designated "Stale Accounts" container for security.
#>

# --- Configuration Variables ---
$DaysInactive = 90
$TargetOU = "OU=Employees,DC=HOME,DC=HQ"
$StaleOU  = "OU=Stale Accounts,DC=HOME,DC=HQ"
$CutoffDate = (Get-Date).AddDays(-$DaysInactive)

Write-Host "Starting Active Directory stale account audit (Older than $DaysInactive days)..." -ForegroundColor Cyan

# 1. Query for inactive users
$InactiveUsers = Get-ADUser -Filter {Enabled -eq $true} -SearchBase $TargetOU -Properties LastLogonDate | 
    Where-Object { $_.LastLogonDate -lt $CutoffDate -and $_.LastLogonDate -ne $null }

if ($InactiveUsers.Count -eq 0) {
    Write-Host "No stale user accounts found." -ForegroundColor Green
    Exit
}

Write-Host "Found $($InactiveUsers.Count) stale account(s). Proceeding with remediation..." -ForegroundColor Yellow

# 2. Process each stale account
foreach ($User in $InactiveUsers) {
    Write-Host "Processing: $($User.SamAccountName) (Last Login: $($User.LastLogonDate))" -ForegroundColor White
    
    try {
        # Disable the account to mitigate attack surface
        Disable-ADAccount -Identity $User.SamAccountName -Confirm:$false
        Write-Host " -> Disabled successfully." -ForegroundColor Yellow
        
        # Relocate user to a secure holding OU
        Move-ADObject -Identity $User.DistinguishedName -TargetPath $StaleOU
        Write-Host " -> Relocated to Stale Accounts OU." -ForegroundColor Green
    }
    catch {
        Write-Error "Failed to process user $($User.SamAccountName): $_"
    }
}

Write-Host "Audit and remediation cycle complete." -ForegroundColor Cyan
