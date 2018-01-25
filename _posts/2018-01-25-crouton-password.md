---
layout: post
title: "Crouton #5 – Password Expiry Warning"
excerpt: "How the heck did that happen, isn't the system meant to give me some warning?"
modified: 2018-01-25
date: 2018-01-25
tags: [powershell, crouton, burnttoast]
comments: true
image:
 thumb: /crouton-password/thumb.jpg
 credit: Max Pixel (http://maxpixel.freegreatpicture.com)
 creditlink: http://maxpixel.freegreatpicture.com/Duerer-Bread-Miniature-Figures-Advent-3010349
---

"Something is wrong with my computer. Outlook is asking me for my password?!"

"Let me look… Oh, it looks like your password expired about 15 minutes ago."

"How the heck did that happen, isn't the system meant to give me some warning?"

### Invisible Expiry Reminders

I don't often get these calls personally any more, but I do overhear them.
There's no point trying to tell your user that the 'system' did warn them (for
three days by default).

I imagine those warnings are probably something like website ads: Invisible.

They are popping up; the user just didn't process them into something that needs
to be actioned.

To be fair, these notifications in Windows 7 are pathetic:

[![Password Reminder - Win7](/images/crouton-password/win7.png)](/images/crouton-password/win7.png)

Windows 10 switched to toasts and they are a step up, but I think we can do
better:

[![Password Reminder - Win10](/images/crouton-password/win10.jpg)](/images/crouton-password/win10.jpg)

*Note: I don't know what the situation was like in Windows 8/8.1, I don't
remember every joining that OS to a domain.*

### Get to the Point!

Right, I haven't actually stated what the point of this post is.

Let's create our own toast notifications to remind our users that their
passwords are about to expire. We'll make these toasts as hard to ignore as
possible, they'll only be effective if they're actually seen.

Given that we're using toasts, via the
[BurntToast](powershellgallery.com/packages/BurntToast) module, this only
applies to Windows 10.

Also, the client will need the Active Directory PowerShell module on the system.
How you achieve this is up to your… this is meant to be more of a fun "hey look
what we can do" type exercise that a complete recipe to fix an issue.

Finally, be warned that the examples here include backtick in order to keep the
snippets narrow. Keep an eye out if you're copy/pasting.

### Getting into the Code

Alright, enough jabber, time for the code.

We start by figuring out how long it is until the current user's password is
from expiring. We get this from the computed expiry time property on their AD
object, and create a timespan between 'now' and 'then':

```powershell
$ExpiryTime = Get-ADUser $env:USERNAME -Properties 'msDS-UserPasswordExpiryTimeComputed'
$Expiry = [datetime]::FromFileTime($ExpiryTime.'msDS-UserPasswordExpiryTimeComputed')
$TimeToGo = New-TimeSpan -Start (Get-Date) -End $Expiry
```

We only want to show our toast if we're inside a three-day window of the expiry
time, so let's test for that. Then we populate some variables for use within the
toast's text.

Finally, we generate the toast!

```powershell
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
```
Right, we've now got code that can be run on-demand, but that won't do! Let's
get this going on a schedule.

Imagine you've wrapped all of the previous code up as a ScriptBlock and then
create a Job Trigger and Job Options. Take all those components and use them a
register your scheduled job.

```powershell
$JobTrigger = New-JobTrigger -Once `
                             -At "01:00" `
                             -RepeatIndefinitely `
                             -RepetitionInterval (New-TimeSpan -Minutes 90)

$JobOptions = New-ScheduledJobOption -RequireNetwork

Register-ScheduledJob -Name 'Password Expiry Reminder' `
                      -ScriptBlock $JobBlock `
                      -Trigger $JobTrigger `
                      -ScheduledJobOption $JobOptions
```

Unfortunately, we're not quite done. The current version of Windows 10 defaults
to running these scheduled jobs whether or not the user is logged in and toasts
won't work if that is the case.

We can fix this by borrowing from the Scheduled Task (as opposed to Scheduled
Job) cmdlets and set the logon type to Interactive.

```powershell
$Principal = New-ScheduledTaskPrincipal -LogonType Interactive -UserId $ENV:USERNAME

Set-ScheduledTask -Principal $Principal ` 
                  -TaskPath '\Microsoft\Windows\PowerShell\ScheduledJobs\' `
                  -TaskName 'Password Expiry Reminder'
```

You're done! Our forgetful user will now be notified every ninety minutes
regarding the impending expiry. The toast is specifically using an alarm tone,
which makes is stay on the screen for longer and sounds annoying.

[![Finished toast](/images/crouton-password/example.png)](/images/crouton-password/example.png)

If they manage to ignore these notifications, I don't know if there is any hope
for them.

### Wrap-Up

That was a fun little exercise and I hope you took something away from it.

You can get the final product via [Gist](https://gist.github.com/Windos/17ce81e36cc635638f30e5cb79791051).

Personally, this was the first time I made use of the scheduled task cmdlet to
tweak one of the jobs rather than doing it via the GUI (the more you know.)

Have you got any uses for toasts that make your life (or your users' lives)
easier? Let me know on [twitter](https://twitter.com/WindosNZ)!
