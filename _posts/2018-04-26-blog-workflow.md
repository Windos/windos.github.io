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

As I write this, I’m making commits to a “blog-workflow” branch, named after the
name of this post. The file I’m editing right now is
“2018-04-26-blog-workflow.md”.

\_branch.png\_

When I’m all finished writing, I merge the branch into master and the post goes
live. You can have as many branches on the go as you like. If you were following
along with my Summit recaps, I’d used branches to preemptively get the
templates, titles and thumbnails for each post ready before I was even on my way
over to America.

\_summit.jpg\_

### It All Starts with a Title and an Image

Ok, technically each of my posts starts with the idea for the blog post. But
nothing else happens before I have a title and a thumbnail image. I like to have
fun with these, and I try to go for “punny” titles (my goal is to make myself
laugh!)

For thumbnails I’ll pick one word that summarizes the topic of the post and
start searching for an image. I try to keep to creative commons images,
generally via [Flickr](https://www.flickr.com/photos/astuteobserver/1439828491/)
and I always include credit in the markdown file for where the image came from.
Bonus points if I manage to find an image that makes me laugh while still
actually being related to the topic of the post.

### The Template

Next is the template (which I really should automate), generally what I do to
get this at the moment is make a copy of the previous post and edit it.

Posts are all Markdown files with metadata at the top, and I keep this metadata
lean initially (for reasons which will become clear soon.)

Here is what this post started life as:

\_template\_

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
