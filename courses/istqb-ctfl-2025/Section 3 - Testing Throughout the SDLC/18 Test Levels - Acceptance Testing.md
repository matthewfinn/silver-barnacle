[🔙 Home](../home.md)



# Acceptance Testing
* Focuses on the behaviour & capabilities of a whole system or product
* Demonstrating the readiness for release, that the user’s business needs are fulfilled

### Objectives
* Establishing confidence in the quality of the system as a whole
* Validating that the system is complete & will work as expected
* Verifying that functional & non-functional behaviour of the system is as specified
* May also satisfy legal or regulatory standards or requirements
* Finding defects is often NOT an objective & can be considered a project risk

### Types of Acceptance Testing
Different typical acceptance tests are:
* User Acceptance Test
  * Building confidence that the users can use the system with minimum difficulty, cost & risk
* Operation Acceptance Test
  * Building confidence that the system administrators can keep the system working in production
* Contract & regulation Acceptance Test
  * Building confidence that contractual or regulatory compliance has been achieved
* Alpha & Beta Test
  * Building confidence amongst customers that they can use the system with minimum difficulty, cost & risk
  * Detection of defects related to the conditions & environments in which the system will be used

### Test Basis
* Business processes
* User or business requirements
* Regulations, legal contracts & standards
* Use cases
* System requirements
* System or user documentation
* Installation procedures
* Risk analysis reports
* Examples of where the tests can be derived from for **Operational Acceptance Testing** are:
  * Backup & restore procedures
  * Disaster recovery procedures
  * Non-functional requirements
  * Operations documentation
  * Deployment & installation instructions
  * Performance targets
  * Database packages
  * Security standards or regulations

### Test Object 
* System under test
* System configuration & configuration data
* Business processes for a fully integrated system
* Recovery systems & hot sites
* Operational & maintenance processes
* Forms
* Reports
* Existing & converted production data

### Typical Defects & Failures
* System workflows do not meet business or user requirements
* Business rules are not implemented correctly
* System does not satisfy contractual or regulatory requirements
* Non-functional failures such as:
  * Security vulnerabilities
  * Inadequate performance under high loads
  * Improper operation on a supported platform

### Approach & Responsibilities
* Often the responsibility of the customers, business users, product owners or operators
* Mostly the final test level in a sequential development lifecycle
* Iterative development
  * various forms of acceptance testing during & at the end of each iteration
  * Alpha & Beta tests may be done at the end of an iteration or after a series of iterations
  * User, Operational, regulatory & contractual acceptance testing can be done at the end of each iteration, after the completion of each iteration or after a series of iterations

### Examples
1. E-commerce Website
   * Verify that a customer can search for a product, add it to the cart, & complete a purchase successfully. 
   * Ensure that the order confirmation email is sent after a successful payment. 
   * Check that applying a discount coupon correctly updates the total price. 
   * Validate that users can return an item & receive a refund as per the return policy.
2. Airline Reservation System
   * Verify that users can search for flights, select seats, & book tickets.
   * Ensure that customers receive an email confirmation after successful booking.
   * Check that flight status updates (delays, cancellations) are displayed in real time.
   * Validate that passengers can check in online & download their boarding passes.