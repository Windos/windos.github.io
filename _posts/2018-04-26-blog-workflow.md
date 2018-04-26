---
date: "2018-04-26 23:00:00 +1200"
title: My Blogging Workflow
---

Coming out of the [PowerShell + DevOps Summit](https://powershell.org/summit/)
and [PowerShell Conference Europe](http://www.psconf.eu/) there has been a
noticeable uptick in new blogs. I’ve also noticed a number of people saying “I
want to get into it… but need to figure out x and y first.”

I’ve been meaning to document my workflow (which is sadly lacking in obvious
opportunities for automation currently) for writing blog posts and a little
about the backend this blog runs on. Now seems like a good time to get this
written, especially if it helps someone get their own blog off the ground.

### The Backend

This blog runs on [GitHub Pages](https://pages.github.com/) and you can see all
of the code behind it via its [GitHub
Repo](https://github.com/Windos/windos.github.io).

That first link has good instructions on how to get started with GitHub Pages.
The main thing to remember is that if you commit something to the master branch
of the repo, your site will be built automatically. If there are any issues
preventing the site from being built successfully you’ll get an email.

I’ve, uh, had a few of those emails…

\_failure.png\_

The biggest thing (for me) was finding a theme I liked. GitHub Pages has a stock
selection to pick from, and now even allow you to easily choose from a large
selection of community curated themes by [editing your configuration
file](https://blog.github.com/2017-11-29-use-any-theme-with-github-pages/).

In general, any Jekyll theme should work. You can just dump the theme into your
repo and see if GitHub manages it to build it, then go from there.

I ended up going with a theme called
[CodeInventory](https://github.com/codeinventory/codeinventory.github.io), which
I spent a while tweaking (read: hacking away at for weeks) to morph it into
something I was ok with.

### Little Green Padlock

You may have noticed that this blog isn’t sitting on the default domain for
GitHub Pages (username.github.io). GitHub supports using custom domains, but
don’t (yet) support HTTPS when doing so.

\_nohttps.png\_

However, this site does have a certificate and it is serving pages up over
HTTPS. To do this I’m using [Cloudflare](https://cloudflare.com). This gave me
the added benefit of using them to cache my site all over their network which
has improved load times (not that GitHub by itself was all that slow.)

This caching does mean though, that when I publish a new blog I generally go
into my Cloudflare account and purge the cache. If I don’t do this it can take
some time for new posts to actually become available to readers.

### Get Your Branch On!

Remember when I mentioned that any commits to the master branch will result in a
build of your site being triggered? Well then how the heck do you do “drafts” or
just, you know, stop work in progress stuff being shown to the entire world?

Branches!

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
