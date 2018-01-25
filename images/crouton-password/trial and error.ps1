$JobBlock = {
    $ExpiryTime = Get-ADUser $env:USERNAME -Properties 'msDS-UserPasswordExpiryTimeComputed'
    $Expiry = [datetime]::FromFileTime($ExpiryTime.'msDS-UserPasswordExpiryTimeComputed')
    $TimeToGo = New-TimeSpan -Start (Get-Date) -End $Expiry
    
    
    if ($TimeToGo -le 3) {
        if ($TimeToGo.Days -gt 0) {
            $Count = $TimeToGo.Days
            $Unit = 'Days'
        } else {
            $Count = $TimeToGo.Hours
            $Unit = 'Hours'
        }
        
        New-BurntToastNotification -Sound Alarm10 `
            -Text 'Your password is close to expiring!',
                  "Please change your password soon, it will expire in $Count $Unit.",
                  'You can change it any time by pressing CTRL + ALT + DEL and choosing "Change a password."'
    }
}

$JobTrigger = New-JobTrigger -Once `
                             -At "01:00" `
                             -RepeatIndefinitely `
                             -RepetitionInterval (New-TimeSpan -Minutes 90)

$JobOptions = New-ScheduledJobOption -RequireNetwork

Register-ScheduledJob -Name 'Password Expiry Reminder' `
                      -ScriptBlock { $JobBlock } `
                      -Trigger $JobTrigger `
                      -ScheduledJobOption $JobOptions

$Principal = New-ScheduledTaskPrincipal -LogonType Interactive -UserId $ENV:USERNAME

Set-ScheduledTask -Principal $Principal ` 
                  -TaskPath '\Microsoft\Windows\PowerShell\ScheduledJobs\' `
                  -TaskName 'Password Expiry Reminder'