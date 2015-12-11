---
layout: post
title:  "Alternatives to Traditional CSS Grids"
date:   2015-12-11 11:00:00
author: mcleancode
comments: true
description: >
  Since its release into the web development world several years ago,
  the traditional 12 column grid has become the developer's defacto solution to a base
  UI. But is it the right choice for everything?
categories:
  - css
  - sass
  - bootstrap
  - grids
---

We've all used them. The traditional twelve column grid, popularized through Bootstrap, have been used for years. In this article though, I want to explore some alternatives. Though the traditional 12 column grid is quite powerful, many developers use it as a crutch instead of searching for better solutions.

### The Before Times

There was a time when we didn't have CSS3, Sass, or LESS. We were just starting to move away from HTML tables for layout. The development of the grid system was a marvel of its time in the world of CSS. All of a sudden we could achieve the same layouts we were achieving with tables, but with far more control, and developed with web accessibility in mind.

This is what Bootstrap uses, and it's a spitting image of what we all think of as the classic grid system.

{% highlight html %}
<div class="row">
  <div class="col-md-8">.col-md-8</div>
  <div class="col-md-4">.col-md-4</div>
</div>
<div class="row">
  <div class="col-md-4">.col-md-4</div>
  <div class="col-md-4">.col-md-4</div>
  <div class="col-md-4">.col-md-4</div>
</div>
<div class="row">
  <div class="col-md-6">.col-md-6</div>
  <div class="col-md-6">.col-md-6</div>
</div>
{% endhighlight %}

These kinds of grids had a few problems though.

1. They were very class heavy.
2. They encouraged much tighter coupling of information structure and presentation logic.
3. The responsive breakpoints were baked in and had to be overwritten, often messily.
4. The classes are not semantically named.

Don't get me wrong. These grids work and power some of the most powerful and influential web applications in the world. But, we can do better.

### Enter Flexbox

Flexbox is fairly new, but it has one excellent selling point. Your grid system is native CSS. Yup! You can now setup grids with just native code and in about 20 lines of CSS. No Sass, LESS, or heavy framework, which means we can cut back on the number of dependencies in our styles.

By setting our `display` property to `flex` we get access to a ton of features built around setting up grids.

Here are just a few to give you an idea.

- `flex-wrap`: Whether content wraps around a page
- `flex-direction`: Whether content is in columns or rows
- `justify-content`: How space around the container's children is handled

With just two of these, we can make an element act like a grid with semantic classes.

{% highlight css %}
section {
  display: flex;
  flex-wrap: wrap;
  flex-direction: row;
  width: 100%;
}

.card {
  height: 100px;
  width: 48%;
  margin: 1%;
  padding: 5px;
  box-sizing: border-box;
  background-color: red;
}

.card.-small { width: 23%; }
.card.-large { width: 73%; }
.card.-full  { width: 98%; }
{% endhighlight %}

{% highlight html %}
<section>
  <div class='card -small'>1</div>
  <div class='card -small'>2</div>
  <div class='card'>3</div>
  <div class='card -large'>4</div>
  <div class='card -small'>5</div>
  <div class='card -full'>6</div>
  <div class='card'>7</div>
  <div class='card'>8</div>
</section>
{% endhighlight %}

Flexbox also allows us to be a lot more flexible with how our grids work and lets us make changes much more quickly. For example, if there was a client request to organize content by columns instead of in rows, this is all we would have to do.

{% highlight css %}
section {
  display: flex;
  flex-wrap: wrap;
  flex-direction: column; /* Change */
  width: 100%;
  height: 500px; /* Change. */
}

.card {
  height: 100px;
  width: 48%;
  margin: 1%;
  padding: 5px;
  box-sizing: border-box;
  background-color: red;
}

/* No longer need different sized cards */
{% endhighlight %}

{% highlight html %}
<section>
  <div class='card'>1</div>
  <div class='card'>2</div>
  <div class='card'>3</div>
  <div class='card'>4</div>
  <div class='card'>5</div>
  <div class='card'>6</div>
  <div class='card'>7</div>
  <div class='card'>8</div>
</section>
{% endhighlight %}

Now, we did have to make some changes, but nothing too drastic. Also, our views only changed in the sense of needing to remove class attributes. The structure of our information didn't change. As far as the CSS goes, we just deleted a few obsolete classes, added a container height, and told everything to act like columns.

With Bootstrap, this would involve a complete restructure of the HTML, as well as any CSS that may not agree with the new changes. Though still not a drastic change, it's the far more disruptive scenario between the two.

#### The Catch

Flexbox still has really spotty support in Internet Explorer, with no support for IE8 and IE9, and partial support for IE10 and IE11. It can be great if your target is modern browsers, but not so much for legacy support.

### Enter Sass Mixins

If flexbox isn't your cup of tea or the right solution for you, many frameworks now include mixins that do most of the heavy lifting of a grid for you. A prime example would be [Neat from Thoughtbot](http://neat.bourbon.io/).

#### A Sass Mixin?

A Sass mixin is essentially a snippet of CSS you would see yourself using in multiple spots in your app. A common use case would be in wrapping up browser prefixes.

{% highlight scss %}
@mixin column-count($num) {
  -webkit-column-count: $num; /* Chrome, Safari, Opera */
  -moz-column-count: $num; /* Firefox */
  column-count: $num;
}

.article { @include column-count(3); }
{% endhighlight %}

What if a framework stuck all of their grid logic in one of these magic mixins?

#### Grid Time!

Simple tiled layouts come with the same benefits of flexbox, in that they are very loosely tied to the markup. We also end up writing significantly less code that's much more readable.

{% highlight scss %}
section {
  @include outer-container();
}

.card {
  @include span-columns(6);
  @include omega(2n);

  height: 100px;
  background-color: red;
}
{% endhighlight %}

{% highlight html %}
<section>
  <div class='card'>1</div>
  <div class='card'>2</div>
  <div class='card'>3</div>
  <div class='card'>4</div>
  <div class='card'>5</div>
  <div class='card'>6</div>
  <div class='card'>7</div>
  <div class='card'>8</div>
</section>
{% endhighlight %}

However, with libraries like Neat, we lose much of the flexibility that flexbox provides in making "table like" grids. For grid layouts with variable sized inner components, the struggle to minimize the effect of our CSS on our markup continues. This is because we are forced to introduce a new row element and class. Still, we do have the benefit of being able to name our own classes.

{% highlight scss %}
section {
  @include outer-container();
}

.card-group {
  @include row();
}

.card {
  @include span-columns(6);

  height: 100px;
  background-color: red;

  &.-small { @include span-columns(3); }
  &.-large { @include span-columns(9); }
  &.-full  { @include span-columns(12); }
}
{% endhighlight %}

{% highlight html %}
<section>
  <div class='card-group'>
    <div class='card'>1</div>
    <div class='card'>2</div>
  </div>
  <div class='card-group'>
    <div class='card -small'>3</div>
    <div class='card -small'>4</div>
    <div class='card'>5</div>
  </div>
  <div class='card-group'>
    <div class='card -large'>6</div>
    <div class='card -small'>7</div>
  </div>
  <div class='card-group'>
    <div class='card -full'>8</div>
  </div>
</section>
{% endhighlight %}

### A Word On Flexible Public APIs

The main criticism against the traditional grid system is not in it's power, but in how little control it actually give us. The hidden benefit in flexbox and mixin grid frameworks can be seen in the naming of our classes, allowing us to teat them as public APIs. We can choose to make class names semantic, include custom behavior beyond the scope of griding, and even treat our classes as adapters for third party libraries. The more we lean on native CSS and function/mixin libraries, the more resistant to change our codebase becomes and your fellow programmer will thank you for it.

### Conclusion

In 2015, soon to be 2016, there are more options than just a single framework for building CSS grids. Though each solution has its ups and downs, they all aim to drastically improve the quality of our code. If you have the opportunity on a project, give one of these methods a try!

Happy Coding!
