[🔙 Home](../home.md)

# Use Case Testing
* Identify test cases that exercise the whole system on transaction by transaction basis from start to finish (scenarios of use cases)
* Use case – a description of the use of the system by an actor (user, external hardware, other components or systems)
* Use cases are associated with actors & subjects (component or system to which the use case is applied)
* Each use case specifies some behaviour that a subject can perform with one or more actors
* Use case can be described by:
  1. Interactions
  2. Activities
  3. Preconditions
  4. Post-conditions
* Interactions between actors & the subject may result in changes to the state of the subject
* Interactions can be represented using workflows, activity diagrams, business process models
* Mostly at the system & acceptance levels
* Good at finding defects in the real world use of the system
* Tests are designed to exercise the defined behaviours:#
  * Basic
  * Exceptional
  * Alternative
  * Error Handling
* Coverage Calculation:

$$
\frac{\textbf{No. of use case behaviours tested}}{\textbf{Total no. of use case behaviours}} \times 100\%
$$

### Use Case Testing - Example
**Use Case:**
* User Inserts the card
* System validates the card & asks for the PIN.
* Actor enters PIN 
* System validates the PIN. 
* If valid, account access is granted.
* If the card is not valid, a message is shown & the card is rejected. 
* After 3 incorrect PIN attempts, the card is eaten.

<table>
  <tr>
    <th style="background-colour: #787676;"></th>
    <th style="background-colour: #787676;">Step</th>
    <th style="background-colour: #787676;">Description</th>
  </tr>
  <tr>
    <td rowspan="5">Main Success Scenario<br>A: Actor<br> S: System</td>
    <td>1</td>
    <td>A: Inserts card</td>
  </tr>
  <tr>
    <td>2</td>
    <td>S: Validates card & asks for PIN</td>
  </tr>
 <tr>
    <td>3</td>
    <td>A: Enters PIN</td>
  </tr>
 <tr>
    <td>4</td>
    <td>S: Validates PIN</td>
  </tr>
 <tr>
    <td>5</td>
    <td>S: Allows account access</td>
  </tr>
  <tr>
    <td rowspan="3">Extensions</td>
    <td>2a</td>
    <td>Card Not Valid<br>S: Display message & reject card</td>
  </tr>
  <tr>
    <td>4a</td>
    <td>PIN not valid<br>S: Display message & ask for retry (twice)</td>
  </tr> 
  <tr>
    <td>4b</td>
    <td>PIN invalid 3 times<br>S: Eat card & exit</td>
  </tr>
</table>