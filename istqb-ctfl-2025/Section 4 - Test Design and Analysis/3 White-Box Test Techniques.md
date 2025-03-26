[🔙 Home](../home.md)



# White-box Test Techniques

* Aka **structure-based** techniques 
* Based on an analysis of the architecture, detailed design, internal structure, code and processing **within** the test object 
* Test cases are dependent on the **internal** structure and processing within the test object 
* Software design is the basis for test cases, so test cases can not be created before the design or implementation of the test object

### Characteristics
* Test conditions, test cases and test data are derived from a test basis that may include 
  * Code
  * Software Architecture
  * Detailed design
  * Any other info regarding the software structure
* Specifications are often used as an additional source of information to determine the expected outcome of test cases
* **Coverage** is measured based on the items tested **within** a selected structure (i.e. code or interfaces)
* Based on how the software is constructed and designed, internal structure of the software is used to derive test cases
* Mainly on component level, but also on integration and system/ acceptance level
* Serves 2 purposes:
    1. Test coverage **measurement** (from specification-based techniques)
    2. Structural **test case design** (to increase test coverage)
* Basic coverage measure is:
  $$
  \frac{\textbf{No. of coverage items exercised}}{\textbf{Total no. of coverage items}} \times 100\%
  $$
* 100 % coverage does NOT equal 100 % tested
* Drawback is that code coverage measurement ONLY covers what HAS been written, the structure that is already there
  * Specified function not implemented – Specification-based techniques
  * Specification missing a function – Experience-based techniques

### Coverage
* Can be measured on all levels
  * **System / Acceptance levels**
    * Requirements, menu options, screens, database structural elements, files, etc
  * **Integration level**
    * API testing, Interfaces, interactions, call coverage of modules, objects or procedures, etc
  * **Component level**
    * Code coverage such as statement, decision, branch, path coverage
* Sometimes use coverage not related to the code (neuron coverage in neural network testing for example)
* Coverage can be measured for any test technique
  * Black-box test techniques
  * White-box test techniques
  * Experience-based test techniques

### Why White-Box Testing?
* Provides an objective measurement of code coverage
* Provides information needed to create additional tests to **increase** the coverage and increasing the confidence in the code
* The entire software implementation is considered, defects can be found even if the software specs are:
  * Vague
  * Outdated
  * Incomplete
* However, missing requirements will not be found by white-box testing
* Can also be used in static testing:
  * Dry runs of the code
  * Reviewing:
    * Code that is not ready for execution, pseudo-code, high-level or top-down logic that can be modeled with a Control Flow Graph