---
date: "2018-01-25"
title: "Crouton #5 – Password Expiry Warning"
---

“Something is wrong with my computer. Outlook is asking me for my password?!”

“Let me look… Oh, it looks like your password expired about 15 minutes ago.”

“How the heck did that happen, isn’t the system meant to give me some warning?”

### Invisible Expiry Reminders

I don’t often get these calls personally any more, but I do overhear them.
There’s no point trying to tell your user that the ‘system’ did warn them (for
three days by default).

I imagine those warnings are probably something like website ads: Invisible.

They are popping up; the user just didn’t process them into something that needs
to be actioned.

To be fair, these notifications in Windows 7 are pathetic:

\__Windows7 example_\_

Windows 10 switched to toasts and they are a step up, but I think we can do
better:

\__Windows10 example_\_

*Note: I don’t know what the situation was like in Windows 8/8.1, I don’t
remember every joining that OS to a domain.*

### Get to the Point!

Right, I haven’t actually stated what the point of this post is.

Let’s create our own toast notifications to remind our users that their
passwords are about to expire. We’ll make these toasts as hard to ignore as
possible, they’ll only be effective if they’re actually seen.

Given that we’re using toasts, via the
[BurntToast](powershellgallery.com/packages/BurntToast) module, this only
applies to Windows 10.

Also, the client will need the Active Directory PowerShell module on the system.
How you achieve this is up to your… this is meant to be more of a fun “hey look
what we can do” type exercise that a complete recipe to fix an issue.

### Heading

Text

### Heading

Text

### Heading

Text

### Heading

Text
