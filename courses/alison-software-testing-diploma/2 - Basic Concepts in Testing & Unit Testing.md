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
    <th>One</th>
    <th>Two</th>
  </tr>
  <tr>
    <td colspan="2">Three</td>
  </tr>
</table>

## Basic Concepts in Testing - Part 2


## Unit Testing

## Lesson Summary