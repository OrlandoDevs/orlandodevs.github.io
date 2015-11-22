---
layout: post
title:  "What GitHub Pages, CloudFlare and AWS Lambda have in common"
author: sergiocruz
date:   2015-11-20 18:30:00
description: The official Orlando Devs blog is live and open sourced! It uses Jekyll, GitHub Pages, CloudFlare and AWS Lambda. Anyone can open pull requests to add new articles.
comments: true
categories:
  - github pages
  - cloudflare
  - aws lambda
  - jekyll
  - javascript
---
We're proud to announce that the Orlando Devs blog is live! And not only is our blog live, but it is also running really fast and we would love to give you a rundown on how we built it.

## TL;DR _(Too long; didn't read):_

> We launched the official Orlando Devs blog and it's open source! Anyone in the community is welcome to  [add new articles](https://github.com/OrlandoDevs/orlandodevs.github.io/blob/master/CONTRIBUTING.md), as we have a fancy way of adding articles to the blog automatically after merging **your** pull requests :)

## The Master Plan

Our idea was to have an open source blog. We wanted developers within our community to contribute to our blog using the _whole open source paradigm_ (forks, pull request reviews, etc).

We thought this would be a good way to get people's names out there and have them show off their skills in a written form, as well as making _newer_ developers getting used to contributing to open source projects.

## GitHub Pages

From day one we knew that we wanted to host our site on [GitHub Pages](https://pages.github.com/). Using [Jekyll](https://jekyllrb.com) was also a no-brainer since GitHub Pages has native integration with it. We [used a tutorial](https://help.github.com/articles/using-jekyll-with-pages) and had a prototype running in 5 minutes.

There was one problem with GitHub Pages though: it doesn't support `https` on custom domain names. So we went on to find a way to fix this.

## CloudFlare

We decided to use [CloudFlare](https://cloudflare.com) to add `https` support to our custom domain. We also leveraged CloudFlare's caching capabilities to speed up our site and the hardest part about this whole integration was getting the correct DNS settings in place.

### CloudFlare DNS Settings

This is what our DNS settings look like:

| Type | Name | Value |
| ---- | ---- | ----- |
| A | orlandodevs.com | 192.30.252.153 |
| A | orlandodevs.com | 192.30.252.154 |
| CNAME | io | orlandodevs.github.io |
| CNAME | www | orlandodevs.com |

_The IPs next to the `A` records are the GitHub Pages IPs._

### CloudFlare Page Rules

We setup two "Page Rules" within CloudFlare:

**1. Always uses `https`**
This rule forces the site to always use `https`.

**2. Custom Caching**
Here we forced our site to "Cache everything". This is important because by default <a href="https://support.cloudflare.com/hc/en-us/articles/200168306-Is-there-a-tutorial-for-PageRules-" target="_blank">CloudFlare _does not cache_ HTML and other dynamic pages</a> (as somebody kindly pointed out to us on Hacker News).

Once CloudFlare was configured, we only ran into one problem: **cache invalidation**. Since we set CloudFlare to cache everything for 1 week, how could we make sure the home page was instantly refreshed when we add new articles?

It turns out that CloudFlare offers an API to purge its cache, so we started investigating on how we could consume this API every time a pull request is merged.

**The solution?** GitHub Webhooks & AWS Lambda.

## AWS Lambda

We soon learned AWS Lambda is great solution for our cache invalidation problem, as it saves us the headache of setting up a new server. AWS Lambda is inexpensive, so it turned out to be a win-win solution for us.

Here's how Lambda's billing works: every month, the first 1 million requests are free. If we go over the limit it will cost us 20 cents per each additional million requests. We don't think this we will ever merge anything close to 1 million pull requests a month, so we're good!

Here's how this process went:

1. We signed up for AWS and added a new Lambda function using Node. We named the function `cloudFlareInvalidation`.

2. We used the "Upload ZIP File" option to deploy the project.
_We ran into a little problem while uploading the zip file: We were zipping up the parent directory containing our project, however this didn't work. The zip file uploaded needs to have the entry file (called `app.js` in our project) at the root of the compressed folder._

3. We then set up an endpoint for our function using AWS's API Gateway. During this step we were able to point this new API endpoint to the `cloudFlareInvalidation` function.

4. Configured GitHub Webhooks for our blog's repo using the URL provided by the API Gateway. The only event we needed this Webhook to work was the `Page Build` event.

5. Finally, we [open sourced the project](https://github.com/OrlandoDevs/cache-purger) (be sure to check it out!)

## _Booyah_!

We now have a whole workflow for **you** to contribute to our open source blog. All tech-related topics are welcome, although new articles are subject to review by moderators. So please, read our [guide to start contributing](https://github.com/OrlandoDevs/orlandodevs.github.io/blob/master/CONTRIBUTING.md) and [open a pull request](https://github.com/OrlandoDevs/orlandodevs.github.io/compare) with your brand new article today!
