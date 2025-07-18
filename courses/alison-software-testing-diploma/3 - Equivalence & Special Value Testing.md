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

#### Quiz: BB Test Design
* Design a black box test suite for a function that solves the quadratic equation of the form `ax^2 + bx + c = 0`

#### Some Limitations of Boundary Value Testing
* How to handle boolean variables?
* What about non-numerical variables where the values may be text?

## Lesson Summary
