---
date: "2017-04-25"
title: Always Ask for the API
---

Take this hypothetical, totally-didn’t-recently-come-up-at-work, scenario:
you’re business uses two disparate cloud services and needs them to share data,
but they don’t integrate natively.

You, the scripting magician that you are, can take an export from the first
service, manipulate it however it needs to be manipulated and then import it to
the other service. You could do this in reverse. You could do this all day,
every day; it’s a task right up your alley.

But you really don’t need to make this harder than it needs to be.

### Hard? This sounds like a piece of cake!

Yeah sure. At first look it really is a simple task:

You read in a CSV, make some changes to the resulting objects, maybe pull in
some auxiliary info from an internal system and finally spit out a new CSV that
can be uploaded to the second service.

But take a step back and consider: how are you getting that initial CSV?

Chances are that you may not have your own access to the service in question, or
you may have limited access. This is especially true if it’s “owned” by another
business unit outside of it, like Human Resources. This means that you likely
won’t be able to export a report as a CSV and you’ll need someone else to do it
for you and probably email it to you.

Now you’ve got to figure out how to:

-   Check for to see if the email is in your inbox.

-   Save the attachment somewhere.

-   Read the file in and do all the processing mentioned above.

-   Clean up the file.

You’ve also got to worry about the staff member you’ve roped into this scheme
remembering to do it. It’ll also never be sent at the same time, so you’re
script/process will need to run in a loop until the email arrives.

Also, the whole point of automation is to rule out (or limit/mitigate) human
error. Are you 100% sure that there is no chance that the person running the
report won’t accidentally generate the wrong one. The report you get could end
up with missing columns, extra columns. Maybe it has the right info, but in the
“wrong” order.

### Well, that escalated quickly 

End
