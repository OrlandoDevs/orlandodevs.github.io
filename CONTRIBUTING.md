# Contributing to the Orlando Devs blog

Members of our community are encouraged to write articles for our blogging platform. When we were deciding which website & blogging platform to use, [Jekyll](https://jekyllrb.com) was the obvious choice because it made it very easy for members to add new articles to it, assisting the platform to keep growing.

Here is a write up on how to start contributing to our blog:

## Step 1: Fork and clone this repo to your machine

Some experience with GitHub is required to accomplish this step.

Not sure how to fork and clone a GitHub repo? Do some googling, or if now, ask somebody on our Slack channel under #chat. We'll be happy to help you out with this :)

## Step 2: First-time authors

Have you ever written an article for our platform? If so, feel free to skip over to the next section.

### Adding your self as an author:

**1. Go to the file `_data/authors.yml`**

**2. There you will see a list of authors. It should look something like this:**

```yml
atrophius:
    name: Jeremy Privett
    bio: Here's a bio for me.
    url: http://www.jeremyprivett.com
    twitter: Atrophius
    github: Atrophius

sergiocruz:
    name: Sergio Cruz
    bio: Here's a bio for Sergio.
    url: https://sergiocruz.me
    twitter: hashtagserg
    github: sergiocruz
```

**3. Add your username and subsequent info at the end of the file.**

At the top, we would like you to use the same `username` as your github account (for example `sergiocruz` is Sergio's my github username). This will allow us to avoid username collisions within our blog.

The following fields are allowed as of right now:

- name
- bio _(optional)_
- url _(optional)_
- twitter _(optional)_
- github _(optional)_

## Step 3: Adding your new post to the O-Devs blog

Now that your username is under the list of authors, we get to the fun part: adding  your article to our blog.

To get a grasp on we're about to do here, we highly recommend you the [Jekyll docs about Posts](http://jekyllrb.com/docs/posts).

**1. Add a new file to `_drafts/` with the `.md` extension following these instructions**

- Use this convention when naming your file: `title.MARKUP`

- Here's an example: `_drafts/i-love-the-odevs.md`

**2. Add content to your newly created file**

Here is an example:

```

---
layout: post
title:  "Why you should use Angular"
categories: angular javascript
author: sergiocruz
---
You should use Angular because it's trendy. Here's how to create a directive:

{% highlight javascript %}
angular
  .module('app')
  .directive('foo', function() {
    return {
      restrict: 'E',
      template: 'Sup yo'
    }
  });
{% endhighlight %}
```

We'll separate this file in two parts: **header** & **body**.

### Header

This is the information that lives in the top of each post, between the dashes (`---`).

Be sure to change the information on the header of your post file, it is very important that you add the following fields on the files on the header:

- layout _(should always be "post")_
- title: _(your post's title)_
- categories: _(category tags separated by spaces)_
- author: _(same username used on `_data/authors.yml`, same as your github account)_

### Body

The body is where the actual content of your article will be located. Be sure to be comfortable using markdown to write content.

In this blog we use the `kramdown` flavor of markdown, but it's pretty similar to github's flavor of markdown.

**3. Previewing your post**

You'll need to install Jekyll on your machine to preview your blog post. Be sure to preview your post before making a pull request. This is a community-based blog and we expect you to bullet-proof your article before making a pull request. By bullet-proofing we mean making sure that your content is properly formatted, etc.

- Learn how to install [Jekyll for GitHug Pages](https://help.github.com/articles/using-jekyll-with-pages)

- Serve Jekyll locally by running this command on your terminal: `bundle exec jekyll serve --drafts`

The output of `bundle exec jekyll serve --drafts` should look something like this:

```
> jekyll serve
Configuration file: orlandodevs.github.io/_config.yml
            Source: orlandodevs.github.io
       Destination: orlandodevs.github.io/_site
      Generating... done.
 Auto-regeneration: enabled for 'orlandodevs.github.io'
Configuration file: orlandodevs.github.io/_config.yml
    Server address: http://0.0.0.0:4000/
```

- Visit your the address next to "Server address" on your browser to see the local version of your blog running, in my case http://0.0.0.0:4000

## Step 4: Publishing your article

Commit and push your changes to your forked repo. Once those changes are in, go ahead and make a pull request to the [main blog's repo](https://github.com/OrlandoDevs/orlandodevs.github.io).

Not sure how to do this? Do some googling first, and if no luck just ask somebody on our Slack channel under the #chat channel and we'll be happy to help you out.

In an effort to maintain a clean commit history, if you have more than one commit for a single blog post, please squash them down to a single commit. If you're unsure of how to do this [check out this article](https://github.com/ginatrapani/todo.txt-android/wiki/Squash-All-Commits-Related-to-a-Single-Issue-into-a-Single-Commit).

When making the pull request please follow these guidelines:

1. Pull request title: `New post: (post name here)`

2. Pull request description: please provide a quick description on what your new article is about. This will help us get the right reviewers to take a look at your article before you push it.

Here's an example:

```

Title:
New post: Why you should use Angular?`

Description:
This article explains why every web developer should know Angular in 2015.
```

Now the moderators will know that we need to get somebody that knows Angular to review this article before we publish it. We'll take it from here in other words. And as soon as your article is merged, it'll also be live on our blog (usually takes around 2 minutes to publish).

## Comments

Any comments? Not satisfied with this description? Simple, open a pull request with the changes you'd like to see to this file :)

Enjoy!
