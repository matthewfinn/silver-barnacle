## Learning Outcomes
* Distinguish between the three strategies for combinatorial testing.
* Identify decision table-base testing and its usefulness.
* Recognize pair-wise testing.
* Discuss white-box testing and its types of strategies.

## Combinatorial Testing
### Motivation
* The behaviour of a program may be impacted by many factors:
  * Input parameters
  * Environment configurations
  * State variables
  * etc...
* Equivalence partitioning of an input variable:
  * Identify the possible types of input values requiring different processing
* If the factors are more than 2 or 3:
  * It's impractical to test all possible combinations of values of all factors
* Ofter the specific action to be performed depends on the value of a set of boolean variables
  * Controller applications
  * User interfaces

### Test Types
* Several types of combinatorial testing strategies
  * Decision table based testing
  * Cause effect graphing
  * Pair-wise testing

### Decision table based testing
* Applicable to requirements involving conditional actions
* Can be automatically translated into code
  * Conditions = inputs
  * Actions = outputs
  * Rules = test cases
* Assumes the independence of inputs

**Example 1**
<table style="border-collapse: collapse; text-align: center;">
  <thead style="background-color: #f2f2f2;">
    <tr>
      <th>Condition / Action</th>
      <th>Rule 1</th>
      <th>Rule 2</th>
      <th>Rule 3</th>
      <th>Rule 4</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Condition 1:</strong> Customer is a member</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>No</td>
      <td>No</td>
    </tr>
    <tr>
      <td><strong>Condition 2:</strong> Purchase amount ≥ €100</td>
      <td>Yes</td>
      <td>No</td>
      <td>Yes</td>
      <td>No</td>
    </tr>
    <tr style="background-color: #d9ead3;">
      <td><strong>Action 1:</strong> Give 10% discount</td>
      <td>Yes</td>
      <td>No</td>
      <td>No</td>
      <td>No</td>
    </tr>
  </tbody>
</table>

| Test Case ID | Customer is Member? | Purchase Amount (€) | Expected 10% Discount? | Description                               |
|--------------|---------------------|---------------------|------------------------|-------------------------------------------|
| TC1          | Yes                 | 150                 | Yes                    | Member with purchase ≥ €100 gets discount |
| TC2          | Yes                 | 80                  | No                     | Member with purchase < €100 no discount   |
| TC3          | No                  | 150                 | No                     | Non-member purchase ≥ €100 no discount    |
| TC4          | No                  | 50                  | No                     | Non-member purchase < €100 no discount    |
| TC5          | Yes                 | -50                 | Invalid input          | Negative purchase amount (invalid)        |
| TC6          | No                  | "abc"               | Invalid input          | Non-numeric purchase amount (invalid)     |
| TC7          | Maybe               | 100                 | Invalid input          | Invalid membership status (invalid)       |
| TC8          | (empty)             | 120                 | Invalid input          | Missing membership status (invalid)       |



**Example 2**
<table style="border-collapse: collapse; text-align: center; width: 100%; max-width: 600px;">
  <thead style="background-color: #f2f2f2;">
    <tr>
      <th>Condition / Action</th>
      <th>Rule 1</th>
      <th>Rule 2</th>
      <th>Rule 3</th>
      <th>Rule 4</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Condition 1:</strong> Sides satisfy triangle inequality</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>No</td>
    </tr>
    <tr>
      <td><strong>Condition 2:</strong> A = B = C</td>
      <td>Yes</td>
      <td>No</td>
      <td>No</td>
      <td>—</td>
    </tr>
    <tr>
      <td><strong>Condition 3:</strong> Exactly two sides equal</td>
      <td>No</td>
      <td>Yes</td>
      <td>No</td>
      <td>—</td>
    </tr>
    <tr>
      <td><strong>Condition 4:</strong> All sides different</td>
      <td>No</td>
      <td>No</td>
      <td>Yes</td>
      <td>—</td>
    </tr>
    <tr style="background-color: #d9ead3;">
      <td><strong>Action 1:</strong> Triangle Type = Equilateral</td>
      <td>Yes</td>
      <td>No</td>
      <td>No</td>
      <td>No</td>
    </tr>
    <tr style="background-color: #fff2cc;">
      <td><strong>Action 2:</strong> Triangle Type = Isosceles</td>
      <td>No</td>
      <td>Yes</td>
      <td>No</td>
      <td>No</td>
    </tr>
    <tr style="background-color: #fff2cc;">
      <td><strong>Action 3:</strong> Triangle Type = Scalene</td>
      <td>No</td>
      <td>No</td>
      <td>Yes</td>
      <td>No</td>
    </tr>
    <tr style="background-color: #f4cccc;">
      <td><strong>Action 4:</strong> Not a triangle</td>
      <td>No</td>
      <td>No</td>
      <td>No</td>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

| Test Case ID | Side A | Side B | Side C | Expected Triangle Type / Result | Description                       |
|--------------|--------|--------|--------|---------------------------------|-----------------------------------|
| TC1          | 4      | 1      | 2      | Not a triangle                  | Triangle inequality not satisfied |
| TC2          | 1      | 4      | 2      | Not a triangle                  | Triangle inequality not satisfied |
| TC3          | 1      | 2      | 4      | Not a triangle                  | Triangle inequality not satisfied |
| TC4          | 5      | 5      | 5      | Equilateral                     | All sides equal                   |
| TC5          | -1     | 5      | 5      | Invalid input                   | Negative side length              |
| TC6          | 0      | 5      | 5      | Invalid input                   | Zero-length side                  |
| TC7          | "a"    | 5      | 5      | Invalid input                   | Non-numeric input                 |
| TC8          | 5      | 5      | 3      | Isosceles                       | Exactly two sides equal           |
| TC9          | 3      | 5      | 5      | Isosceles                       | Exactly two sides equal           |
| TC10         | 5      | 3      | 5      | Isosceles                       | Exactly two sides equal           |
| TC11         | 3      | 4      | 5      | Scalene                         | All sides different               |

Formally, these must all be true:
* A + B > C
* A + C > B
* B + C > A
If any one of these conditions is false, the three lengths cannot form a valid triangle.

**Example 3**

| Condition / Action                            | Rule 1 | Rule 2 | Rule 3 | Rule 4 | Rule 5 |
|-----------------------------------------------|--------|--------|--------|--------|--------|
| **Condition 1:** Printer power on?            | No     | Yes    | Yes    | Yes    | Yes    |
| **Condition 2:** Printer connected to PC?     | —      | No     | Yes    | Yes    | Yes    |
| **Condition 3:** Paper jam?                   | —      | —      | Yes    | No     | No     |
| **Condition 4:** Ink/toner low?               | —      | —      | —      | Yes    | No     |
| **Action 1:** Turn on printer                 | Yes    | No     | No     | No     | No     |
| **Action 2:** Connect printer to PC           | No     | Yes    | No     | No     | No     |
| **Action 3:** Clear paper jam                 | No     | No     | Yes    | No     | No     |
| **Action 4:** Replace ink/toner               | No     | No     | No     | Yes    | No     |
| **Action 5:** Check printer settings/software | No     | No     | No     | No     | Yes    |


#### Quiz: Develop BB Test Cases
Policy for charging customers for certain in-flight services

>If the flight is more than half full AND the ticket cost more than €300 free meals are served unless it is a domestic flight.
The meals are charged on all domestic flights

|            Condition / Action             | Rule 1 | Rule 2 | Rule 3 | Rule 4 | Rule 5 | Rule 6 | Rule 7 | Rule 8 |
|:-----------------------------------------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|
|   **Condition 1:** More than half full?   |   N    |   N    |   N    |   Y    |   Y    |   Y    |   N    |   Y    |
| **Condition 2:** More than €300 per seat? |   N    |   N    |   Y    |   N    |   Y    |   N    |   Y    |   Y    |
|        **Condition 3:** Domestic?         |   N    |   Y    |   N    |   N    |   N    |   Y    |   Y    |   Y    |
|        **Action 1:** Serve Meals?         |        |        |        | **X**  | **X**  | **X**  |        | **X**  |
|            **Action 2:** Free?            |        |        |        |        | **X**  |        |        |        |


Reduce the table by eliminating redundant columns
Items marked with `-` mean the value doesn't impact the actions

|            Condition / Action             | Combination 1 | Combination 2 | Combination 3 | Combination 4 |
|:-----------------------------------------:|:-------------:|:-------------:|:-------------:|:-------------:|
|   **Condition 1:** More than half full?   |       N       |       Y       |       Y       |       Y       |
| **Condition 2:** More than €300 per seat? |       -       |       N       |       Y       |       Y       |
|        **Condition 3:** Domestic?         |       -       |       -       |       N       |       Y       |
|        **Action 1:** Serve Meals?         |               |     **X**     |     **X**     |     **X**     |
|            **Action 2:** Free?            |               |               |     **X**     |               |

#### Assumptions Regarding Rules
**Rules need to be complete:**
  * That is, every combination of decision table values including default combinations are present
**Rules need to be consistent:**
  * There is no two different actions for the same combinations of conditions

#### Guidelines & Observations
Decision Table testing is most appropriate for programs where:
* There's a lot of decision making
* There are important logical relationships among input variables
* There are calculations involving subsets of input variables
* There are cause and effect relationships between input and output
* There's complex computation logic

**Decision tables do not scale up well**


#### Quiz: Design Test Cases
Customers on an e-commerce site get the following discount
* A member gets 10% discount for a purchase lower than €100, else 15% discount
* Purchases using a Revolut card get 5% discount
* If the purchase amount after all discounts exceeds €100 then shipping is free

| **Conditions / Actions**                     | **Rule 1** | **Rule 2** | **Rule 3** | **Rule 4** | **Rule 5** | **Rule 6** | **Rule 7** | **Rule 8** |
|----------------------------------------------|------------|------------|------------|------------|------------|------------|------------|------------|
| **Condition 1:** Member?                     | Yes        | Yes        | Yes        | Yes        | No         | No         | No         | No         |
| **Condition 2:** Purchase amount ≥ 100€?     | Yes        | Yes        | No         | No         | Yes        | Yes        | No         | No         |
| **Condition 3:** Revolut payment?            | Yes        | No         | Yes        | No         | Yes        | No         | Yes        | No         |
| **Action 1:** Apply Member Discount (10/15%) | 15%        | 15%        | 10%        | 10%        | 0%         | 0%         | 0%         | 0%         |
| **Action 2:** Apply Revolut Discount (5%)    | Yes        | No         | Yes        | No         | Yes        | No         | Yes        | No         |
| **Action 3:** Calculate Final Amount         | ✔️         | ✔️         | ✔️         | ✔️         | ✔️         | ✔️         | ✔️         | ✔️         |
| **Action 4:** Free Shipping if final > 100€  | Yes/No\*   | Yes/No\*   | No         | No         | Yes/No\*   | Yes        | No         | No         |



| **Test Case** | **Member?** | **Purchase (€)** | **Revolut?** | **Member Discount** | **Revolut Discount** | **Final Amount (€)** | **Free Shipping?** | **Expected Outcome**                     |
|---------------|-------------|------------------|--------------|---------------------|----------------------|----------------------|--------------------|------------------------------------------|
| TC1           | Yes         | 120              | Yes          | 15%                 | 5%                   | 96.90                | ❌ No               | Discounted price below €100, no shipping |
| TC2           | Yes         | 90               | Yes          | 10%                 | 5%                   | 76.95                | ❌ No               | Lower purchase, discounted below €100    |
| TC3           | Yes         | 120              | No           | 15%                 | 0%                   | 102.00               | ✅ Yes              | Discounted price above €100, free ship   |
| TC4           | Yes         | 90               | No           | 10%                 | 0%                   | 81.00                | ❌ No               | No Revolut, not enough for free ship     |
| TC5           | No          | 120              | Yes          | 0%                  | 5%                   | 108.30               | ✅ Yes              | Only Revolut, final amount > €100        |
| TC6           | No          | 90               | Yes          | 0%                  | 5%                   | 85.50                | ❌ No               | Not enough for free shipping             |
| TC7           | No          | 120              | No           | 0%                  | 0%                   | 120.00               | ✅ Yes              | No discounts but high purchase           |
| TC8           | No          | 90               | No           | 0%                  | 0%                   | 90.00                | ❌ No               | No discounts and low purchase            |

### Cause-Effect Graphs
* Explores combinations of possible inputs
* Specific combinations of inputs (causes) and outputs (effects)
* **Avoids combinatorial explosion**
* Represented as nodes of a cause effect graph
* The graph also includes constraints and a number of intermediate nodes linking causes and effects

#### Example
If depositing less than €1000, rate of interest:
* 1% for deposit up to 1 year
* 2% for deposit over 1 year but less than 3 years
* 2.5% for deposit for 3 years and above

If depositing €1000 or more, rate of interest:
* 2% for deposit up to 1 year
* 2.5% for deposit over 1 year but less than 3 years
* 3% for deposit for 3 years and above

|           Causes           |  Effects  |
|:--------------------------:|:---------:|
|     Deposit <= 1 year      |  Rate 1%  |
| 1 year < Deposit < 3 years |  Rate 2%  |
|     Deposit >= 3 years     | Rate 2.5% |
|      Deposit < €1000       |  Rate 3%  |
|      Deposit >= €1000      |           |

TBC 

## Pairwise Testing


## White-Box Testing

## Lesson Summary