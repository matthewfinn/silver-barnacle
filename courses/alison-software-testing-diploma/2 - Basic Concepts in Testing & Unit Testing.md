## Learning Outcomes
Having completed this module you will be able to:
* Describe the Pesticide effect in testing software.
* Describe unit testing and when it is performed.
* Identify the main approaches to designing a test case.

## Basic Concepts in Testing - Part 1
### Pesticide Effect/Paradox
Errors that escape a fault detection technique can not be detected by further applications of that technique.

If the same tests are repeated over & over again, they will no longer find any new defects.
To overcome this test cases need to be reviewed & revised, to exercise different parts of the software.

**Example**
A tester always follows the same script for testing a shopping cart. Over time, no new defects are found. But when they try different payment methods, they discover a security issue.

### Capers Jones Rule of Thumb
Each software review, inspection, or test step will find and remove 30% of the bugs that are present.

### Pesticide Effect Example
* Assume we start with 100 bugs
* WE use 4 fault detection techniques
  * Each detects 70% of existing at that time

How many bugs would remain at the end?

$$
\text{Remaining Bugs} = 1000 \times (0.3)^4 = 1000 \times 0.0081 = \boxed{8.1}
$$

**After Technique 1:**
Detects 70% of 1000 = 700 bugs
Remaining: 1000 - 700 = 300 bugs

**After Technique 2:**
Detects 70% of 300 = 210 bugs
Remaining: 300 - 210 = 90 bugs

**After Technique 3:**
Detects 70% of 90 = 63 bugs
Remaining: 90 - 63 = 27 bugs

**After Technique 4:**
Detects 70% of 27 = 18.9 bugs
Remaining: 27 - 18.9 = 8.1 bugs

### Quiz
1. When is verification undertaken in the waterfall model?
   * Requirements analysis, design & coding phases
2. When is testing undertaken in the waterfall model?
   * Coding & testing phases
3. When is validation undertaken in the waterfall model?
   * Testing phase

### V Life Cycle Model
* Variant of the waterfall model
  * Emphasizes **Verification** & **Validation** **(V & V)** activities
  * **(V & V)** activities are spread over the entire life cycle
* **In every phase of development testing activities are planned in parallel with development**

<table>
    <tr>
      <th>Development</th>
      <th>Testing</th>
   </tr>
<tr>
      <td>Need, Wish, Policy, Law Planning</td>
      <td>Operational System</td>
   </tr>
   <tr>
      <td>User Requirements</td>
      <td>Acceptance Tests</td>
   </tr>
   <tr>
      <td>System Requirements</td>
      <td>System Tests</td>
   </tr>
   <tr>
      <td>High Level Design</td>
      <td>Integration Tests</td>
   </tr>
   <tr>
      <td>Detailed Design</td>
      <td>Unit/Component Tests</td>
   </tr>
   <tr>
      <td style="text-align:center;" colspan="2">Implementation</td>
   </tr>
</table>

#### Advantages of the V-model
* Emphasizes planning for verification & validation of the software
* Each deliverable is made testable
* Intuitive & easy to use

#### Disadvantages of the V-model
* Doesn't support overlapping phases
* Doesn't support iterations
* Not easy to handle later changes in requirements
* Does not support any risk handling method

#### When to Use V-model
* Natural choice for systems requiring high reliability
  * Example: Embedded control applications
    * All requirements are known up-front
    * Solution & technology are known

### How Many Latent Errors?
* Several Independent Studies conclude:
  * 85% of errors get removed at the end of a typical testing process
  * **Why not more?**
    * All practical test techniques are basically heuristics, they help reduce bugs but do not guarantee complete bug removal 
    * i.e. Testing techniques are not perfect formulas — they are useful, experience-based strategies that help guide testing, even though they can’t catch every bug.

### Fault Model
* Types of faults possible in a program
* Some types of faults can be ruled out:
  * Example: File-related issues if program doesn't deal with files

### Fault Model of an OO Program
<table>
   <tr>
      <th colspan="5">Faults in an OO Program</th>
   </tr>
   <tr>
      <th style="text-align:center;" colspan="3">Structural Faults</th>
      <th style="text-align:center;" colspan="2">Algorithmic Faults</th>
   </tr>
   <tr>
      <td>Procedural Faults</td>
      <td>Traceability Faults</td>
      <td>OO Faults</td>
      <td>Incorrect Result</td>
      <td>Inadequate Performance</td>
</table>

### Hardware Fault-Model
* Essentially only 4 types:
  * Stuck-at 0
  * Stuck-at 1
  * Open circuit
  * Short circuit
* Testing is therefore simple
  * Devise ways to test the presence of each
* Hardware testing is usually fault-based testing

### Test Cases
* Each test case is typically designed to verify that a specific functionality works as intended.
  * Executes some program elements
  * For certain restricted types of faults, fault-based testing can be used.

## Basic Concepts in Testing - Part 2
### Test Cases
* Each test case is usually designed to verify the correct functioning of a specific feature.
  * Executes some program elements
  * For certain restricted types of faults, fault-based testing can be used
* A test case is a triplet [I, S, O]
  * **I** is the data to be input into the system
  * **S** is the state of the system at the point which the data will be inputted
  * **O** is the expected output of the system
### Test Cases vs. Test Data
* Test Cases:
  * Inputs to test the system
  * State of the software
  * The predicted outputs from the input

* Test Data: 
  * Inputs used to test the system

### What are Negative Test Cases?
* **Purpose:**
  * Helps to ensure that the application gracefully handled invalid & unexpected user inputs & that the application does not crash. 
  * Example: letter in a numeric field

### Test Suite
* Testing software using a set of carefully designed test cases
* The set of all test cases is called the **Test Suite**

### Test Execution Example: Return Book
* Test Case [I, S, O]
1. Set the program in the required state:
   * Book record created
   * Member record created
   * Book issued
2. Give the defined input:
   * Select renew book option and request to renew for another 2 week period
3. Observe the output:
   * Compare it to the expected output

### Sample: Recording of Test Case & Results
* Test Case ID
* Test Case Author
* Test Purpose
* Pre-conditions
* Test Inputs
* Expected Outputs
* Post-conditions
* Test execution history
  * Test execution date
  * Test executor
  * Test execution results : Pass/Fail
    * If failed - Failure information & fix status

### Test Team - Human Resources
* **Test Planning**: Experienced People
* **Test Scenario & Test Case Design**: Experienced & Qualified People
* **Test Execution**: Semi-experienced to inexperienced
* **Test Result Analysis**: Experienced People
* **Test Tool Support**: Experienced People
* May include external people:
  * Users
  * Industry experts

### Who do Test Case Design?
* Exhaustive testing of any non-trivial system is impractical
  * Input data domain is extremely large
* Design an optimal test suite, meaning:
  * Of reasonable size, and
  * Uncovers as many errors as possible
* If test cases are selected randomly:
  * Many test cases would not contribute to the significance of the test suite
  * Would only detect errors that are already detect by other test cases in the suite
* Therefore, the number of test cases in a randomly selected test suiteL
  * **DOES NOT** indicate the effectiveness of testing

### Design of Test Cases
* Testing a system using a large number of randomly selected test cases **does not** mean that most errors in the system will be uncovered!
* Consider the following example:
  * Find the maximum of two integers x and y
  * The code has a simple programming error:
```java
if (x > y):
    max = x;
else:
    max = x; // should be max = y;
```
* Test suite `[(x = 3, y = 2), (x = 2, y = 3)]` can detect the bug
* A larger test suite `[(x = 3, y = 2), (x = 4, y = 3), (x = 5, y = 1)]` does not detect the bug

### Test Plan
* Before testing activities start, a test plan is developed
* The test plan documents the following
  * Features to be tested
  * Features that won't be tested
  * Test strategy
  * Test suspension criteria
  * Test effort
  * Test schedule

### Design of Test Cases
* Systematic approaches are required to design an effective test suite:
  * Each test case in the suite should target different faults

### Testing Strategy
* Test Strategy primarily addresses:  
  * Which types of tests to deploy?
  * How much effort to devote to which type of testing?
    * Black-box: Usage-based testing (based on customers actual usage patterms)
    * White-box: Structure based


### When & Why of Unit Testing?
* Unit testing carried out:
  * After coding of a unit is complete and it compiles successfully
* Unit testing reduces debugging effort substantially

### Why unit test?
* Without unit test:
  * Errors become difficult to track down
  * Debugging cost increases substantially

## Unit Testing
* Testing of individual methods, modules, classes or components in isolation:
  * Carried out before integrating with other parts of software being developed
* Support required for unit testing
  * **Stub**
    * Simulates the behaviour of a function that has not yet been written
  * **Driver**
    * Simulates behaviour of a function that calls and supplies data to the function being tested

Stubs are primarily used to represent low-level modules. Drivers are used to represent high-level modules

### Quiz
**Q:** Unit testing can be considered as which one of the following types of activites?
  * Verification
  * Validation
**A:**
  * Verification

### Design of Unit Test Cases
* There are essentially 3 main approaches to test case design
  1. Black-box approach
  2. White-box approach (glass-box)
  3. Grey-box approach - Testers have partial knowledge of the application's internal structure and code, allowing them to leverage this knowledge to create more targeted and effective tests

### Black-box Testing 
* Considers the software as a black box:
  * Input &rarr; Software &rarr; Output
  * Test cases are designed using only functional specification of the software 
    * No knowledge of the internal structure of the software necessary
* Also known as:
  * Data-driven testing 
  * IO driven testing
* **The goal is to achieve the thoroughness of exhaustive input testing with much less effort!!**

#### Black-box Testing - Difficulties
* Data domain is large
* A function may take multiple parameters:
  * Combinations of values for different parameters need to be considered
  * **Example**: Consider ``int check-equal(int x, int y)``
    * Assuming the int in java (32 bits)
    * int x → 32 bits → 2³² possible values.
    * int y → 32 bits → 2³² possible values.
    * Input space = 2³² x 2³² = 2⁶⁴
    * Time to test each combination = 10 seconds.

It would take 2⁶⁴ X 10 = 184,467,440,737,095,516,160 seconds = ~5.85 trillion years to enter all combinations

#### Black-box Testing - Solution
* Construct model of the data domain
  * Called domain based testing
  * Select data based on the domain model

### Black-box Test Types
* Scenario Coverage
* Equivalence class partitioning
* Special value (risk-based) testing
  * Boundary value testing
  * Cause-effect (Decision Table) testing
  * Combinatorial testing
  * Orthogonal array testing

#### Black-box Testing - Equivalence class partitioning
* The input values to a program are partitioned into equivalence classes so that:
  * Program behaves in similar way for every input value belonging to an equivalence class
  * Testing code with any one representative value from an equivalence class is as good as testing using any other values from the class

_How to identify equivalence classes?_
* Identify scenarios
* Examine the input data
* Examine output/result

_Guidelines_
* If an input conditions specifies a range, one valid and 2 invalid classes are defined
* If an input conditions specifies a member of a set, one valid and one invalid class are defined
* If an input condition is boolean, one valid and one invalid class are defined

### White-box Testing
* To design test cases:
  * Knowledge of internal structure of software is necessary
  * White-box testng is also called structural testing


## Lesson Summary
The key points from this module are:
The software development life cycle model, the V model is a variant of the waterfall model, with testing activities spread over the entire life cycle. Testing activities are planned in parallel with development.
In hardware, there are essentially only four types of bugs:
1. Stuck at 0
2. Stuck at 1
3. Open circuit
4. Short circuit
   Therefore, testing hardware can be easy.

A test case typically tries to establish the correct working of some functionality. The test team is broken down to different roles; panning, scenario and case design, test execution, result analysis, tools support and external people.
Black box test cases are designed using the functional specification of the software, without knowledge of the internal structure.
Unit testing is testing of individual methods, modules, classes, or components in isolation, their carried out before integrating with other parts of the software being developed.