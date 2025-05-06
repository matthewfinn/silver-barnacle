# Writing Tests
![Screenshot 2025-04-23 113120.png](assets/Screenshot%202025-04-23%20113120.png)
## 4.1 Installing Dependencies

WebDriverIO is a tool that we use to automate the browser, and we'll be leveraging it to create our Cucumber project.

Within WebDriver is Selenium and this is what's actually responsible for carrying out actions on our browser. Selenium relies on Java to work and is installed automatically when you install WebDriverIO.

`npm i webdriverio @wdio/cli`

## 4.2 Feature Files

Any file with the extension `.feature` will be executed as a test file.

## 4.3 Step Definitions
Just like Feature Files, WebDriverIO expects to find our Step Definitions in a specific location.

````require: [
"./steps/**/given.js",
"./steps/**/when.js",
"./steps/**/then.js"
], // <string[]> (file/dir) require files before executing features
````

To run the tests
`node_modules/.bin/wdio ./wdio.conf.js` OR  `npx wdio wdio.conf.js`

[Regexr](https://regexr.com/) is useful to validate expressions

## 4.4 Support Files
This is where we put our general reusable functions, typically actions and assertions.
* Actions that you want your automation to do that will be executed in various Feature files.
* Assertions - functions that will perform actual verification of data to judge if a test should pass or fail.

## Page Objects
**Page Objects are a representation of a page in a website or application.**

It contains selectors for elements on the page, and methods responsible for interacting with the page. Basically, it allows us to separate the logic of our tests from the static nature of our pages.

It's a good way to have a maintainable automation project for 2 reasons.
1. If some element on a page changes it's selector, we can pretty easily update the Page Object without having to worry about modifying any test.
2. If we decide we want to move away from Cucumber to a different framework, we can easily do so and still retain our Page Objects, and only focus on changing our tests to match that new framework.

## Quiz
1. **Step Definitions** communicate directly with Feature files
2. **Page Objects** are files that should store elements and methods related to a page
3. **Gherkin Statements** should feed into Feature files
4. **wdio-cucumber-framework** is responsible for communicating between WebdriverIO and Cucumber
5. The **require** property in the CucumberOpts object is where we can load our step definitions
6. The **specs** property is where we identify our test files
7. The first parameter in a step definition function can be a string or **Regular expression**