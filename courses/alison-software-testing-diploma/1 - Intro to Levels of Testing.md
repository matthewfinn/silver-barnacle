## Learning Outcomes
Having completed this module you will be able to:
* Describe the different levels of testing software.
* Discuss different means of reducing bugs in your software program.
* Distinguish the verification and validation process in software testing.

## Introduction to Levels of Testing
### Errors, Defects, Failure
* **Error**: a human action that produces an incorrect result
In this context, human action refers to any activity or decision made by a person that contributes to an error. This could include:
Misunderstanding requirements
Writing incorrect code
Entering the wrong data
Misconfiguring a system
Misinterpreting test results
* **Defect**: a manifestation of an error in a software work product
aka a fault or bug
if executed, a defect may cause a failure
* **Failure**: deviation of the software from its expected delivery or service

### Error Random Facts
* Experiences programmers makes many errors
  * Average of 50 bugs per 1000 lines of source code
* Extensively tested software contains
  * Average of 1 bug per 1000 lines of source code

### Bug Distribution
* 60% spec/design
* 40% implementation

### How are Bugs reduced?
* Review
* Testing
* Formal specification & verification
* Use of development process

### Cost of Not Adequately Testing
* Can be enormous
* Example: Ariane 5 rocket self-destructed 37 seconds after launch
* Reason: A software exception bug went undetected
  * Conversion from 64-bit floating point to 16-but signed integer value caused an exception
    * The floating point number was larger than 32767
    * Efficiency considerations had led to the disabling of the exception handler
* Total Cost: $1 billion

### How to Test?
* Input test data to the program
* Observe the output:
  * Check if the program behaved as expected
* Examine Test Result:
  * If the program does not because as expected:
    * Not the conditions under which it failed (test report)
    * Debug and correct

### Testing Facts
* Consumes the largest effort amount all development activities:
  * Largest manpower among all roles
  * Implies more job opportunities
* About 50% of development effort
  * But only 10% of development time? - Large number of testers, maximum parallelism
* Testing is getting more complex and sophisticated every year
  * Larger and more complex programs
  * Newer programming paradigms
  * Test automation

### Testing Perception
* Over the years testing has taken center stage in all types of software development

### Verification and Validation Techniques
**Verification** - Built the product right
**Validation** - Built the right product

|      Verification      |      Validation      |
|:----------------------:|:--------------------:|
|         Review         |    System Testing    |
|       Simulation       |  Acceptance Testing  |
|      Unit Testing      |                      |
|  Integration Testing   |                      |


## Levels of Testing
### 4 Testing Levels
1. Unit Testing
2. Integration Testing
3. System Testing
4. Regression Testing

#### Unit Testing
* Test each module (unit, or component) independently
* Mostly done by developers

#### System & Integration Testing
* Test the system as a whole
* Often done by separate testing/QA team
* Integration testing evaluates a group of functions or classes:
  * Identifies interface compatibility issues, unexpected parameter values or state interactions and run-time exceptions
* System testing tests working of the entire system

#### Smoke testing
* System test performed periodically after every build
* Build confirmation - basics are working

#### Acceptance Testing 
* Validation of system functions by the customer

### Overview of Activities During System & Integration Testing
|              Tester              |       Developer        |
|:--------------------------------:|:----------------------:|
|        Test Suite Design         | Debug to locate errors |
|        Execute Test Cases        |     Correct errors     |
| Check results to detect failures |                        |
|             Log bugs             |                        |

### When to stop testing?
* Rate of bug detection slow
* All tests are executed
* No remaining unresolved defects
* Run out of time


### Types of System Testing
Based on Test Types:
* Functionality Test
* Performance Test

Based on who performs the testing
* Alpha (within the organisation i.e. product managers)
* Beta (subset of customers)
* Acceptance testing (customers before full rollout)


### Performance Testing
* Determine whether a system or subsystem meets it's non-functional requirements 
  * Response times
  * Throughput
  * Usability
  * Stress
  * Recovery
  * Configuration

### User Acceptance Testing
* User determines whether the system fulfills their requirements
  * Accepts or rejects delivered systems based on the test results.

### Who Tests Software?
**Developers**
* Unit Testing
* Test their own or other developers code

**Users**
* Usability & acceptance testing
* Volunteers are frequently used to test beta versions

**QA Team**
* All types of testing except unit & acceptance
* Develop test plans & strategy

### Pesticide Effect/Paradox
If the same tests are repeated over & over again, they will no longer find any new defects.
To overcome this test cases need to be reviewed & revised, to exercise different parts of the software.

**Example**
A tester always follows the same script for testing a shopping cart. Over time, no new defects are found. But when they try different payment methods, they discover a security issue.


## Lesson Summary
* Testing is getting more complex and sophisticated every year, with programs going larger and more complex, new testing techniques, new programming paradigms and test automation.

The four means of reducing bugs in your program are:
1. Reviewing
2. Testing
3. Formal specification and verification
4. Use of an appropriate development process

* All companies spend a lot of time and manpower on testing with about 50% of a project time on testing.
* Verification is the process of determining whether output of one phase of development conforms to its previous phase.
* Validation is the process of determining where a full developed system conforms to its software Requirements Specification(SRS) Document.

Software is tested at four levels:
1. Unit testing
2. Integration testing
3. System testing
4. Regression testing