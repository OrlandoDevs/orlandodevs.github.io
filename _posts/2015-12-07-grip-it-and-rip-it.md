---
layout: post
title:  "Coding with the Grip It and Rip It Mentality"
date:   2015-12-07 10:00:00
author: rortega1
comments: true
description: >
  Though having a full understanding and plan for a software project can be very efficient in theory, sometimes you just have to tear into the code and figure it out as you go.  You can read about some of the benefits of a "Grip It and Rip It" mentality and situations that warrant that methodology. 
categories:
  - professional development
  - development
  - tech
---

Several years ago I used to play golf on a consistent basis.  My friends and I would head out to the local course, and I would try to imagine myself as a pro golfer - strategizing every shot.  However, my buddy Bill would walk up to the tee on every hole and yell, "Grip it and rip it," before taking a monstrous backswing and tearing into his top-flite.  It was rather amusing while at the same time annoying.  It wasn't just his golfing strategy, but how he operated in every-day life.

I mention this story not to tell you about golf, but it's more to tell you a parable, I think.  You see, as a software developer - term used loosely these days - I took the same approach of meticulously trying to figure out what the final product should be and how I can get there in the most simplest of fashions.  Throughout this process I'd find myself thinking deep into the architecture, coding pattern, etc., and not actually coding the project until I realize the looming deadline is near (like tomorrow).  However, I came to the conclusion that my bud, Bill, may have had the right approach all along.  Maybe some times you just have to roll up your sleeves, grip your keyboard and rip into the code; let the application build organically.  I've come across a few reasons why this method was necessary, and I believe this information can help you on your projects moving forward.

### Reasons

#### Client Doesn't Have a Clue

Yes, you read that correctly.  There is a subset of potential customers out there that have money to spend on software development, but don't have a clue as to what they want or how they want it.  Essentially, they are wanting you (as the expert) to take a handful of fecal matter (known as features), throw it against the wall (known as the end user), and see what sticks (which features their customers will actually use).  Sounds rather exciting if you ask me, but I digress.  It is very difficult to come up with a plan for these types of projects.  It's the equivalent to telling your waiter, "Surprise Me," while placing your order at a restaurant.

The key is to gather enough information to get started on the project.  Get into the application's fundamental goal.  Once you have that, you can start prototyping the concept for your client.     

For example, a client requested an application that allows users to signin to a registration form via mobile devices.  Upon registering, the user's address information would populate a marker on an interactive map to be displayed on the convention floor.  The purpose was to display the location of interested customers for convention goers to see in real-time.  The client didn't know what it should look like, how the user would interact with the form, or how the map was to be displayed.

To begin, I opened up my TextMate and began to build a Google Map container with a simple form that would submit the address to the Google Map API and return the longitude and latitude to which a marker populated at the location.  It was as prototypical as it could be; no bells, knobs, and whistles.  This was enough for the client to begin providing more detailed feedback as to what they wanted.  But, once we know what the client truly wants, what technologies do we use to build it?  This leads to my next reason for ripping into the code.

#### You Don't Have a Clue

Seriously!  Unless you've predetermined a specific coding language or stack, the reality is you probably don't have a clue as to how to get to your end game.  If you do, then you're special like Rain Man.  The fun part of development is figuring out how you get to your end game using a multitude of available tools, libraries, frameworks, etc.  Knowing what to use can be determined by just starting to code out the project using the completed requirements provided by the client.

Returning to the project I mentioned, I originally started with PHP, my preferred language at the time.  I needeed to save the data in a database, provide access to the data from multiple platforms and display data in real-time to an interactive map.  I had experience building APIs in PHP, but as I dug further into the code, I realized that the real-time interactivity would be a bit convoluted in PHP.  This discovery led me to look into NodeJS.  However, Node by itself doesn't provide a RESTful-API-like infrastructure or real-time communication to the browser.  Therefore, adding ExpressJS and SocketIO helped get my Node closer to that goal.  Additionally, I needed Node to communicate with MySQL, which there's a library for that.  But, piece-mealing all of this together seemed to be a bit daunting, and allowed for more points of failure.  Enter SailsJS.  SailsJS is a Node framework that allows you to build a complete RESTful API in Node with all the components including RESTful routes, SocketIO and built in ORM for database communication.  It's light weight and allows for extremely rapid development using JavaScript.

Considering SailsJS (Node) as a backend, it only made sense to use JavaScript on the front-end, especially since we needed to incorporate SocketIO.  In the end, we went with AngularJS as it contained libraries for interfacing with Google Maps.

The conclusion of the project was accomplished by ripping into the code and organically figuring out what would work and what wouldn't.  But there is one more reason you should just start coding.

#### You Have Too Much of a Clue

Sorry, I was too lazy to come up with a more catchy subtitle.  The reality is some of you have more experience in different areas and you know exactly what you need to do to complete a project.  You think about the architecture and map it out in your head.  You know the stack you want to use, and you put together the list of libraries that you need.  If you're like me, you've probably completed the project in your head and already have that feeling of accomplishment, but in reality you haven't started.  Yes, it's that feeling of, "I got this!" that paralyzes your progress.

The truth of the matter is there's a term for people like you and me, and it's called "Analysis Paralysis."  You've planned out everything, but unfortunately, what's in your head has to make it into your text editor.  If you feel yourself over-thinking to the point of overwhelming, just open up your editor and begin coding.  Once you begin dumping what's in your head onto a working document, you'll be surprised as to how less complicated the project may be.  You may not need those libraries you thought about.

Recently, I worked on a project that required a .NET integration from an open source PHP application.  I was thinking in my head about all of the pieces I needed in order to perform the integration.  In .NET, there's an MVC Framework configuration that allows you to quickly put together a product with minimal effort.  My experience as an API developer pointed me to using this MVC configuration; However, I ran into a game changer.  While building the API, I found that the framework has a configuration called Web API 2.  This configuration, by default, has a very similar infrastructure to that of Symfony (PHP framework) with entity relationships behind an MVC pattern.  Using this configuration saved me a significant amount of time and proved to be a better option to what I initially invisioned.  The reality is, doing the work led me to the right path in completing the work.  So just do it.

### Do It

!["Do It!"](/assets/authors/rey/doit.png)

I can tell you that starting is one of the hardest steps in developing software even when you have paying clients.  What we do is complex, and requires us to think in ways that surpass the understanding of most of our friends, families, etc.  But, this gift that we possess gives us the power to create things that only others can imagine.  If you find yourself in one of the three scenarios just remember that the key is to "Do It," and don't be afraid to "Grip It and Rip It."