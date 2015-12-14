---
layout: post
title:  "Unit Testing with Mockito for Android"
date:   2015-12-14 14:00:00
description: Learn how to unit test your Android code with JUnit4 and Mockito
author: johnleeroy
comments: true
categories:
  - android
  - java
  - unit testing
  - tdd
  - code coverage
  - tech
---
Every developer knows that testing software can take a lot of time.  Being the brilliant industrious individuals that we are, engineers invented multiple ways to test software.  Unit testing is just one part among others such as functional testing, integration testing, and acceptance testing.

In this blog, we will go over how to write unit tests for Android using the latest tools and libraries.  In this example, I am leveraging [JUnit4](http://junit.org/) and [Mockito](http://mockito.org/).  

## What is Unit Testing?
Tests the smallest functionality of a feature.  This is generally a function with a single responsibility.  Unit tests shouldn't be concerned with outside dependancies and if they exist in the code, they should be mocked or stubbed.  You generally test the public interface of your code which should call on any and all unaccessible implementation hidden within the class.

The goal is to create a test that is relatively simple, easy to debug, fast to execute, and validates that your unit of functionality works within it's own encapsulation before it is used by another object.

## Example : Buying a Drink

### Scenario
We have a `Patron`, Matt, who enters a cafe and buys a cold, refreshing Nuka Cola.  To unit test the functionality of buying a drink, we will mock both the `Cafe` and `DrinkInterface` because the implementation of these objects are largely irrelevant to testing the `Patron` class.  

#### Patron (abridged)
{% highlight java %}
public class Patron {

    private String mName;
    protected float mCash;
    protected Cafe mCurrentCafe;
    protected ArrayList<DrinkInterface> mDrinksInPossession;

    public Patron(String name, float cashAmount) {
        mName = name;
        setCash(cashAmount);
        mDrinksInPossession = new ArrayList<>();
    }

    public void enterCafe(Cafe cafe) {
        cafe.addNewCustomer(this);
        mCurrentCafe = cafe;
    }

    public void purchaseDrinkFromCafe(String drinkName) throws NotEnoughMoneyException {
        DrinkInterface drink = mCurrentCafe.getDrink(drinkName);
        float cost = drink.getCost();
        if (mCash >= cost) {
            mCash -= cost;
        } else {
            return null;
        }
        DrinkInterface newDrink = mCurrentCafe.sellDrink(drink.getName());
        mDrinksInPossession.add(newDrink);
    }
}
{% endhighlight %}

#### DrinkInterface

{% highlight java %}
public interface DrinkInterface {
    String getName();
    float getCost();
    float getSizeInOz();

    abstract DrinkInterface getCopy();
}
{% endhighlight %}

### Setup
We create Matt to test the `Patron` class.  
`PatronHelper` is a child of the `Patron` class which helps reveal unaccesable properties for our tests.  
We also create a mocked `Cafe` object.  It emulates the class without knowing about the implementation.

@Before is called before every test.  
{% highlight java %}
@Before
public void SetUp(){
    mMatt = new PatronHelper("Matt", 100);
    mCafe = mock(Cafe.class);
}
{% endhighlight %}

### Creating a mocked Drink
{% highlight java %}  
DrinkInterface getMockedDrink(String targetDrinkName, float cost) {
    //Creates the mocked object based on the class
    DrinkInterface nukaColaMock = mock(DrinkInterface.class);

    //when getCost is called on the object, return
    when(nukaColaMock.getCost()).thenReturn(cost);
    when(nukaColaMock.getName()).thenReturn(targetDrinkName);
    return nukaColaMock;
}
{% endhighlight %}

Creates a mocked or dummy `DrinkInterface` object without copying any of the functionality.
{% highlight java %}
DrinkInterface nukaColaMock = mock(DrinkInterface.class);
{% endhighlight %}

When getCost is called, it will return the value of cost.  
When getName is called, it will return the value of targetDrinkName.

{% highlight java %}
when(nukaColaMock.getCost()).thenReturn(cost);
when(nukaColaMock.getName()).thenReturn(targetDrinkName);
{% endhighlight %}


### All Together Now

- This creates a Nuka Cola mocked drink.  
- Makes sure the mocked cafe returns Nuka Cola.  
- Check if Matt has a Nuka Cola soft drink.

{% highlight java %}
@Test
public void BuyDrinkWithEnoughMoney() throws Patron.NotEnoughMoneyException {
    //create mocked drink
    String targetDrinkName = "Nuka Cola";
    DrinkInterface nukaColaMock = getMockedDrink(targetDrinkName, 4);

    when(mCafe.sellDrink(targetDrinkName)).thenReturn(nukaColaMock);

    mMatt.enterCafe(mCafe);
    mMatt.purchaseDrinkFromCafe(targetDrinkName);

    assertFalse(mMatt.mDrinksInPossession.isEmpty());
    assertTrue(mMatt.mDrinksInPossession.get(0) == nukaColaMock);
}
{% endhighlight %}

---

### Learn more

- Checkout more examples on my [github](https://github.com/JohnLeeroy/AndroidUnitTestExamples)  
- Local Unit Testing [Guide](http://developer.android.com/training/testing/unit-testing/local-unit-tests.html) by Google
