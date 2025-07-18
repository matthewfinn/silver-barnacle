## Learning Outcomes
* Discuss the use of equivalence class testing. 
* Identify special value testing. 
* Recognize the process of Boundary Value Analysis testing.


## Equivalence Partitioning
* A set of input values constitute an equivalence class if the tester believes these are processed identically
* First-level partitioning:
  * Valid vs. Invalid test cases
  * Create a test case for at lease one value from each equivalence class

#### Example 1
Program takes a value between 1 and 5000

|  Class  | Value |
|:-------:|:------|
| Invalid | -11   |
|  Valid  | 1001  |
| Invalid | 5007  |

#### Example 2
```java
Image fetchImage(String url){
    // some logic
    
    reture Image;
}
```

* **Equivalence Definition 1:** Partition based on URL protocol
  * `http`, `https`, `ftp`, `file` etc.
* **Equivalence Definition 2:** Partition based on the type of file being retrieved
  * PNG, GIF, JPEG etc.

### Example 3

<table>
   <tr>
      <th style="text-align: center;">Input</th>
      <th style="text-align: center;">Valid Equivalence Class</th>
      <th style="text-align: center;">Invalid Equivalence Class</th>
   </tr>
   <tr>
      <th style="text-align: center;">An Integer N such that -99 <= N <= 99</th>
      <td style="text-align: center;">[-99, 99]</td>
      <td style="text-align: center;">
         <ul>
            <li>< -99</li>
            <li>> 99</li>
            <li>Malformed Numbers (12-, 1-2-3, ...)</li>
            <li>Non-numeric strings (junk, 1E2, $13)</li>
            <li>Empty Value</li>
         </ul>
      </td>
   </tr>
   <tr>
      <th style="text-align: center;">Phone Number Area Code: [11, ..., 999] Suffix: Any 6 digits</th>
      <td style="text-align: center;">[11, 999], [000000, 999999]</td>
      <td style="text-align: center;">
         <ul>
            <li>Invalid format 5555555, (555)(555) 555566 etc.</li>
            <li>Area Code < 11 or > 999</li>
            <li>Area Code with non-numeric characters</li>
            <li>Similar for Prefix and Suffix</li>
         </ul>
      </td>
   </tr>
</table>

### Weak Equivalence Class Testing
Weak equivalence class testing is a black-box testing technique where one representative value from each valid or invalid equivalence class is selected for testing. This approach is based on the "single fault assumption," meaning it assumes that if one value within an equivalence class causes a failure, all other values in that class will likely cause a similar failure. 

**Single Fault Assumption:**
This fundamental principle of weak equivalence class testing assumes that if a test case using one value from an equivalence class fails, all other values in that same class will likely fail in a similar way.


### Strong Equivalence Class Testing, 
Strong Equivalence Class Testing, a black box testing technique, involves creating test cases that cover all combinations of valid and invalid inputs within equivalence classes. This method aims to identify more potential errors than weak equivalence class testing by testing multiple faults simultaneously. 

**Key aspects of strong equivalence class testing:**
* Multiple Fault Assumption:
  * Unlike weak testing, which assumes only one fault can exist at a time, strong testing considers the possibility of multiple faults occurring simultaneously.

* Cartesian Product:
  * Strong equivalence class testing often utilizes the Cartesian product of equivalence classes to generate test cases, ensuring comprehensive coverage.
  * The Cartesian product of two sets, A and B, denoted A × B, is a set containing all possible ordered pairs where the first element of each pair comes from set A and the second element comes from set B. Essentially, it's a way to combine elements from two sets to create new pairs.

* Valid and Invalid Inputs:
  * Both valid and invalid input values within each equivalence class are included in the test cases.

* Robustness:
  * Strong testing can be further categorized into strong normal (valid inputs only) and strong robust (both valid and invalid inputs).

* Redundancy:
  * While comprehensive, strong equivalence class testing can sometimes lead to redundant test cases, especially when dealing with independent variables. 
  
In essence, strong equivalence class testing provides a more thorough approach to testing by exploring combinations of valid and invalid inputs, but it may require more test cases and could potentially include redundant tests compared to weaker forms of equivalence class testing. 

### Quiz 1
* Design Equivalence class test cases:
* A bank pays different rates of interest on a deposit depending on the deposit period
  * 3% for deposit up to 15 days
  * 4% for deposit over 15 days and up to 180 days
  * 6% for deposit over 180 days and up to 1 year
  * 7% for deposit over 1 year but less than 3 years
  * 8% for deposit 3 years and above

**Resulting Equivalence classes**
`[< 0], [0, 15], [16, 180], [181, 1 year], [1 year + 1 day, 3 years - 1 day], [3 years + ...]`
### Quiz 2
* Design Equivalence class test cases:
* A bank pays different rates of interest on a deposit depending on the deposit period and the balance
* For deposits of less than €1000
  * 6% for deposit up to 1 year
  * 7% for deposit over 1 year but less than 3 years
  * 8% for deposit more than 3 years
* * For deposits of €1000 or more
  * 7% for deposit up to 1 year
  * 8% for deposit over 1 year but less than 3 years
  * 9% for deposit more than 3 years

**Resulting Equivalence classes**
* Valid Classes: 
`[0 days -> 1 year, €0 -> €999.99], [1 year + 1 day -> 3 years, €0 -> €999.99], [3 years + 1 day -> ..., €0 -> €999.99]
[0 days -> 1 year, €1000 -> ...], [1 year + 1 day -> 3 years, €1000 -> ...], [3 years + 1 day -> ..., €1000 -> ...]`
* Invalid Classes:
`[0 days -> 1 year, < €0], [1 year + 1 day -> 3 years, < €0], [3 years + 1 day -> ..., < €0]
[NaN, < €0], [NaN, €0 -> €999.99], [NaN, €1000 -> ...] , [NaN, NaN]`

### Quiz 3
* Design Equivalence class test cases:
  * Consider a program that takes 2 strings of maximum length 20 and 5 characters
  * Checks if the 2nd string is a substring of the first
  * `substr(s1, s2)`

**Resulting Equivalence classes**
`[s2 is a substring], [s2 is not a substring], [s1 > 20, s2 > 5], [s1 <= 20, s2 > 5], [s1 > 20, s2 <= 5]`

## Special Value Testing
Special Value Testing is a black box testing technique that focuses on testing with input values that are likely to cause errors or failures, particularly at the boundaries of equivalence classes or other "special" values. It relies on the tester's experience and intuition to identify these potential problem areas. 

* What are special values?
  * The test has reasons to believe these values would execute statements that have the risk of containing bugs
  * **General risk:** Example - Boundary value testing
  * **Special risk:** Example - Leap year not considered

### Boundary Value Analysis
* Create test cases to test boundaries of equivalence classes
* Some typical programming errors occur:
  * At boundaries of equivalence classes
  * Might be purely due to psychological factors
* Programmers often fail to see special processing required at the boundaries of equivalence classes
* Programmers may mistakenly use `<` instead of `<=`
  * Select test cases at the boundaries of different equivalence classes

#### Boundary Value Analysis: Guidelines
* If an input condition specifies a number of values:
  * Test cases should exercise minimum and maximum numbers
  * Values just above minimum and below maximum should also be tested
* **Example:** If an input condition specifies a range bound by values a and b
  * Test cases should be designed with value a and b and just above a and just below b
  *  Integer D with input range [-3, 10]
  * test values: [-3, -2, 0, 9, 10]

#### Boundary Value Testing: HR Application example
* Process employment applications based on a persons years of experience

| Year of Experience |                              Result                              |
|:------------------:|:----------------------------------------------------------------:|
|       0 - 2        | Do not hire - not enough experience for particular role openings |
|       2 - 5        |                      May hire as mid level                       |
|       5 - 10       |                        May hire as senior                        |
|      10 - 50       |                      May hire as principal                       |

* Notice the probelm at the boundaries, i.e. 2 years of experience is included in two different equivalence classes (as is 5 & 10)

**Code Example**
Flawed logic below, for example 2 years experience would satisfy conditions for both the 1st and 2nd statement
```java
if(applicantYOE >=0 && applicantYOE <=2)
    hireStatus = "NO";
else if(applicantYOE >=2 && applicantYOE <=5)
    hireStatus = "Mid";
else if(applicantYOE >=5 && applicantYOE <=10)
    hireStatus = "Senior";
else if(applicantYOE >=10 && applicantYOE <=50)
    hireStatus = "Principal";
```

* Corrected boundaries

  | Year of Experience |                              Result                              |
  |:------------------:|:----------------------------------------------------------------:|
  |       0 - 1        | Do not hire - not enough experience for particular role openings |
  |       2 - 4        |                      May hire as mid level                       |
  |       5 - 9        |                        May hire as senior                        |
  |      10 - 50       |                      May hire as principal                       |

* What about -2 YOE & 55 YOE?
* The requirements do not specify how these values should be treated

**Corrected Code Example**
```java
if(applicantYOE >= 0 && applicantYOE < 2)
    hireStatus = "NO";
else if(applicantYOE >= 2 && applicantYOE < 5)
    hireStatus = "Mid";
else if(applicantYOE >= 5 && applicantYOE < 10)
    hireStatus = "Senior";
else if(applicantYOE >= 10 && applicantYOE <= 50)
    hireStatus = "Principal";
```
* Special Values on or near the boundaries are `[-1, 0, 1], [1, 2, 3], [3, 4, 5], [4, 5, 6], [8, 9, 10], [49, 50, 51]`

#### Boundary Value Testing: Square Root Function Example
* For a function that computes the square root of an integer in the range 1 - 5000
* Test cases must include `[0, 1, 2, 4999, 5000, 5001]`, Optionally include a mid range/ nominal value for more thorough testing i.e. 2000

#### Boundary Value Testing: Employee Age Example
* Consider a program that reads the age of employees and computes the average age
* Assume valid age is 1 to 100
* Test cases must include `[0, 1, 2, 50, 99, 100, 101]`

#### Independent Data
* Support there are 2 distinct inputs that are assumed to be independent of each other
  * Input 1: Years of Education (1 to 23)
  * Input 2: Age (1 to 100)
* If they're independent of each other then we can start with 7 + 7 = 14 sets (if we're also considering invalid values)

LBV = Lower Boundary Value
UBV = Upper Boundary Value

|         | Years of Education | Age |
|:-------:|:------------------:|:---:|
| LBV - 1 |         0          |  0  |
|   LBV   |         1          |  1  |
| LBV + 1 |         2          |  2  |
| Nominal |         12         | 50  |
| UBV - 1 |         22         | 99  |
|   UBV   |         23         | 100 |
| UBV + 1 |         24         | 101 |

* In general when not considering negative test cases we need `4z + 1` test cases for `z` independent inputs

#### Single Fault Assumption
* **Premise:** "Failures rarely occur as the result of simultaneous occurrences of two or more faults"
* **Hold the values of all but one variable at their nominal values and let that one variable assume its extreme value!**

#### Robustness Testing
* An extension of Boundary Values to include
  * Less than minimum
  * Greater than maximum
* The testing of robustness is really a test of error handling
  1. Did we anticipate the error situations?
  2. Did we issue informative error messages?
  3. Did we allow some kind of recovery from the error?

#### Some Limitations of Boundary Value Testing

Boundary Value Testing (BVT) is very useful for **numeric inputs**, where we can clearly identify minimum, maximum, and boundary-adjacent values. However, it has some **limitations** when applied to other types of inputs.

##### 1. Handling Boolean Variables
- **Limitation:** Boolean variables only have two possible values: `true` and `false`.
- **Explanation:** Since there are no "boundaries" in the numeric sense, boundary value testing **does not apply**.
- **What to Do:** For booleans, you simply test **both possible values** (true and false), typically using **equivalence class testing** instead.

##### 2. Handling Non-Numerical Variables (e.g., Text/String Inputs)
- **Limitation:** With strings or textual inputs, there’s **no numeric boundary** like min/max numbers.
- **Explanation:** You cannot apply traditional boundary analysis (like `min`, `min+1`, `max-1`, `max`) on textual data directly.
- **What to Consider Instead:**
  - **Length Boundaries:** You can apply boundary testing to the **length** of the text (e.g., empty string, 1 character, maximum allowed length).
  - **Lexical Boundaries:** Sometimes, you can consider **alphabetical order** (e.g., testing strings like "a", "z").
  - **Special Characters:** Test cases may include boundary conditions around **allowed vs disallowed characters** (e.g., including symbols, whitespace).
- **Summary:** For text inputs, boundary testing usually focuses on **input length** or **format restrictions**, not numeric boundaries.

##### Summary Table

| Variable Type | Can BVT Be Applied? | Notes                                                                               |
|---------------|---------------------|-------------------------------------------------------------------------------------|
| Numeric       | ✅ Yes               | Classic use of BVT with min, max, and just-inside/outside values.                   |
| Boolean       | ❌ Not Applicable    | Only two valid values; use equivalence partitioning instead.                        |
| Text/String   | ⚠️ Limited Use      | Can test **length boundaries** and **format-based limits**, not numeric boundaries. |

#### Quiz: BB Test Design
* Design a black box test suite for a function that solves the quadratic equation of the form `ax^2 + bx + c = 0`

**Equivalence classes**
* Invalid Equation
* Valid Equation: Roots? Complex, Real, Coincident, Unique

##### 1. Invalid Equation
- **Description:** The equation is not quadratic (e.g., `a = 0`).
- **Test Cases:**
  | Test Case | a | b | c | Expected Outcome |
  |------------|---|---|---|------------------|
  | Invalid - Linear Equation | 0 | 2 | 3 | Error or "Not quadratic" |
  | Invalid - Invalid Equation | 0 | 0 | 3 | Error or "Invalid equation" |

##### 2. Valid Quadratic Equations

###### A. Complex Roots (Discriminant < 0)
- **Description:** When the discriminant is less than zero (`D < 0`), the quadratic equation has **two complex conjugate roots**. This means there are **no real number solutions**, and the roots will involve the imaginary unit `i` (square root of -1).

Example Explanation:
- **Equation:** `1x² + 2x + 5 = 0`
- **Coefficients:** a = 1, b = 2, c = 5
- **Discriminant (D): D = b² - 4ac = 2² - 4(1)(5) = 4 - 20 = -16**

- **Since D = -16 < 0, the roots are complex**.
- **Expected Outcome:** Two complex roots, e.g., `x₁ = -1 + 2i`, `x₂ = -1 - 2i`.

**Test Case:**
| Test Case      | a  | b  | c  | Discriminant (D) | Expected Outcome           |
|-----------------|----|----|----|------------------|----------------------------|
| Complex Roots   | 1  | 2  | 5  | -16              | Two complex conjugate roots |

###### B. Real and Distinct Roots (Discriminant > 0)
- **Description:** Two unique real roots.
- **Test Case:**
  | Test Case | a | b | c | Discriminant (D) | Expected Outcome |
  |------------|---|---|---|------------------|------------------|
  | Two Real Roots | 1 | -3 | 2 | 1 | Two real distinct roots |

###### C. Real and Coincident Roots (Discriminant = 0)
- **Description:** One repeated real root.
- **Test Case:**
  | Test Case | a | b | c | Discriminant (D) | Expected Outcome |
  |------------|---|---|---|------------------|------------------|
  | Coincident Root | 1 | 2 | 1 | 0 | One repeated real root |

---

##### Summary Table

| Class | Description | Example Equation | Example Coefficients (a, b, c) |
|--------|---------------------------|-----------------------------|---------------------------------|
| Invalid | Not a quadratic equation | `0x² + 2x + 3 = 0` | (0, 2, 3) |
| Complex Roots | D < 0 | `1x² + 2x + 5 = 0` | (1, 2, 5) |
| Real Unique Roots | D > 0 | `1x² - 3x + 2 = 0` | (1, -3, 2) |
| Real Coincident Roots | D = 0 | `1x² + 2x + 1 = 0` | (1, 2, 1) |

## Lesson Summary
**The key points from this module are:**
* Equivalence class and Special Value testing is a testing strategy for black box testing.
* Equivalence class testing divides the input data of a software unit into partitions of equivalent data from which test cases can be derived. With creating equivalence classes, you create one for both an invalid and a valid set of values.
* Special Value testing is where the tester has reason to believe certain values would fail when executing the program.
* Boundary Value Analysis is selecting test cases at the boundaries of different equivalence classes. The basic boundary value testing would include 5 situations:
  1. at minimum boundary
  2. immediately above minimum
  3. between minimum and maximum
  4. immediately below maximum
  5. at maximum boundary
   
* Robustness testing is an extension of Boundary values, it is really a test of error handling, asking:
  1. did you anticipate the error situations?
  2. did you issue informative error messages?
  3. did you allow some kind of recovery from the error?