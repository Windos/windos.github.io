---
date: "2017-08-02"
title: "Office 365 & PowerShell: Connecting All the Pieces"
---

Now that we’ve figured out [how to
connect](http://king.geek.nz/2017/07/28/o365-connect/) to each of the Office 365
services, it’s time to tie a pretty (PowerShell) blue bow on it. If you just
want to skip the writeup and see the result, you can check out the
[Gist](https://gist.github.com/Windos/5f96a9425b5b31c23df441035b478c5f). This
Gist may get updates in the future.

### Initial housekeeping

We know that there are a few requirements we need to meet to establish our
connection(s) to Office 365, so we might as well put PowerShell to work. Using
[\#Requires](https://msdn.microsoft.com/en-us/powershell/reference/5.1/microsoft.powershell.core/about/about_requires)
statements allows us to specify that we need PowerShell V3 (for those running
Windows 7), and all of installable modules. If the requirements aren’t met,
PowerShell will handle letting the user know.

\_insert requires\_

Assuming we don’t meet the requirements, I want to have download links for all
the relevant installs readily available.

\__insert comment here_\_

### Connect-O365Services

Now let’s create our function for connecting to the various services. Start by
defining the function and its parameters.

\__insert until end of param_\_

Tenant is straight forward, it’ll just be the name that identifies your Office
365 instance. If you’re using example.onmicrosoft.com for example you’d supply
example.

Credential is a little more interesting. You’ll note that there are two possible
object types that it’ll accept meaning that you can provide a fully formed
credential object from Get-Credential or a username as a string, being prompted
for a password at run-time.

We’re again making PowerShell work for us by validating that the input for these
parameters isn’t null (or empty) to save us some error handling.

Next, we’ll go through and actually get connected. I won’t breakdown each one,
as it’s more or less identical to what we’ve [already
covered](http://king.geek.nz/2017/07/28/o365-connect/).

\__insert connected_\_

The last, and most important, step for this function is to remember the closing
curly brace.

\__brace_\_

### Disconnect-O365Services

Like a good “tidy kiwi,” we’ll also be cleaning up the various remote sessions
we opened with the previous function.

Tidykiwi.jpg

You’ll notice that there is no Disconnect-MsolService cmdlet. Unlike the other
services, there is no actual PS session created, so just disconnect the others
and close the PowerShell host.

\__insert the script_\_

### Heading

Text
