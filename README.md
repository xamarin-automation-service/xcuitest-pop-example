# XCUITest POP example

This project demonstrates how to use Apple's XCUITest and is based on the the [page object pattern example](https://github.com/xamarin-automation-service/uitest-pop-example).

## Requirements

+ Xcode 8
+ CocoaPods Dependency Manager
+ XTC CLI Tool

## Running these tests locally

1. Clone this repo
1. Navigate to the folder in terminal and run `pod install`*
1. Open the `ToDoList.xcworkspace` file using Xcode.
1. Build
1. Navigate to the **Test Navigator** and Run Tests 

_*This project uses CocoaPods to manage an Extension. If you do not have the CocoaPods dependency manager installed, you can do it from [here](https://cocoapods.org/) before running the command._

## XCUITest Implementation

1. ToDoListUITests Group has the following structure to keep the files organized :
    * [BaseTest.swift](https://github.com/xamarin-automation-service/xcuitest-pop-example/blob/master/ToDoListUITests/BaseTest.swift)
    * [BasePage.swift](https://github.com/xamarin-automation-service/xcuitest-pop-example/blob/master/ToDoListUITests/BasePage.swift)
    * Pages Group
    * Tests Group

1. [`BaseTest`](https://github.com/xamarin-automation-service/xcuitest-pop-example/blob/master/ToDoListUITests/BaseTest.swift) inherits [XCTestCase](https://developer.apple.com/documentation/xctest/xctestcase) which has the `setUp()` and `tearDown()` methods required to run tests. All tests inherit this base class.

1. [`BasePage`](https://github.com/xamarin-automation-service/xcuitest-pop-example/blob/master/ToDoListUITests/BasePage.swift) contains shared/helper methods needed by Pages. It also has the `assertOnPage()` which checks for the page trait and takes a screenshot for that page. There is a helper method implemented called `waitForElement()`. All pages inherit this base class.

1. Pages are structured as :
    * Queries for Page Elements defined at the top as type `XCUIElement`
    * Page Constructor `init()` passes the Page Trait to Base as `super.init(trait: <traitValue>)` and initializes Page Element queries
    * Page Methods for that page defined at the bottom

1. Tests are structured as :
    * Test Method names must start with `test`

1. Follow the [page object pattern](https://github.com/xamarin-automation-service/uitest-pop-example) to build pages and write tests that interact with your app.

## Troubleshoot

If there are build errors when you initially clone the repo, try the following :

+ Make sure you have opened the `ToDoList.xcworkspace` file and not the `ToDoList.xcodeproj`
+ Make sure the Pods folder exists and visible in your workspace
+ Add the `VSMobileCenterExtension Pod` to the Scheme. Select the Pod and build it, switch back to the app and build again.
     

## Upload tests to Xamrin Test Cloud

+ Follow [these instructions](https://docs.microsoft.com/en-us/mobile-center/test-cloud/preparing-for-upload/xcuitest) to prepare your tests for Test Cloud.
    * This example has already been prepared and uses the `VSMobileCenterExtensions.framework` via Cocoapods. 
+ Go to [Test Cloud](https://testcloud.xamarin.com/) and start a new test run
+ Go through the wizard and then select XCUITest on the last step
+ Follow the provided instructions to install the CLI and uplaod your tests


## Contributors

* [Charles Wang](https://github.com/chawang)
* [Ethan Dennis](https://github.com/erdennis13)
* [Matisse Hack](https://github.com/MatisseHack)
* [Sweekriti Satpathy](https://github.com/Sweekriti91)