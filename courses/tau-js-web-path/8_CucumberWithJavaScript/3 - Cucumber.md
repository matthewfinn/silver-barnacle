# Cucumber
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