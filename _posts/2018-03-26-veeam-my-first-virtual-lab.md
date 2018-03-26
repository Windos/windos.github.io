---
date: "2018-03-26 23:00:00 +1300"
title: "Veeam: My First Virtual Lab"
---

Ove the last day or so I’ve been setting up a sandbox/virtual lab which
leverages our Veeam backups. We’ve been using
[SureBackup](https://www.veeam.com/videos/surebackup-how-it-works-22.html) for
automatic restore point verification, but a large software update that’s coming
down the pipeline was a really good excuse the get a semi-persistent lab
running.

This post goes through the process of setting up a lab from start to finish. I’d
found posts that went through parts of the process, usually focusing on the
trickier parts, but I didn’t really find any real world, end-to-end
walkthroughs.

Keep in mind that the following is as much for “future me” as anyone else, but I
do hope you find this useful.

### A (PowerShell) Caveat

I’d originally wanted to include the PowerShell method for as much of this
process as possible, but unfortunately a lot of the commands just outright
aren’t working as advertised for me. This could be an issue with the version I’m
running (9.5 Update 3) or our particular VMware setup.

Don’t get me wrong, [Veeam’s PowerShell
support](https://helpcenter.veeam.com/docs/backup/powershell/getting_started.html?ver=95)
is awesome, but if it ventures too far into the “advanced”, it can be a little
lacking at times. If something isn’t working, or they’re missing something
that’s important to you, make sure you let them know!

In my experience Veeam’s support team is one of the best in the industry. Don’t
hesitate to talk with them.

### The Ingredients

Here’s something I didn’t realize until diving into this; despite marketing
terms like “[On-Demand
Sandbox](https://helpcenter.veeam.com/docs/backup/vsphere/sandbox.html?ver=95)”
being thrown around, this isn’t actually the name of the feature so don’t bother
hunting through the console like I did. It’s actually just another way of using
SureBackup.

So what is involved? There’s three components which I like to think of as the
what, where, and when.

**What** – Application Group

This defines which VMs will be part of your lab. It can also define which
special role each VM performs and any non-standard timings are needed. For
example one of your VMs may be a domain control that takes a really long time to
boot for whatever reason.

**Where** – Virtual Lab

There’s a bunch involved here, but at the end of the day this results in an
appliance that sits in your virtual infrastructure and acts as a proxy/gateway
between your lab and the rest of the network.

**When** – SureBackup Job

This job links your Application Group with your Virtual Lab. You can set this
job to run automatically at certain times (you’d do this for automatically
verifying the integrity of your restore points), but this particular job will be
run on demand.

### Group Your Applications

First, let setup our **Application Group**. I’m going to assume we’re setting up
this lab to test a major software update, which is installed on **APP1**. This
solution is supported by a database on **SQL1**. For good measure, I’ll make
sure we also have a Domain Controller, **AD1**, available for my identity needs.

Fire up your Backup & Recovery Console, head over to the “Backup Infrastructure”
section and look for “Application Groups” under SureBackup. Go ahead and create
a new group, give it a descriptive name and add your VMs.

Appgroup.png

You’ll note that I marked my Domain Controller for an authoritative restore (I
had domain trust issues without this.) This is where you can adjust the order in
which the VMs are restored, and to tweak any other VM specific settings. Have a
look through, and make any changes that suit your needs.

### Deploy Your Virtual Lab

Text

### Mix It Together with SureBackup

Text

### Getting into the Lab

Text

### Tear It Down (And Rebuild)

Text

### The Bits I’m Still Working On

Text

### Closing Thoughts

That’s it for getting started with a Veeam Virtual Lab. Are you using this
feature, or are you a Veeam user that’s been thinking about using SureBackup?
Let me know your story/use cases in the comments below or over on
[Twitter](https://twitter.com/WindosNZ).

Also, remember that if you’re looking for [PowerShell
help](https://king.geek.nz/2018/03/20/pshelp-twitter/), you can find it on
Twitter using
[\#PSHelp](https://twitter.com/search?f=tweets&vertical=default&q=%23pshelp&src=typd)!
