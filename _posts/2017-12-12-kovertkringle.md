---
date: "2017-12-12"
title: "KovertKringle: Secret Santa With a Dash of PowerShell"
---

Given it’s the holiday season, I recently spent about 3 hours live streaming the
development of PowerShell based a [Secret
Santa](https://en.wikipedia.org/wiki/Secret_Santa) Organizer. You can watch the
videos from these streams, if you’re so inclined, over on
[YouTube](https://youtu.be/Xr5FKSVu-E4).

I can’t live with giving my projects straight forward names; with that in mind
let’s check out
[KovertKringle](https://github.com/Windos/powershell-depot/tree/master/General/KovertKringle).

### Slow down… what’s a Secret Santa?

If you’ve never done it before, Secret Santa basically boils down to a group of
people who are each assigned another member of the group to buy a present for.
One should only know who they’re buying for and not, for example, who is buying
something for them.

This would often be done by drawing names from a hat… but that’s not nearly
“geeky” enough in 2017, is it?

### Laying the foundation

KovertKringle is a PowerShell module you can use to organize a Secret Santa for
your family, friends, or office.

It stores the list of participants and “who is buying for who” in [module scoped
variables](http://mikefrobbins.com/2017/06/08/what-is-this-module-scope-in-powershell-that-you-speak-of/).

There’s a host of functions that manage these variables and then sending out of
notifications:

-   [Add-KKParticipant](https://github.com/Windos/powershell-depot/blob/master/General/KovertKringle/Public/Add-KKParticipant.ps1)

-   [Clear-KKPairing](https://github.com/Windos/powershell-depot/blob/master/General/KovertKringle/Public/Clear-KKPairing.ps1)

-   [Clear-KKParticipant](https://github.com/Windos/powershell-depot/blob/master/General/KovertKringle/Public/Clear-KKParticipant.ps1)

-   [Get-KKParticipant](https://github.com/Windos/powershell-depot/blob/master/General/KovertKringle/Public/Get-KKParticipant.ps1)

-   [Remove-KKParticipant](https://github.com/Windos/powershell-depot/blob/master/General/KovertKringle/Public/Remove-KKParticipant.ps1)

-   [Send-KKNotification](https://github.com/Windos/powershell-depot/blob/master/General/KovertKringle/Public/Send-KKNotification.ps1)

-   [Start-KKPairing](https://github.com/Windos/powershell-depot/blob/master/General/KovertKringle/Public/Start-KKPairing.ps1)

This post won’t be a detailed description of each and every function and
possible edge cases. Rather, it’ll cover an example use for a “100% made up and
totally not representative of people I know” family, including a “snitch.”

### Uh, Snitch?

Text

### Heading

Text

### Heading

Text

### Heading

Text
