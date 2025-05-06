# Setting up Cypress

## Prerequisites
* NPM
* Node
* VS Code

## Installation & Setup
To create a new test project you can run the following commands

To create the folder:
````shell
mkdir cypress-axe-project
````

Initialise a new project
````shell
npm init -y
````

Install Cypress
````shell
npm i -D cypress@4.8.0 cypress-axe@0.8.1
````
_i_ is a shortcut for install, _-D_ because we want to save this in our dev-dependencies on this specific project.


Cypress comes built in with a predefined folder structure to get you started right away.
````shell
npx cypress open
````
NPX is basically a shortcut notation to execute a specific command.
First, it will open the Cypress official test runner, and then as you can see, it will load the example.
Secondly, it will create the default folder structure for us since it's not created yet.

## Resources
[Git repo](https://github.com/mdcruz/tau-automated-accessibility-course)
[Source code for support/index.js](https://github.com/mdcruz/tau-automated-accessibility-course/blob/master/cypress/support/index.js)

[Cypress Course](https://testautomationu.applitools.com/cypress-tutorial/)
[Cypress-axe Github](https://github.com/avanslaars/cypress-axe)
[Cypress Docs](https://docs.cypress.io/guides/overview/why-cypress.html#In-a-nutshell)