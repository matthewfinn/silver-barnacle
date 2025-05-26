# Overview
[Course Code](https://github.com/gavin771/tau_cucumber/)
[Cucumber Website](https://cucumber.io/)

# Chapter 1 - Behaviour Driven Development
## What is BDD?

* BDD stands for behaviour-driven development, and it's an **example-based** method for developing software.
* It includes many different collaborative activities & techniques performed by stakeholders; The Product Owner, The Developer & The Testers (often referred to as the **3 amigos**)
* One of the major activities is having the Three Amigos meet to discuss and document examples of how a system should act and be used. These examples describe how the software is intended to behave, often illustrating a particular business rule or requirement.
* **It's important to note that these examples do not outline how a system, or its features should be implemented, only how it should behave.**
* The end result of discussing and documenting these examples is that all parties should come to a mutual understanding of how the feature will behave in various scenarios, and by extension, how the system itself should work.
* **An important point to note is that BDD is not solely a testing technique.**
* Much like test-driven development, it's a process of approaching your design and forcing you to think about the desired outcome before you code.
* Test cases and eventually automated tests should be a byproduct of following a BDD approach and having great properly structured examples.

### BDD's Value
The major goals of BDD are to narrow the communication gaps among team members, foster a better understanding of the customer's needs, and promote continuous communication throughout the software development process.
* Collaboration
* Everyone speaks the same language
* Breakdown Silos
* Shared Understanding
* Examples can be used as executable artifacts that drive test automation

### BDD Terms
* **Three Amigos** refers to the main stakeholders in the software development process: product owner, tester, and developer.
* **Example-based** is an approach to software development that leverages the creation of examples to drive discussion, understanding, development, and testing.
* An **example** is a description of how the software is intended to behave, often illustrating a particular business rule or requirement.
  **Gherkin** is a special syntax that should be used when developing examples. This is designed in a way for anyone to understand the behavior of a feature.

# Chapter 2 - Gherkin

**Gherkin is a special syntax that is used within BDD to document examples.**
Gherkin uses a set of special keywords to give structure and meaning to executable specifications.
* The files that are used to store Gherkin are referred to as feature files because each file is usually used to document the behavior for one feature
* Each group of instructions that relate to the actions and behavior of an individual scenario of a feature is actually referred to as an example or a scenario

Some of the core keywords of Gherkin are: _Feature, Scenario, Example, Given, When, and Then_. We'll dive into what each keyword means, when to use them, and the best practices surrounding them.

This is the standard layout of an Example written in Gherkin — each line starts with a keyword followed by some descriptive text.

## Structure of an Example/Scenario
Here is the general structure of an **Example**, also called a **Scenario**, using the Gherkin syntax.

**Feature:** Some descriptive text of the feature, it's expected behaviour and how it relates to a business requirement.
**Scenario:** A business situation related to the feature
**Given:** some preconditions are met
**When:** some action is done
**Then:** some result is expected

Each line in an example that begins with _Given, When, or Then_ is called a **Step**.

**Here is a scenario outlining the withdrawal feature of an ATM machine.**
**Feature:** Withdraw money. A customer should be able to withdraw cash from the machine at any given time.
**Scenario:** Withdraw cash with money available
**Given:** I have available funds in my account
**When:** I select the withdraw option
**Then:** I should get cash

> **This explains the feature and maps it back to an important business requirement.**
> Feature: Withdraw money. A customer should be able to withdraw cash from the machine at any given time.
>
> **This is a title for the specific scenario of the feature. This outlines that the user is trying to withdraw money from their account when they have available money.**
> Scenario: Withdraw cash with money available
>
> **This outlines a precondition for the system.**
>Given I have available funds in my account.
>
> **This is the action to be performed.**
> When I select the withdraw option
>
> **This is the expected behavior of the system.**
>Then I should get cash.

## Gherkin Syntax
* **Given** — used to outline some preconditions that are necessary for this scenario to be executed by a user. For example, Given I am logged in as an administrator.
* **When** — used to describe the action to be performed. For example, When I create a user.
* **Then** — used to describe the outcome from the action. For example, Then the user is created.
* **And or But** — these can be used to duplicate any previous keyword. The below are identical
> **Given** I am logged in as admin
> **And** I am a first time user
> **When** I create a user
> **And** I go to my profile
> **Then** I see my username
>
> **Given** I am logged in as admin
> **Given** I am a first time user
> **When** I create a user
> **When** I go to my profile
> **Then** I see my username

* **Feature** — this must be the first word in a Gherkin document or a feature file. The purpose of this keyword is to provide a high-level description of a feature
* **Scenario** or **Example** — this is a summary of the specific scenario of the feature of being described
* **Background** — this is used when you have a set of steps that you want to repeat for multiple scenarios
> **Background:**
> **Given** I am logged in as admin
>
> **Scenario:** A user does not see the getting started page
> **Given** I am not a first time user
> **When** I go to the dashboard
> **Then** I don't see a getting started page
>
> **Scenario:** A user sees the getting started page
> **Given** I am a first time user
> **When** I go to the dashboard
> **Then** I see a getting started page

* **Scenario Outline** — this is useful when you want to run the same scenario with different values. It is used in conjunction with the **Examples** keyword
* **Examples** — also referred to as data tables, are used to outline the values to be used within a Scenario Outline. Examples are represented in a table format
> **Scenario Outline:** Withdraw Money
> **Given** I have <initial> dollars in my account
> **When** I withdraw <withdraw>
> **Then** I should have <remaining> dollars left
>
> **Examples:**
> | initial | withdraw | remaining |
> | 100     | 10       | 90        |
> | 20      | 5        | 15        |

The combination of the above Scenario Outline and data table would produce 2 scenarios with identical steps, just different values.

## Best Practices
* Create modular, reusable steps
* Create behaviour driven steps, not procedural
* Each scenario should represent one behaviour
* Utilise **Backgrounds** & **Scenario Outlines** as much as possible
* Avoid excessive use of **And/But**
* Try to avoid punctuation within step phrases

# Chapter 3 - Cucumber
Cucumber is a tool that supports BDD and is used to execute Gherkin statements.
It works in a few steps:
* Cucumber reads each line of a Gherkin document
* It validates the statements conform to Gherkin syntax
* Then it maps each Gherkin statement to some predefined logic (code written by an engineer)
* Finally, it executes that logic

![Screenshot 2025-04-14 120344.png](assets/Screenshot%202025-04-14%20120344.png)

## Pros
* Tests are understood by the entire team
* Allows for continued collaboration and increases the visibility among the entire team
* Allows for a test to be refactored easily without changing the actual Gherkin statements

## Cons
* Extra layers of abstraction can add time and effort to create and maintain & for new team members
* Can lead to frustration if not used with correct BDD and Gherkin and practices
* If poorly implemented, it can cause a team to dislike Cucumber & BDD as a whole

## Is BDD/Cucumber Right for you?
* Do not use Cucumber only as an automation tool
* Best used at the beginning of a project
* Do you have the resources to support it?
* Will your team benefit from it?

# Chapter 4 - Writing Tests
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

# Chapter 5 - Scenarios
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
