---
date: "2018-03-26 21:00:00 +1300"
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

I’ll be using PowerShell as much as possible during this, but the harsh reality
is that you cannot do everything necessary through the shell and you’ll be
opening up the GUI one way or another. The Veeam forums indicate that more
PowerShell configuration will be possible in the future, but there’s no
timeframes yet.

Don’t get me wrong, [Veeam’s PowerShell
support](https://helpcenter.veeam.com/docs/backup/powershell/getting_started.html?ver=95)
is awesome, but if there’s something missing that’s important to you make sure
you let them know!

The Veeam PowerShell Snap-In (ergh, the sooner this is a module, the better) is
installed alongside the Veeam Backup & Recovery Console. Load it like any
Snap-In:

Add-PSSnapin VeeamPSSnapin

Then connect to your B&R server:

Connect-VBRServer -Server VeeamBR1

Finally, I’m working against a VMware environment. Some commands will be
different if you’re running Hyper-V.

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

In this PowerShell snippet, please be aware that the order you list your VMs
determines which order they are brought up in. You can change this order via the
GUI, but I like to get it right at this stage (just in case I forget later).

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
