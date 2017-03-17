---
date: "2017-03-17"
title: "Crouton #1 - Toast Notifications for New Stack Overflow Questions"
---

Earlier this week I pushed an update for the
[BurntToast](https://github.com/Windos/BurntToast) PowerShell module to the
[PowerShell Gallery](https://www.powershellgallery.com/packages/BurntToast).
This update, version 0.5.2, exposed the ability to add custom buttons to your
toast notifications instead of just the standard Snooze and Dismiss option from
previous versions.

This dramatically increases the flexibility and usability of these PowerShell
generated toasts.

In an effort to show off the cool things you can accomplish with BurntToast, and
to demo new features as they come out, I’ll be writing a series of ‘Croutons.’

### What the heck is a Crouton?

A crouton is a small piece of toast for soup or salads.

Onto the post!

Seriously though, I have way too much fun naming projects and tools. In the
context of this site a ‘Crouton’ is a (hopefully) short post detailing one use
for the BurntToast module.

Get it? Small piece of (burnt) toast.

### Buttons!

The first thing that needs to be addressed is the fact that there is a little
more to adding buttons than text, or changing the sound. With that in mind think
of a button as a complete object, which is created using the `New-BTButton`
function. You can add up to five of these objects to your toast using the
`-Button` parameter.

There’s technically a bunch of ways a button can ‘activate’, though PowerShell
cannot consume most of theme. The practical outcome of this is that these
buttons are limited to the ‘protocol’ activation method, which opens a path (or
url) in the operating system’s default application for that file type.

A png will open in your photo viewer, a doc in MS Word, html file in your web
browser.

But how? Create a button object with content (display text) and arguments (the
path/url):

`$Button1 = New-BTButton -Content 'Google' -Arguments 'https://google.com'`

Add the resulting object to a toast:

`New-BurntToastNotification -Text "There's things on Google!" -Button $Button1`

Ooh, shiny!

GoogleToast.png

### The setup

adfdaf

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Variable = 'content'
while ($true) {$Answer = 42}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

conclusion
