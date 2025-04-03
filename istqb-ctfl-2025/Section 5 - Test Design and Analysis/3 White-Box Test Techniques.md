[🔙 Home](../home.md)



# White-box Test Techniques

* Aka **structure-based** techniques 
* Based on an analysis of the architecture, detailed design, internal structure, code & processing **within** the test object 
* Test cases are dependent on the **internal** structure & processing within the test object 
* Software design is the basis for test cases, so test cases can not be created before the design or implementation of the test object

### Characteristics
* Test conditions, test cases & test data are derived from a test basis that may include 
  * Code
  * Software Architecture
  * Detailed design
  * Any other info regarding the software structure
* Specifications are often used as an additional source of information to determine the expected outcome of test cases
* **Coverage** is measured based on the items tested **within** a selected structure (i.e. code or interfaces)
* Based on how the software is constructed & designed, internal structure of the software is used to derive test cases
* Mainly on component level, but also on integration & system/ acceptance level
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
* Provides information needed to create additional tests to **increase** the coverage & increasing the confidence in the code
* The entire software implementation is considered, defects can be found even if the software specs are:
  * Vague
  * Outdated
  * Incomplete
* However, missing requirements will not be found by white-box testing
* Can also be used in static testing:
  * Dry runs of the code
  * Reviewing:
    * Code that is not ready for execution, pseudo-code, high-level or top-down logic that can be modeled with a Control Flow Graph

### Key White Box Testing Techniques & Coverage Implications
**Statement Coverage**
  * **Definition**: Ensures every executable statement in the code runs at least once.
  * **Implications**: Covers only individual statements, but doesn't test decision-making logic or all branches.
  * **Example**: Testing if each line of code in a function gets executed.

**Decision Testing**
  * **Definition**: Ensures every conditional decision (like if, switch, while) is evaluated to both True and False at least once.
  * **Implications**: Covers decision points in the code but does not guarantee that all branches (paths) are tested. Only the outcomes (True/False) of conditional statements are considered.
  * **Example**: For if (A && B), Decision Testing ensures testing both A && B = true and A && B = false.
  * **Implied Coverage**: Statement Coverage is covered because each decision involves a statement.

**Branch Testing**
  * **Definition**: Ensures that every branch in the code (both conditional and unconditional branches) is executed at least once. This includes both if/else, loops, switch, and any other decision-making structures, as well as unconditional paths like loops.
  * **Implications**: Covers both conditional and unconditional branches in the control flow. Branch Testing includes Decision Testing but goes beyond to ensure all possible branches (true/false outcomes and alternative paths) are executed.
  * **Example**: For if (A && B) {} and else {}, Branch Testing ensures that both the if and else branches are executed.
  * **Implied Coverage**: Decision Testing and Statement Coverage are automatically covered.

**Path Testing**
  * **Definition**: Ensures that all possible execution paths (combinations of branches) through the program are covered at least once.
  * **Implications**: This is the most comprehensive test type, ensuring that all possible combinations of decision points and branches are tested. It covers both Decision and Branch Testing and also includes edge cases where different conditions lead to different execution paths.
  * **Example**: For a function with multiple decision points, Path Testing ensures testing all unique combinations of true/false outcomes for each decision.

**Coverage Hierarchy:**
✔ Path Coverage ⮕ Includes Branch Coverage ⮕ Includes Decision Coverage ⮕ Includes Statement Coverage

The more comprehensive techniques (like Path Testing) inherently include the simpler ones (like Statement or Decision Testing) because they cover broader areas of execution flow.

**Mnemonic to Remember the Order of Coverage:
👉 "Some Dogs Bark Proudly."
(S Statement → D Decision → B Branch → P Path)**

