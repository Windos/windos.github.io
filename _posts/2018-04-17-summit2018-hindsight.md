---
date: "2018-04-17 22:00:00 +1200"
title: "A Quick Look Back at #PSHSummit 2018"
---

After another three flights, and 16 hours in the air, I’m back home in New
Zealand. I can certainly say that the change in time zones has hit me harder
coming back. Going over to Bellevue, I got right into things and felt (for the
most part) normal.

Last week I did a [blog post for each day](https://king.geek.nz/tags/#pshsummit)
of the [PowerShell + DevOps Global
Summit](https://powershelldevopsglobalsummit2018.sched.com), going over what I
took part in that day and what my main takeaways were.

This post will be an overarching lookback at the Summit. I wanted to do this
close enough to the event that I still remembered things fairly well, but not so
soon that I hadn’t had a chance to process everything.

Here’s hoping I picked the right time!

### Main Takeaways

I came home from the Summit with three main things I’m going to be following up
on right away. You’ll probably be seeing blog posts on these topics as I work my
way through them.

#### WebJEA

I’ve got a handful of scripts that it’d be very handy for the support team at
work to be able to use, but there’s two problems:

1.  They don’t have the permissions needed to run them

2.  They aren’t fully up to speed on PowerShell (yet!)

My hope was that I’d be able to use
[ChatOps](https://docs.stackstorm.com/chatops/chatops.html) to solve these
problems, and the POC I did with [Slack](https://slack.com) and
[PoshBot](https://github.com/poshbotio/PoshBot) was promising. But the
collaboration/chat tool we’ll be using going forward is [Microsoft
Teams](https://products.office.com/en-us/microsoft-teams/group-chat-software) so
putting a bunch of effort into a different service now seems fruitless.

The alternative is to expose these scripts through a secure web interface and
[Mark Domansky’s](http://twitter.com/markdomansky)
[WebJEA](https://github.com/markdomansky/WebJEA) does just that.

#### Neo4j/Dots

For the longest time we’ve been looking for a way of graphically representing
our servers, systems, and services and the dependencies between them. The
ultimate goal being a way of seeing “if this thing goes down, it affects these
other things.”

[Warren Frame](https://twitter.com/psCookieMonster) showed a simple CMDB,
[Dots](https://github.com/RamblingCookieMonster/Dots), which makes heavy use of
[Neo4j](https://neo4j.com/).

As soon as I saw this up on the screen, I sent a picture back to the guys I work
with NZ. Part of the magic may have been lost not seeing it “move,” but this
looks like exactly what we’ve been wanting to achieve.

#### Puppet

Finally, [Puppet](https://puppet.com/).

I’ll be frank, we’re a small shop. We’re not dealing with request for 30+ new
IIS servers at a time. That doesn’t mean we can’t benefit from configuration
management/automation to drive standardization, speed up delivery, and reduce
human error.

I really like how Puppet handles inclusion of DSC, which is what got this on my
list instead of just raw DSC.

### Header

Text

### Header

Text

### Header

Text

### Header

Text

### Header

Text

### Header

Text

Also, remember that if you're looking for [PowerShell
help](https://king.geek.nz/2018/03/20/pshelp-twitter/), you can find it on
Twitter using
[\#PSHelp](https://twitter.com/search?f=tweets&vertical=default&q=%23pshelp&src=typd)!
