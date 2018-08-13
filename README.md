Parallel Coding Example
============

This repo contains an Xcode project that is intended to show how an app can be specified via small tests, distributed throughout many different files, and be worked upon in parallel by many developers.

The goal of this approach is to allow someone with knowledge of a particular problem space, and some Xcode knowledge, and be able to write out all the needed functionality to get an app working.

# Requirements

* Xcode 9.4.3 or newer
* [Cocoapods](http://cocoapods.org/) - third party dependency manager

# How to Run

1. Run `pod install` in Terminal while in the same directory as the `Popfile`
2. Open the `.xcworkspace` file in Xcode
3. Build and run the app

# How to Contribute

## Adding functionality

To add functionality to this app, you take a test file and change one or more skipped tests to a running and passing test.

1. Look through the repo for a test file that looks interesting
2. Create a new branch and a related PR indicating that you plan to tackle this
    * This lets other people know you are currently working on that file, so we can avoid duplicated effort
3. Un-skip the tests by changing `xit` to `it`, and then add appropriate functionality
4. Assign your PR to @karlbecker and request a review from @karlbecker once you have things working and you think it's ready to be merged

## Adding tests for new functionality

If you'd like to either improve the test coverage this app currently has, or add brand-new functionality to this app, you can create new tests.

1. Ensure the test you want to add does not already exist
2. Create a new branch and a related PR indicating what you plan to add
3. Create commits with your new tests
    * Please add them in a similar fashion as what's already there, or provide rationale for why your addition follows a different pattern
4. Assign your PR to @karlbecker and request a review from @karlbecker once you have things working and you think it's ready to be merged

If you also want to add the functionality related to these tests, please create a new branch off of your branch that adds the tests, then create a new PR that adds the functionality and follow the "Adding functionality" instructions above.