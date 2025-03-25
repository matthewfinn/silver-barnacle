# Test Estimation Techniques

## Test Effort Estimation
* Predicting the amount of test-related work needed to meet the test objectives for a:
  * Test Project
  * Release
  * Iteration
* Stakeholders should know that:
  * The **estimate** is based on a number of assumptions and is subject to estimation errors
  * Estimating for **small** tasks is more accurate than for large tasks
  * Tasks that are too large should be **broken up** into smaller tasks, that can be estimated more accurately

### Influencing Factors
* Factors that influence the test effort include:
  * Product characteristics
  * Development process characteristics
  * People characteristics
  * Test results

#### Product Characteristics influencing Test Effort
* Risks associated with the product
* Quality of the test basis
* Size of the product
* Complexity of the product domain
* Requirements for quality characteristics (performance, usability, etc)
* Required level of detail for test documentation
* Requirements for legal and regulatory requirements

#### Development Process Characteristics influencing Test Effort
* Stability and maturity of the organisation
* Development model in use
* Test approach
* Tools used
* Test process
* Time pressure

#### People Characteristics influencing Test Effort
* Skills of the people involved
* Experience of the people involved (domain knowledge)
* Team cohesion and leadership

#### Test Results influencing Test Effort
* Number and severity of defects found
* Amount of rework required

## Test Estimation Categories
### Expert–based approach
Estimating based on the experience of the owners of the testing tasks or by the experts and experienced staff members.
Examples here are
* Wideband Delphi estimation
* Planning poker in Agile

### Metrics-based approach
Estimating based on metrics of former or similar projects or based on typical values:
* Dev-QA ratio
* Project size and complexity
* Defect removal models
* Burndown charts and velocity

## Test Estimation Techniques
* Estimation based on ratios (metrics-based)
* Extrapolation (metrics based)
* Wideband Delphi (iterative, expert-based)
* Three-point estimation (expert-based)

### Estimation Based on Ratios
* Metrics-based technique
* Based on metrics from previous projects in the organisation
* Ratios from the own organisation are the best source in the estimation process as it:
  * Takes into account the development process characteristics
  * Takes into account the people characteristics
* Use these metrics to calculate ‘standard’ ratios for similar projects
* Use this standard ratio to estimate the test effort for the new project

#### Estimation Based on Ratios - Example
* A standard calculated ratio is calculated from past similar projects
* Development-to-test-effort was 5:3
* Current estimated development effort is 1000 person-days
* How much is the test effort?
  * 1000 / 5 = 200
  * 200 * 3 = 600
  * The test effort is estimated to be 600 person-days

### Extrapolation
‘The action of estimating or concluding something by assuming that existing trends will continue or a current method will remain applicable.’

* Metrics-based technique
* Measuring and gathering data as **early** as possible in the **current** project
* When there are enough measurements, effort for the remaining work can be estimated by extrapolating the data
* Very suitable for iterative SDLC models

#### Extrapolation - Example 1
* A project has started 3 sprints ago; each sprint taking 2 weeks
* The velocity (delivery capacity) in story points of the team has been the below, divided into development and test:

<table>
   <tr>
      <th style="background-color: #649864;"></th>
      <th style="background-color: #649864;">Sprint 1</th>
      <th style="background-color: #649864;">Sprint 2</th>
      <th style="background-color: #649864;">Sprint 3</th>
      <th style="background-color: #649864;">Sprint 4?</th>
   </tr>
   <tr>
      <td style="background-color: #647b98;">Dev</td>
      <td style="background-color: #647b98;">13</td>
      <td style="background-color: #647b98;">18</td>
      <td style="background-color: #647b98;">17</td>
      <td style="background-color: #647b98;">???</td>
   </tr>
   <tr>
      <td style="background-color: #ae3838;">Test</td>
      <td style="background-color: #ae3838;">3</td>
      <td style="background-color: #ae3838;">6</td>
      <td style="background-color: #ae3838;">6</td>
      <td style="background-color: #ae3838;">???</td>
   </tr>
</table>

* Based on this, calculate the dev AND test velocity for the next sprint using extrapolation
  * Dev: (13+18+17)/3 = 16 story points
  * Test: (3+6+6)/3 = 5 story points

#### Extrapolation - Example 2
* Let’s say the high-level estimate is that in these 3 sprints about 10% of the application is done, 
* How long do you estimate the entire project to take?
<table>
   <tr>
      <th style="background-color: #649864;"></th>
      <th style="background-color: #649864;">Sprint 1</th>
      <th style="background-color: #649864;">Sprint 2</th>
      <th style="background-color: #649864;">Sprint 3</th>
      <th style="background-color: #649864;">Sprint 4</th>
   </tr>
   <tr>
      <td style="background-color: #647b98;">Dev</td>
      <td style="background-color: #647b98;">13</td>
      <td style="background-color: #647b98;">18</td>
      <td style="background-color: #647b98;">17</td>
      <td style="background-color: #647b98;">16</td>
   </tr>
   <tr>
      <td style="background-color: #ae3838;">Test</td>
      <td style="background-color: #ae3838;">3</td>
      <td style="background-color: #ae3838;">6</td>
      <td style="background-color: #ae3838;">6</td>
      <td style="background-color: #ae3838;">5</td>
   </tr>
</table>

* 10% of the application has taken 63 story points
* 100% of the application is estimated on 630 story points
* 90% is still to be done, estimated to take ((630 / 100) * 90%) = 567 story point
* 567 story points is estimated to take (567 / 21 story points per sprint) = 27 sprints, so 54 weeks

### Wideband Delphi
* Iterative, expert-based technique
* Experts make experience-based estimations
* Each expert estimates the effort in isolation
* Results are collected and if there are unacceptable deviations the estimates are discussed
* After the discussion each expert (in isolation) should make a new estimate based on the feedback
* This is repeated until there is consensus

#### Estimating Testing Effort – Planning Poker explained
* Takes place in Release Planning
* Feature is discussed by the team (developers, testers, business)
* Business answers questions from the team
* For estimation, it is great there is availability of:
  * Risk Level
  * Priority
* In Planning poker,
  * Business representative presents a user story
  * After all questions and discussions, the estimation can begin
  * Each estimator (team member) privately selects a card to represent the estimate
  * All cards are revealed at the same time
  * If all have the same, that becomes the estimate, otherwise the poker continues until agreement is reached –
  this should be done by communication – so discuss the lowest and highest effort given and try to see whether
  some people in the team missed something or everyone else missed something.
* Each estimator has a deck of cards with values similar to the Fibonacci sequence (0,1,2,3,5,8,13,21,34,55,89…), OR shirt sizes, OR jelly beans, OR…..
* Fibonacci – recommended as uncertainty grows exponentially with the size of the story
* Values represent story points, effort days or other units in which the team estimates
* Estimate too high, story unclear or needs to be broken down into smaller stories
* Agreement can be reached by:
  * Consensus
  * Applying rules (use highest, average, etc)

### Three-Point Estimation
* Expert-based technique
* The outcome is an estimate that lies in a range because of a certain error ‘measurement error’
* Three estimates are made by experts
  * The most optimistic estimation
  * The most likely estimation
  * The most pessimistic estimation
* Calculate the estimate of these three estimations with a weighed formula
* Calculate the standard deviation, or measurement error
* The result is the range between the calculated estimate minus the deviation and the calculated estimate plus the deviation

#### Three-Point Estimation - Example
* Three estimates are made by experts
  * The most optimistic estimation (a) is 12 person-days
  * The most likely estimation (m) is 14 person-days
  * The most pessimistic estimation (b) is 18 person-days

* The estimate (E) is calculated as:
$$
E = \frac{a + 4m + b}{6}
$$
* The most likely estimate is weighed 4 times and the others only once
* The estimate E is:
  $$
  E = \frac{12 + (4 \times 14) + 18}{6} = 14.33 days
  $$
* The standard deviation or measurement error (SD) is calculated as:
$$
   SD = \frac{(b-a)}{6}
$$
* SD Calculation:
$$
  SD = \frac{(18-12)}{6} = 1 day(s)
$$
* Meaning the final estimate in person days is between (14.33-1=) 13.33 and (14.33+1=) 15.33
