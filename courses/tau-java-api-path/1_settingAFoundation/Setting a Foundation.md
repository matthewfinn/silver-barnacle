# Setting a Foundation
* Collaboration from all stakeholders
* Everyone needs to understand their role and what's needed

## Product Owners's & Business Analysts
* Can suggest most useful tests to run on each check-in
* Can include test automation maintenance tasks in backlog and prioritise along with feature work - keeps automation goals and impacts

## Developers
* Run tests against new changes to build confidence
* Can fix issues before tests
* Should contribute unit tests
* Ensure areas they're delivering can be automated against
* Fix tests they've broken and can analyse if the change in behaviour they've delivered is valid - valuable fast feedback

## Testers
* Manual testers still needed - automation is not a replacement for manual tests
* Provide insights on tests that are best to automate
* Areas of application that need the most coverage
* NB: Test automation does not replace testing, and it should not be treated as more valuable!!

## Developing for Test Automatability

**3 levels**
1. UI
2. Services
3. Unit

Determine what a test needs to verify and choose the "cheapest" level, the lower the level the faster the test.

**Example in UI testing** 
Remove test steps not needed by for example going straight to URL or making a webservice call rather than searching to make test shorter and test what its supposed to and more reliable.
Result is less redundancy, dependency, time, less prone to failure for an unrelated cause.

**SEAMS** - a simple way of replacing or expanding source code in production parts of a program for test purposes
* Unique urls for various pages
* Web services - bypass UI with http - data verification, setup and cleanup
* Add locators for UI elements - id, name or custom attribute
* Enforcement via code linter, code review, meeting in advance with mockup elements

## Tooling for test automation
Who will use them?

Do we have resources and skillset to develop a test automation suite.

### Interaction: Unit Level
* Same language + codebase

### Interaction: Service Level
* Execute HTTP calls + read responses - could use library

### Interaction: UI Level
* Navigation library
* Language skill in team
* Support of language
* Browsers and devices needed to test

### Validation:
* Execute test + Verify tests
* Reporting Library
* Specificaion-Driven - Gherkin
* CI

## Future Proofing your test automation efforts
* Running in parallel - tests have to be designed this way - tests should be independant
* Setup/Cleanup should be isolated within the test itself
* Avoid test data modification that other tests rely on
* Object/Variables used should be created in a thread safe manner
* Clean coding - extensible and maintainable
* Inefficient waiting in tests should be avoided
* Avoid long classes/methods
* Avoid excessive code duplication
* Design Patterns Examples - POM, Builder, Screenplay, Fluent, Singleton, Factory, Facade

## Scaling Your Test Automation
* Multiple Environments - make use of artefacts like properties files
* Managing Test Data - containerisation
* Multiple Browsers - use cloud solutions that have multiple browsers
* Multiple Devices - use a cloud based service, native mobile - ioS & Android?

## Measuring the value of your test automation
* Identify expectations early
* Shortened regression testing time - can be measured
* Set an SLA for automated test suite execution
* Fast & Frequent feedback
* Trustworthiness - does a failed test = problem?
* Scalability - track ability of tests to do this