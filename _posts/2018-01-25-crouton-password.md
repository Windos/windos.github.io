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

\_*Windows7 example*\_

Windows 10 switched to toasts and they are a step up, but I think we can do
better:

\_*Windows10 example*\_

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

\__CODE1_\_

We only want to show our toast if we're inside a three-day window of the expiry
time, so let's test for that. Then we populate some variables for use within the
toast's text.

Finally, we generate the toast!

\__CODE2_\_

Right, we've now got code that can be run on-demand, but that won't do! Let's
get this going on a schedule.

Imagine you've wrapped all of the previous code up as a ScriptBlock and then
create a Job Trigger and Job Options. Take all those components and use them a
register your scheduled job.

\__CODE3_\_

Unfortunately, we're not quite done. The current version of Windows 10 defaults
to running these scheduled jobs whether or not the user is logged in and toasts
won't work if that is the case.

We can fix this by borrowing from the Scheduled Task (as opposed to Scheduled
Job) cmdlets and set the logon type to Interactive.

\__CODE4_\_

You're done! Our forgetful user will now be notified every ninety minutes
regarding the impending expiry. The toast is specifically using an alarm tone,
which makes is stay on the screen for longer and sounds annoying.

If they manage to ignore these notifications, I don't know if there is any hope
for them.

### Wrap-Up

That was a fun little exercise and I hope you took something away from it.

Personally, this was the first time I made use of the scheduled task cmdlet to
tweak one of the jobs rather than doing it via the GUI (the more you know.)

Have you got any uses for toasts that make your life (or your users' lives)
easier? Let me know on [twitter](https://twitter.com/WindosNZ)!
