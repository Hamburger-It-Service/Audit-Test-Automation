﻿[AuditTest] @{
    Id = "1.1.1"
    Task = "(L1) Ensure 'Enforce password history' is set to '24 or more password(s)'"
    Test = {
        $securityPolicy = Get-AuditResource "WindowsSecurityPolicy"
        $setPolicy = $securityPolicy['System Access']["PasswordHistorySize"]
        
        if ($null -eq $setPolicy) {
            return @{
                Message = "Currently not set."
                Status = "False"
            }
        }
        if (($setPolicy -lt 24)) {
            return @{
                Message = "'PasswordHistorySize' currently set to: $setPolicy. Expected: x >= 24"
                Status = "False"
            }
        }
        
        return @{
            Message = "Compliant"
            Status = "True"
        }
    }
}
[AuditTest] @{
    Id = "1.1.2"
    Task = "(L1) Ensure 'Maximum password age' is set to '60 or fewer days, but not 0'"
    Test = {
        $securityPolicy = Get-AuditResource "WindowsSecurityPolicy"
        $setPolicy = $securityPolicy['System Access']["MaximumPasswordAge"]
        
        if ($null -eq $setPolicy) {
            return @{
                Message = "Currently not set."
                Status = "False"
            }
        }
        if (($setPolicy -gt 5184000 -or $setPolicy -le 0)) {
            return @{
                Message = "'MaximumPasswordAge' currently set to: $setPolicy. Expected: x <= 5184000 and x > 0"
                Status = "False"
            }
        }
        
        return @{
            Message = "Compliant"
            Status = "True"
        }
    }
}
[AuditTest] @{
    Id = "1.1.3"
    Task = "(L1) Ensure 'Minimum password age' is set to '1 or more day(s)'"
    Test = {
        $securityPolicy = Get-AuditResource "WindowsSecurityPolicy"
        $setPolicy = $securityPolicy['System Access']["MinimumPasswordAge"]
        
        if ($null -eq $setPolicy) {
            return @{
                Message = "Currently not set."
                Status = "False"
            }
        }
        if (($setPolicy -lt 86400)) {
            return @{
                Message = "'MinimumPasswordAge' currently set to: $setPolicy. Expected: x >= 86400"
                Status = "False"
            }
        }
        
        return @{
            Message = "Compliant"
            Status = "True"
        }
    }
}
[AuditTest] @{
    Id = "1.1.4"
    Task = "(L1) Ensure 'Minimum password length' is set to '14 or more character(s)'"
    Test = {
        $securityPolicy = Get-AuditResource "WindowsSecurityPolicy"
        $setPolicy = $securityPolicy['System Access']["MinimumPasswordLength"]
        
        if ($null -eq $setPolicy) {
            return @{
                Message = "Currently not set."
                Status = "False"
            }
        }
        if (($setPolicy -lt 14)) {
            return @{
                Message = "'MinimumPasswordLength' currently set to: $setPolicy. Expected: x >= 14"
                Status = "False"
            }
        }
        
        return @{
            Message = "Compliant"
            Status = "True"
        }
    }
}
[AuditTest] @{
    Id = "1.1.5"
    Task = "(L1) Ensure 'Password must meet complexity requirements' is set to 'Enabled'"
    Test = {
        $securityPolicy = Get-AuditResource "WindowsSecurityPolicy"
        $setPolicy = $securityPolicy['System Access']["PasswordComplexity"]
        
        if ($null -eq $setPolicy) {
            return @{
                Message = "Currently not set."
                Status = "False"
            }
        }
        if ($setPolicy -ne $True) {
            return @{
                Message = "'PasswordComplexity' currently set to: $setPolicy. Expected: True"
                Status = "False"
            }
        }
        
        return @{
            Message = "Compliant"
            Status = "True"
        }
    }
}
[AuditTest] @{
    Id = "1.1.6"
    Task = "(L1) Ensure 'Store passwords using reversible encryption' is set to 'Disabled'"
    Test = {
        $securityPolicy = Get-AuditResource "WindowsSecurityPolicy"
        $setPolicy = $securityPolicy['System Access']["ClearTextPassword"]
        
        if ($null -eq $setPolicy) {
            return @{
                Message = "Currently not set."
                Status = "False"
            }
        }
        if ($setPolicy -ne $False) {
            return @{
                Message = "'ClearTextPassword' currently set to: $setPolicy. Expected: False"
                Status = "False"
            }
        }
        
        return @{
            Message = "Compliant"
            Status = "True"
        }
    }
}
[AuditTest] @{
    Id = "1.2.1"
    Task = "(L1) Ensure 'Account lockout duration' is set to '15 or more minute(s)'"
    Test = {
        $securityPolicy = Get-AuditResource "WindowsSecurityPolicy"
        $setPolicy = $securityPolicy['System Access']["LockoutDuration"]
        
        if ($null -eq $setPolicy) {
            return @{
                Message = "Currently not set."
                Status = "False"
            }
        }
        if (($setPolicy -lt 900)) {
            return @{
                Message = "'LockoutDuration' currently set to: $setPolicy. Expected: x >= 900"
                Status = "False"
            }
        }
        
        return @{
            Message = "Compliant"
            Status = "True"
        }
    }
}
[AuditTest] @{
    Id = "1.2.2"
    Task = "(L1) Ensure 'Account lockout threshold' is set to '10 or fewer invalid logon attempt(s), but not 0'"
    Test = {
        $securityPolicy = Get-AuditResource "WindowsSecurityPolicy"
        $setPolicy = $securityPolicy['System Access']["LockoutBadCount"]
        
        if ($null -eq $setPolicy) {
            return @{
                Message = "Currently not set."
                Status = "False"
            }
        }
        if (($setPolicy -gt 10 -or $setPolicy -le 0)) {
            return @{
                Message = "'LockoutBadCount' currently set to: $setPolicy. Expected: x <= 10 and x > 0"
                Status = "False"
            }
        }
        
        return @{
            Message = "Compliant"
            Status = "True"
        }
    }
}
[AuditTest] @{
    Id = "1.2.3"
    Task = "(L1) Ensure 'Reset account lockout counter after' is set to '15 or more minute(s)'"
    Test = {
        $securityPolicy = Get-AuditResource "WindowsSecurityPolicy"
        $setPolicy = $securityPolicy['System Access']["ResetLockoutCount"]
        
        if ($null -eq $setPolicy) {
            return @{
                Message = "Currently not set."
                Status = "False"
            }
        }
        if (($setPolicy -lt 900)) {
            return @{
                Message = "'ResetLockoutCount' currently set to: $setPolicy. Expected: x >= 900"
                Status = "False"
            }
        }
        
        return @{
            Message = "Compliant"
            Status = "True"
        }
    }
}
