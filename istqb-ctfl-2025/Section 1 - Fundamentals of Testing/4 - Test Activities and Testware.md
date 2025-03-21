# Test Activities & Testware

### Test Process

* Set of common test activities
* Test strategy should state test process followed
* Not having common test activities = less likely to reach the test objectives
* Decisions on Test Activities are made in Test Planning
* In order to be effective, the need to be fully integrated with development activities

**The essential goal is not to find bugs, but to help fulfill the stakeholder’s business needs**

### Test Process in Context

* Test Strategy
* Test Techniques used
* Degree of Test Automation
* Required Level of Coverage
* Level of Detail of Test Documentation
* Reporting

![image6.png](assets/image6.png)

### Testware

Artifacts produced during the test process required to plan, design, and execute tests, such as documentation, scripts,
inputs, expected results, set-up and clear-up procedures, files, databases, environment, and any additional software or utilities used in testing.

* Created as part of the test activities in the test process
* Each test activity creates test work products (aka testware)
* Types of work products vary as the test process varies
* Much testware can be captured and managed using
  * Test Management Tools
  * Defect Management Tools

Proper Configuration Management should be in place to ensure thorough and consistent testware

### Fundamental Testware

![image8.png](assets/image8.png)

### Fundamental Test Process

![image7.png](assets/image7.png)

## Test Activities & Testware - Test Planning

### Test Planning – Test Activities and Tasks

* Define objectives of testing
* Selecting approach that best achieves objectives
* Starts at the beginning of the software development project
* Must regularly be checked and may be updated and adjusted based on feedback from the monitoring & control activities

### Test Planning – Testware

* Test Plan(s)
* Includes Information on
  * Test Basis
  * Traceability information
  * Exit Criteria (that's used in test monitoring & control)

### Test Plan - ISO/IEC/IEEE 29119 Standard
| Item                            | Details                                                                                                                                                                                                                                                                                                                          |
| ------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Context of testing              | Type of Test Plan<br />Test Items<br />Test Scope<br />Assumptions and Constraints<br />Stakeholders                                                                                                                                                                                                                             |
| Testing Lines of Communication  | -                                                                                                                                                                                                                                                                                                                                |
| Risk Register                   | Risks                                                                                                                                                                                                                                                                                                                            |
| Testing Activites and Estimates | -                                                                                                                                                                                                                                                                                                                                |
| Staffing                        | Roles<br />Tasks<br />Responsibilites<br />Training Needs<br />Hiring Needs                                                                                                                                                                                                                                                      |
| Schedule                        | -                                                                                                                                                                                                                                                                                                                                |
| Test Strategy (of the project)  | Test Sub-processes<br />Test Deliverables<br />Test Design Techniques<br />Test completions criteria<br />Metrics to be collected<br />Test Data requirements<br />Test Environment requirements<br />Retesting & regression testing<br />Suspension & resumption criteria<br />Deviations from the organisational test strategy |


## Test Activities & Testware - Test Monitoring & Control
### Test Monitoring & Control - Test Activities and Tasks
#### Test Monitoring
* **Ongoing** check of all test activities
* **Ongoing** comparison of actual progress vs the test plan using metrics

#### Test Control
* Taking actions needed to meet the objectives of testing
* Updating the Test Plan according to feedback

#### Monitoring and Control are supported by the evaluation of exit criteria (definition of done), which may include:
* Checking of test results and logs against coverage criteria
* Assessing component or system quality based on the test results and logs
* Determining if more tests are needed

**Progress, deviations and information needed to determine to stop testing is reported in Test Progress Reports, Documentation of Control Directives and Risk information**

### Test Monitoring & Control - Testware
* Various type of **Test Reports** such as:
  * Test Progress Reports
  * Test Summary Reports
  * Documentation of Control Directives
  * Risk Information
* These reports provide relevant information on the test progress and a summary of test execution results 

### Test Progress Report – ISO/IEC/IEEE 29119 Standard
* Reporting Period
* Progress against the test plan
* Factors blocking progress
* Test Measures
* New and changed risks
* Planned testing

## Test Activities & Testware - Test Analysis
### Test Analysis - Test Activities and Tasks
* Answers "what to test?" using measurable coverage criteria
* Major activities are:

  1. Analysing the test basis to:
    * Identify testable features
    * Test basis include Requirement Specifications, Design and Implementation information, implementation of the component itself, Risk Analysis reports, etc.
  
  2. Evaluating the Test Basis and test objects to identify defects and their testability such as:
     * Ambiguities
     * Omissions
     * Inconsistencies
     * Inaccuracies
     * Contradictions
     * Redundant statements
     
  3. Defining & Prioritizing test conditions, their risks and risk levels per feature based on:
     * Analysis of the Test Basis
     * Consideration on functional, non-functional and structural characteristics
     * Business & technical factors
     * Levels of risk

     Black Box, White Box and Experience Based test techniques can be useful in Test Analysis to define more precise and accurate test conditions and not miss important test conditions

### Test Analysis - Testware
* Defined and prioritized test conditions (such as Acceptance Criteria)
* Defect reports regarding defects in the test basis

### Test Design Specification – ISO/IEC/IEEE 29119 Standard
| Item            | Details                                                                                          |
|-----------------|--------------------------------------------------------------------------------------------------|
| Feature Sets    | Overview<br/>Unique Identifier<br/>Objective<br/>Priority<br/>Specific Strategy<br/>Traceability |
| Test Conditions | Overview<br/>Unique Identifier<br/>Description<br/>Priority<br/>Traceability                     |

## Test Activities & Testware - Test Design
### Test Design - Test Activities and Tasks
* The test conditions are used to create high level test cases and other testware, often involving test design techniques
* Answers "How to test?"
* Includes the following major activities:
  * Identify coverage items
  * Designing test cases and sets of test cases
  * Defining the test data requirements to support test cases
  * Designing the test environment
  * Identifying required infrastructure and tools
* Identification of defects during Test Design is a potential benefit

#### A good test case is:
* Effective - finds faults
* Exemplary - represents others
* Evolvable - easy to maintain
* Economic - cheap to use

#### Abstract (logical) vs Concrete test cases
**Example:**
* Application for calculating end-of-year bonuses
* Bonuses depend on the time employees work for the company

  |Time at Company|Bonus|
  |--|--|
  |Less than 3 years|0%|
  |More than 3 years|50%|
  |More than 5 years|75%|
  |More than 8 years|100%|

**Abstract (logical) test case**

|Test Case #|Input x (time in company|Bonus|
|-|-|-|
|1|x<=3|0|
|2|3<x<=5|50|
|3|5<x<=8|75|
|4|x>8|100|

**Concrete test case**

|Test Case #|Input x (time in company|Bonus|
|-|-|-|
|1|2|0|
|2|4|50|
|3|7|75|
|4|12|100|

### Test Design - Testware
* Prioritised test cases and sets of test cases
* Other work products may include:
  * Test Charters
  * Coverage Items
  * Test environment requirements
  * Test data requirements
* Good practice to first design high level (abstract) test cases:
  * Without concrete values for input & expected output
  * Can be reused across multiple test cycles with different data
* Each test case should be bi-directionally traceable to the test conditions it covers

### Test Case Specification – ISO/IEC/IEEE 29119 Standard
| Item            | Details                                                                                                                                         |
|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| Test Coverage Items   | Overview<br/>Unique Identifier<br/>Description<br/>Priority<br/>Traceability                                                                    |
| Test Cases | Overview<br/>Unique Identifier<br/>Objective<br/>Priority<br/>Traceability<br/>Preconditions<br/>Inputs<br/>Expected Results<br/>Actual Results |