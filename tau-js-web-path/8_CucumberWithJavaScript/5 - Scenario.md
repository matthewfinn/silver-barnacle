# Scenarios
## 5.1 Scenario Backgrounds

We'll be creating tests for the [automationpractice.com](automationpractice.com) application.
Backgrounds are what we can use to repeat a series of steps for scenarios,

## 5.2 Scenario Outlines
Scenario Outlines are an easy way for us to repeat scenarios when we want different data for each scenario.
To specify which files to run at the command line. We can do that pretty easily by just adding a parameter to our command. The parameter is --spec, followed by the path to the file you want to run.
i.e.
`./node_modules/.bin/wdio wdio.conf.js --spec ./features/Navigation/MenuNavigation.feature
`
## 5.3 Data Files, Tags & NPM Scripts
### Using Data Files
We can use Data Files to supply our test with external data that we may not want present in our actual test.

Create a folder called "data"  in the root. In there, create a file called "credentials".
I want to be able to access credentials for my test, so I'll create an array of objects to represent this. For the password, I'm relying on "process.env.DEV_PASSWORD" or "process.env.INT_PASSWORD".

> If you're new to Node, this may be unfamiliar to you. All this is saying is we will pull the dev and integration passwords from our environment variables. I can create environment variables by creating a .env file in the root of my project, and then rely on a module to load those environment variables for me. I'll do that right now.

The module we'll be using to load this ENV file it's called dotenv. I'll install it now with the command `npm i dotenv.`
I call that here in my WebDriverIO configuration file (wdio.conf.js).
`require("dotenv").config();`
Now we should be able to access or environment variables from our .env file, which is responsible for storing our dev and integration passwords.


### Using Tags
Tags are an easy way to group tests, Features, or Scenarios in Cucumber. It allows us to group Features, Scenarios, and even Examples, so we can run them together, individually, or not at all.

I'll create 2 different Examples tables in our Feature File.

I'll have the first one only contain the dev email
The second one contains the integration email
Now I'll simply attach a tag to each example.

For the first tag, I'll call it "dev"
the second tag, I'll call it "int"

Example - features/Authentication/Login.feature
``` 
    @dev
    Examples:
      | email                             |
      | cucumber_automation_dev@gmail.com |

    @int
    Examples:
      | email                             |
      | cucumber_automation_int@gmail.com |
```

Now that we're using tags, we need to update our WebDriver IO configuration file to expect tags.
`tags:[],` should be replaced with `tagExpression: `@regression or @${process.env.ENVIRONMENT}`,`

### NPM Scripts for Running Tests
Now if you're like me, you'll probably get tired of typing out or remembering these long commands — to make this a bit easier, we can utilize NPM scripts.
We can create some NPM scripts to hold these long commands in `package.json`

```json
"scripts": {
    "test": "./node_modules/.bin/wdio wdio.conf.js",
    "test:regression": "./node_modules/.bin/wdio wdio.conf.js --cucumberOpts.tagExpression='@regression'",
    "test:dev":"./node_modules/.bin/wdio wdio.conf.js --cucumberOpts.tagExpression='@dev'",
    "test:int":"./node_modules/.bin/wdio wdio.conf.js --cucumberOpts.tagExpression='@int'"
}
```

To run them
`npm run test:dev`
`npm test`
`npm run test:int`
`npm run test:regression`
