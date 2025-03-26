[🔙 Back to Index](../index.md)

[🔙 Back to Index](../index.md)

[🔙 Back to Index](../index.md)

# Writing Acceptance Criteria

### User Story Writing – 3C Concept

**Card** – Simple card or other medium accurately describing the user story

**Conversation** – Explains how the software will be used and can be documented or verbal.
Begins during release-planning and continue while the story is scheduled to be picked up.

**Confirmation** – Acceptance criteria are used to confirm whether a story is done and may concern multiple user stories.
Tests should include positive and negative scenarios. Various participants play the role of tester (dev, specialists, testers, etc)

### What are Acceptance Criteria

* The conditions that the implementation of a user story is correct
* Define when a user story must be accepted by the stakeholders
* Test Conditions to be exercised by tests
* Acceptance criteria should cover:
  * Functional characteristics AND
  * Non-Functional characteristics

### Why do we need Acceptance Criteria?

**Acceptance Criteria:**

* Define the scope of the User Story
* Reach consensus among the stakeholders
* Describe both positive **AND** negative scenarios
* Serve as a basis for the user story acceptance testing
* Allow accurate planning and estimation

### How to write Acceptance Criteria?

* Acceptance criteria should be:
  * Well-defined
  * Unambiguous
* Formats to write Acceptance Criteria:
  * Scenario-oriented
  * Rule-oriented

### Scenario-oriented Acceptance Criteria

* Aims to describe how a function or task operates within the context of a user scenario
* Puts focus on:
  * The expected workflow of the user
  * The navigation of the application
* Often using the BDD format:
  * Given (precondition)
  * When (action)
  * Then (result)

##### Example

**User Story:** As a bank card user, I want to be able to request cash from my account at an ATM so that I will be able to receive available money from my account quickly and in different places.

**Scenario:** Requesting the cash from an overdrawn (negative balance) account

<table>
   <tr>
      <th colspan="2" style="background-color: #649864;"><b>User Story:</b> As a bank card user, I want to be able to request cash from my account<br>
         at an ATM so that I will be able to receive available money<br>from my account quickly and in different places.
      </th>
   </tr>
   <tr>
      <td style="background-color: #647b98;" colspan="2"><b>Scenario:</b> Requesting the cash from an overdrawn (negative balance) account</td>
   </tr>
   <tr>
      <td><b>Given</b></td>
      <td>The account is overdrawn</td>
   </tr>
   <tr>
      <td><b>And</b></td>
      <td>The card is valid</td>
   </tr>
   <tr>
      <td><b>When</b></td>
      <td>The bank card user requests cash from an ATM</td>
   </tr>
   <tr>
      <td><b>Then</b></td>
      <td>Ensure the cash is not dispensed</td>
   </tr>
</table>

##### behaviour-Driven Development

* BDD helps developers collaborate with other stakeholders to define accurate tests focused on business needs
* Allows a developer to focus on testing the code based on the expected behaviour
* As tests are based on the exhibited behaviour, the tests are easier to understand
* Specific frameworks to define acceptance criteria based on the ‘given / when / then’ format:
  * Given some initial context,
  * When an event occurs,
  * Then ensure some outcomes.
* From these requirements, the framework generates code (test classes) that dev can use to create test cases

### Rule-oriented Acceptance Criteria

* Define the scope and functionality of a user story
* Uses a list of:
  * Functional and behavioural parameters
* Format looks more like ‘Waterfall’ scenarios – each function listed individually
* This can be in the form of a:
  * Bullet point verification list
  * Tabulated form of input-output mapping

##### Example

<table>
   <tr>
      <th colspan="2" style="background-color: #649864;"><b>User Story:</b> As a bank card user, I want to be able to request cash from my account<br>
         in the healthcare app with specific rules and constraints to ensure efficient<br>scheduling and to avoid conflicts.
      </th>
   </tr>
   <tr>
      <td style="background-color: #647b98;"><b>Rule #1</b></td>
      <td style="background-color: #7e68d1;">Patients should be able to request appointments with specific<br>doctors from within the app</td>
   </tr>
   <tr>
      <td style="background-color: #647b98;"><b>Rule #2</b></td>
      <td style="background-color: #7e68d1;">Appointments requests must include the preferred date and time</td>
   </tr>
   <tr>
      <td style="background-color: #647b98;"><b>Rule #3</b></td>
      <td style="background-color: #7e68d1;">The app should check the availability of the doctor for the<br>requested date and time</td>
   </tr>
   <tr>
      <td style="background-color: #647b98;"><b>Rule #4</b></td>
      <td style="background-color: #7e68d1;">If the doctor is unavailable, the system should suggest alternative<br>slots or ask the patient to choose a different doctor</td>
   </tr>
</table>
