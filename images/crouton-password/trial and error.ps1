[10] PS C:\> $Date = Get-ADUser $env:USERNAME -Properties 'msDS-UserPasswordExpiryTimeComputed' | select -ExpandProperty
 'msDS-UserPasswordExpiryTimeComputed'

[11] PS C:\> [datetime]::FromFileTime($date)

Thursday, 8 February 2018 3:41:21 p.m.



[12] PS C:\> $Expire = [datetime]::FromFileTime($date)

[13] PS C:\> $now = get-date

[14] PS C:\> New-TimeSpan -Start $now -End $expire


Days              : 14
Hours             : 2
Minutes           : 24
Seconds           : 16
Milliseconds      : 887
Ticks             : 12182568874835
TotalDays         : 14.100195456985
TotalHours        : 338.404690967639
TotalMinutes      : 20304.2814580583
TotalSeconds      : 1218256.8874835
TotalMilliseconds : 1218256887.4835




[15] PS C:\>