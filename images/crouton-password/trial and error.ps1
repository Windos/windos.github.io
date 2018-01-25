$Date = Get-ADUser $env:USERNAME -Properties 'msDS-UserPasswordExpiryTimeComputed' | select -ExpandProperty 'msDS-UserPasswordExpiryTimeComputed'
[datetime]::FromFileTime($date)
$Expire = [datetime]::FromFileTime($date)
$now = get-date
New-TimeSpan -Start $now -End $expire


[datetime]::FromFileTime((Get-ADUser $env:USERNAME -Properties 'msDS-UserPasswordExpiryTimeComputed').'msDS-UserPasswordExpiryTimeComputed')