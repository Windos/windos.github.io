---
date: "2018-04-02 22:00:00 +1300"
title: "Crouton #6 – Dance to Your Own Beat"
---

[BurntToast](https://www.powershellgallery.com/packages/BurntToast) is long
overdue an update (sorry!) and right alongside that is the project’s need for
better documentation.

I recently got a tweet about how to get a toast to play custom sound. I really
like getting messages like this for two reasons: it gives me a glimpse into how
people are using the module and it also focuses my documentation efforts on
something that might actually be useful.

\_TWEET\_

**Take off the Training Wheels**

The natural first steps for someone creating toast notifications is the
New-BurntToastNotification function. This function is meant to be a short runway
for getting off the ground, it exposes enough customizability to tailor your own
basic notifications. It also has enough default values that you can run the
function raw and get *something* no screen.

Behind the scenes, there are 15 other functions available to create your
preferred flavor of toast.

Unfortunately, this is an all or nothing switch. You can’t use these 15
“advanced” functions alongside the “basic” one, and vice versa.

**The Basics of Going Advanced**

The best way to get your head around this switch is to see it in practice. The
default toast from New-BurntToastNotification looks like this:

\_default toast image\_

### Header

Text

### Header

Text

### Header

Text

### Header

Text

### Closing Thoughts

... in the comments below or over on [Twitter](https://twitter.com/WindosNZ).

Also, remember that if you're looking for [PowerShell
help](https://king.geek.nz/2018/03/20/pshelp-twitter/), you can find it on
Twitter using
[\#PSHelp](https://twitter.com/search?f=tweets&vertical=default&q=%23pshelp&src=typd)!
