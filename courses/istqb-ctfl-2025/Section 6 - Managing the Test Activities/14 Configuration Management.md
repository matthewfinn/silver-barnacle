[🔙 Home](../home.md)

# Configuration Management
* Establish & maintain the integrity of the component, system, testware & their relationships to one another through the project & product life cycle
* For testing, configuration management involves ensuring:
  * All test items & items of testware are:
    * Identified
    * Version controlled
    * Tracked for changes

* Complex configuration items (i.e. test environment), Configuration Management records:
  * All items it consists of
  * Their relationships and
  * Their 

* After the configuration item is approved for testing:
  * It becomes the new baseline
  * It can only be changed through a formal change control process
  * CM keeps a record of ALL changed configuration items
  * If needed to reproduce previous test results, a previous baseline can be reverted to

* All configuration items including each part of the test object should be:
  * Uniquely identified
  * Version controlled
  * Tracked for changes
  * Related to other configuration items for traceability

* All documentation & software items should be referenced unambiguously in test documentation:
  * Including the ID
  * The version
  * Change record

## Testing & Configuration Management
Heavy use of automated tools to develop, test & manage software development

Tools are used by developers for:
* Static Analysis
* Unit Testing
* Code Coverage

Code & Unit tests are constantly checked into the Configuration Management system, using automated build & test frameworks for CI / CD including automated DevOps pipelines

### Functional Testing & Configuration Management
* Automated tests can also include functional tests on the integration & system levels
* These tests can be integrated with the other automated tests as part of the CI framework

Functional automated tests can be created using:
* Functional testing harnesses
* Open-source UI test tools
* Commercial Tools

As automated functional tests take longer than unit tests, often these are separated:
* E.g. unit tests run every day or during every check-in; functional tests every few days