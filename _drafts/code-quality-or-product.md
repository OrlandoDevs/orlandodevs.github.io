---
layout: post
title: "Code Quality or Product?"
author: mcleancode
description: As developers we often are drawn into debates of which is more important, code quality or iteration speed. Here I aim to provide some advice of how to account for both.
comments: true
categories:
  - development
  - code quality
  - product
---
It's an argument as old as the ever burning sun exploding above our heads and seems to continue dividing developers with a razor like efficiency. No, this isn't about React or any other new, hip, framework. Since I started my career as a software engineer, the debate has always been, "should quality code come first, or the product?". Self admittingly, I fell into the trap of picking sides for most of the early stages of my time as a developer. Specifically, I fell into the former camp, becoming obsessed with the "proper" way to do things. I studied design patterns, various tools, and development paradigms to drive toward perfection. Through all of that time though, I had to ask myself, how many of my clients genuinely benefited from my efforts?

This question can get tricky however. On one hand, there's a certain pride in craftsmanship that comes with writing stellar code. When done right, you can future proof systems for years to come and the long term benefits really begin to show. On the other hand, focusing entirely on the short term, just moving from sprint to sprint, caring only for completion of the product, can ensure that your customer benefits from short term gain. An idea can become reality in record time, giving some random Joe a chance at success in a market that can be expensive to enter.

What follows are some tips, tricks, and general advice that helped me to arrive somewhere in the middle of the two camps.

## Maintain Constant Communication with Product and Design

If you currently have a hostile relationship with these individuals, repair them immediately. As they plan and mock up new concepts, you can gain insights into which features may just be one off implementations or will end up becoming core dependencies for your application. This kind of information is astronomically valuable in an industry that is leaning more and more toward agile development practices with far less planning up front.

This communication will force you to be deeply connected with the product as well, giving more background to aid in any split second decisions that need to be made for the good of the project.

## Utilize a Service First Approach

Whenever possible, begin in a service class/module and keep your business logic out of your controllers and components. Make heavy use of private methods and keep your methods tiny. This may come out of Ruby coding styles, but this way of development has led to the easiest and most flexible re-factors of any project I've ever been on. We want to keep iteration of our product's UI and UX from breaking us as best we can, and this typically helps.

## When You Have To, Write Garbage Code

The sky is black, the coffee pot is empty, and you're still in the office at 10:00pm. Your startup's big meeting is tomorrow and this feature needs to get done for a meeting with possible investors. Is this a byproduct of terrible planning? Most likely, but the work still needs to get done.

In these situations, it makes complete sense to write a mangled pile of reeking garbage, but don't write spaghetti. Scope everything as best you can to a well commented and isolated location. Try to define a long lasting set of public methods and just bury the shit underneath them. It's a fact of being a developer that these situations will happen, but we want to think about and implement sensible migration paths out of them. Even if your service just provides a single getter and setter method with hundreds of lines of trash underneath in private, you can at least be rest assured that only the inner mechanics of that file need to change.

Now, this may not be as simple as you delve into concepts like meta programming or commands that issue side effects, but the effort to isolate these instances of rushed code is still important.

## Study Development Patterns and Commit them to Memory

There are wildly intelligent people who did a lot of great thinking for us so we don't have to. Learn these patterns, like adapters, composition vs inheritance, revealing module pattern, mvc, flux, etc. Understand the differences between OOP, functional, and procedural paradigms, and draw out the best of each. Learn data structures and algorithms and why we may want to use them. Learn all of these things upfront and commit them to memory to reduce the amount of decision making that needs to take place for each new ticket, giving you more time to think about product and going from point A to B.

## Study Design and UX on a Basic Level

At the end of the day, if we build something client facing, it's important that we have some understanding of why we're building what we build. Color choice isn't random and neither are the positions of our application's components. Working on these things may seem tedious, but it all serves a purpose. Being able to have open and meaningful conversations with your designers can ultimately lead to better products, especially if your design team is only made up of one person. Good design and UX can't happen in a bubble and the person who has spent the most time living in the product will probably be you.

Now, this in no way makes you a designer. You need to make this clear, especially if you are in JavaScript development, as many managers may not be able to see the grey area. Even some engineers turned executives that I have previously worked with have failed to understand this distinction.

There is also a case to be made in learning design to better be able to handle separation of concerns in you UI code. Understanding which elements of design are specific or global, which aspects act like inheritance, etc, may help in your architecture decisions.

## Write What You Know

I've seen it time and time again in rescue projects, back when I worked as a web consultant. Developers will often pick new frameworks that they are not familiar with to develop off of and, of no fault of their own, write mangled Frankenstein monster code bases. Learning a new tool takes time, practice, and a lot of patience. Introducing unfamiliar tooling to your application can become expensive in both time, dollars, and technical debt. If this means you build your UI in jQuery, then so be it. If it means you build it in Java, so be it. If it means your application is a full stack Rails application, that's ok too. You will at least understand what's written and, hopefully, be able to provide a sensible code base to write the next iteration, or expansion, off of.

## Conclusion

Our job is still to be an engineer. As Sandi Metz, put it in her Magic Tricks of Testing talk, our jobs are ultimately to find simplicity at the heart of complexity. Code quality will always be at the heart of what we are hired to accomplish, but I don't think that's all there is. It took way too long for me to remember, with some helpful reminders and jabs from a senior ex-coworker and lover of inline styles, that our job at the end of the day is to build a product and to create business value from, effectively, nothing.

Now, let's go build something awesome.

## Resources

[The Magic Tricks of Testing](https://www.youtube.com/watch?v=URSWYvyc42M&feature=youtu.be&t=30m56s)
