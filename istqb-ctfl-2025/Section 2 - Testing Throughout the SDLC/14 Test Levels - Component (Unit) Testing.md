[🔙 Back to Index](../index.md)

[🔙 Back to Index](../index.md)

# Component (Unit) Testing

* AKA Unit testing, Module testing
* Focuses on software components that are separately testable
* Components are tested in isolation and stubs and drivers are used to mimic the interface between components
* **Test harness** - A test environment comprised of stubs and drivers needed to execute a test – find middleware issues
* Automated component regression is very important

### Objectives
* Reducing risk
* Verifying whether the functional and non-functional behaviour of the component is as designed and specified
* Building confidence in the quality of the component
* Finding defects in the component
* Preventing defects from getting into higher test levels

### Test Basis
* Examples of where the tests can be derived from are:
  * Detailed Design
  * Code
  * Data Model
  * Component specifications

### Test Objects
* Components, units or modules
* Code and data structures
* Classes
* Database Modules

### Typical Defects & Failures
* Incorrect functionality (not as described in the test basis)
* Data flow problems
* Incorrect code and logic

Defects are usually fixed as soon as they are found without formal defect management.

### Approach & Responsibilities
* Usually executed by the developer who wrote the code
* Requires access to the tested code
* Tests can be written after the code, or vice versa (Agile)
* TDD – first write tests, then write code

### Examples
* Validate that adding two positive numbers returns the correct sum
* Verify that a function correctly capitalises the first letter of a word
* Verify that a function extracts names correctly from an API response
* Verify that a function correctly identifies leap years
* Verify that adding multiple items calculates the total price correctly