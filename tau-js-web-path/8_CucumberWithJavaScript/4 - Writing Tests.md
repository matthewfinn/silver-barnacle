# Writing Tests

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