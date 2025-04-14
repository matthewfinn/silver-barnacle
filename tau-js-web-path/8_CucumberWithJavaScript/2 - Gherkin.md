# Gherkin

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