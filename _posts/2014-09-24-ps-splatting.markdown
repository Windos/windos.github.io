---
layout: post
title:  "Splatting your way to reduced duplicated code"
excerpt: "You create a hashtable of of the parameter names and their values, which you can format nicely, and pass the hashtable to the cmdlet."
modified:   2014-09-24
date:   2014-09-24
tags: [powershell, nugget]
comments: true
image:
 feature: /ps-splatting/banner.jpg
 credit: Anita Hart
 creditlink: https://www.flickr.com/photos/anitakhart/8734598308
---

[Splatting](http://technet.microsoft.com/en-us/library/jj672955.aspx) is a great way of making cmdlet calls with a lot of parameters more legible. You create a hashtable of of the parameter names and their values, which you can format nicely, and pass the hashtable to the cmdlet.

A good example of this in action from the [TechNet magazine](http://technet.microsoft.com/en-us/magazine/gg675931.aspx) is turning:

{% highlight powershell %}
Get-WmiObject –computername SERVER-R2 –class Win32_LogicalDisk –filter "DriveType=3" –credential "Administrator"
{% endhighlight %}

into:

{% highlight powershell %}
$parms = @{'class'='Win32_BIOS';
           'computername'='SERVER-R2';
           'filter'='drivetype=3';
           'credential'='Administrator'
}

Get-WmiObject @parms
{% endhighlight %}

Readability isn't the only reason to splat your parameters. It can also help you reduce mostly duplicated cmdlets calls. In an advanced function I wrote to wrap around the [Send-MailMessage](http://technet.microsoft.com/en-us/library/hh849925.aspx), you could specify _TO_, _From_, _CC_, _SmtpServer_, _Subject_ and _Body_ though parameters. _To_, _From_, _SmtpServer_ and _Subject_ all have default values, but _Body_ and _CC_ did not.

In order to not get errors trying to pass null variables Send-MailMessage, you could use a complex series of **if** statements:

{% highlight powershell %}
if ($Body -ne $null -and $Body -ne '')
{
    if ($CC -ne $null -and $CC -ne '')
    {
        Send-MailMessage -SmtpServer $SmtpServer -From $From -To $To -CC $CC -Body $Body -Subject $Subject
    }
    else
    {
        Send-MailMessage -SmtpServer $SmtpServer -From $From -To $To -Body $Body -Subject $Subject
    }
}
else
{
    if ($CC -ne $null -and $CC -ne '')
    {
        Send-MailMessage -SmtpServer $SmtpServer -From $From -To $To -CC $CC -Subject $Subject
    }
    else
    {
        Send-MailMessage -SmtpServer $SmtpServer -From $From -To $To -Subject $Subject
    }
}
{% endhighlight %}

Four different possible Send-MailMessage calls with largely the same parameters for each. Not very efficient, or readable. Imagine if another parameter or two without default values were added. Splatting, and the ability to add Key=Value pairs to hastables makes this situation a lot more manageable.

{% highlight powershell %}
$splat = @{'SmtpServer'=$SmtpServer;
           'From'=$From;
           'To'=$To;
           'Subject'=$Subject;
}

if ($Body -ne $null -and $Body -ne '')
{
    $splat.Add('Body',$Body)
}

if ($CC -ne $null -and $CC -ne '')
{
    $splat.Add('CC',$CC)
}

Send-MailMessage @splat
{% endhighlight %}
