---
layout: post
title:  "What GitHub Pages, CloudFront and AWS Lambda have in common"
author: sergiocruz
date:   2015-11-12 14:30:39
categories:
  - github pages
  - cloudfront
  - aws lambda
  - jekyll
---
We're proud to announce that the Orlando Devs blog is live! And not only is our blog live, but it is also running really really fast and I would love to give you a rundown on our stack.

## The Masterplan

Our idea was to have an open source blog. We wanted developers within our community to be able to easily contribute to our blog using the whole open source paradigm, including pull requests, reviews, etc.

We thought this would be a good way to get people's names out there and show off their skills in written form, as well as make younger developers get used to contributing to open source projects.

## GitHub Pages

From day one we knew that we wanted to host our site on [GitHub Pages](https://pages.github.com/). Using [Jekyll](https://jekyllrb.com) was also a no-brainer since GitHub Pages has native integration with it. We [used this this tutorial](https://help.github.com/articles/using-jekyll-with-pages) and had the whole thing running within 10 minutes or less.

The only problem with GitHub Pages is that it doesn't support custom domain names using SSL. So we decided to explore alternative solutions to assist us with this.

## CloudFlare

We decided to use [CloudFlare](https://cloudflare.com) to not only help with the custom domain SSL issues, but also caching to speed up the site a bit. The hardest part about this integration was getting the correct DNS settings in place, which wasn't hard at all.

Our DNS setup looks a bit something like this:

| Type | Name | Value |
| ---- | ---- | ----- |
| A | orlandodevs.com | 192.30.252.153 |
| A | orlandodevs.com | 192.30.252.154 |
| CNAME | io | orlandodevs.github.io |
| CNAME | www | orlandodevs.com |

_The IPs next to the `A` records are the GitHub Pages IPs._

Other than that, we just set up one Page Rule in CloudFront so our top-level domain name always uses `https`. And that wrapped up our CloudFlare setup.

Once CloudFlare was configured, we only ran into one problem: **caching**. Since we're using the free tier of CloudFlare, our site cache only renews every week or so. Usually this would work out just fine, except that we wanted new articles to be available on the front page right away, as soon as new article pull requests were merged.

CloudFlare offers an API to completely purge its cache, so we started thinking of how we could execute this API every time a pull request was merged. The answer: GitHub Webhooks & AWS Lambda.

## AWS Lambda

AWS Lambda ended up being a great solution for our problem, as it saved us the headache of setting up a server just for invalidating CloudFlare caches. AWS Lambda is very inexpensive, so it turned out to be a win-win solution for us. Here's how it works: monthly, the first 1 million requests are free and each additional million costs 20 cents. Though we'd love to have one million pull requests on out GitHub repo every month, we don't think this will even be the case, so AWS Lambda will pretty much be free for us.

First thing we did on AWS was add a new Lambda function using Node. We named it `cloudFrontInvalidation`. We decided to use the "Upload ZIP File" option, and the only hiccup we ran into while doing that was figuring out that our main entry file (we named it `app.js`) had to be on the root of the zip file. In other words, we couldn't zip up a parent directory, we had to pick out the files and archive them all into one zip file... _it was tricky_. Here is the repo containing our [cache invalidation function](https://github.com/OrlandoDevs/cache-purger).

Then we set up an endpoint for our function using AWS's API Gateway, and during this setup process we were able to point this API endpoint to the `cloudFrontInvalidation` Lambda function.

Last thing we did was add this newly created API endpoint to the GitHub Webhooks for our blog's repo. When doing that we only picked for this Webhook was the the `Page Build` event.

## _Booyah_!

We now have a whole workflow for **you** to contribute to our open source blog. All tech-related topics are welcome (though all new articles are subject to review by the moderators). So please, read our [guide to start contributing](https://github.com/OrlandoDevs/orlandodevs.github.io/blob/master/CONTRIBUTING.md) and [open a pull request](https://github.com/OrlandoDevs/orlandodevs.github.io/compare) with your brand article today!
