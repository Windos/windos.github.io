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

If more PowerShell support is important to you, make sure you let Veeam know!

The Veeam PowerShell Snap-In (ergh, the sooner this is a module, the better) is
installed alongside the Veeam Backup & Recovery Console. Load it like any
Snap-In:

Add-PSSnapin VeeamPSSnapin

Then connect to your B&R server:

Connect-VBRServer -Server VeeamBR1

### The Ingredients

What – Application Group

Where – Virtual Lab

When – SureBackup Job

### Group Your Applications

Text

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
