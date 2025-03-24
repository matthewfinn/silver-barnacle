[🔙 Back to Index](../index.md)

# Acceptance Testing
* Focuses on the behavior and capabilities of a whole system or product
* Demonstrating the readiness for release, that the user’s business needs are fulfilled

### Objectives
* Establishing confidence in the quality of the system as a whole
* Validating that the system is complete and will work as expected
* Verifying that functional and non-functional behavior of the system is as specified
* May also satisfy legal or regulatory standards or requirements
* Finding defects is often NOT an objective and can be considered a project risk

### Types of Acceptance Testing
Different typical acceptance tests are:
* User Acceptance Test
  * Building confidence that the users can use the system with minimum difficulty, cost and risk
* Operation Acceptance Test
  * Building confidence that the system administrators can keep the system working in production
* Contract and regulation Acceptance Test
  * Building confidence that contractual or regulatory compliance has been achieved
* Alpha and Beta Test
  * Building confidence amongst customers that they can use the system with minimum difficulty, cost and risk
  * Detection of defects related to the conditions and environments in which the system will be used

### Test Basis
* Business processes
* User or business requirements
* Regulations, legal contracts and standards
* Use cases
* System requirements
* System or user documentation
* Installation procedures
* Risk analysis reports
* Examples of where the tests can be derived from for **Operational Acceptance Testing** are:
  * Backup and restore procedures
  * Disaster recovery procedures
  * Non-functional requirements
  * Operations documentation
  * Deployment and installation instructions
  * Performance targets
  * Database packages
  * Security standards or regulations

### Test Object 
* System under test
* System configuration and configuration data
* Business processes for a fully integrated system
* Recovery systems and hot sites
* Operational and maintenance processes
* Forms
* Reports
* Existing and converted production data

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
  * various forms of acceptance testing during and at the end of each iteration
  * Alpha and Beta tests may be done at the end of an iteration or after a series of iterations
  * User, Operational, regulatory and contractual acceptance testing can be done at the end of each iteration, after the completion of each iteration or after a series of iterations

### Examples
1. E-commerce Website
   * Verify that a customer can search for a product, add it to the cart, and complete a purchase successfully. 
   * Ensure that the order confirmation email is sent after a successful payment. 
   * Check that applying a discount coupon correctly updates the total price. 
   * Validate that users can return an item and receive a refund as per the return policy.
2. Airline Reservation System
   * Verify that users can search for flights, select seats, and book tickets.
   * Ensure that customers receive an email confirmation after successful booking.
   * Check that flight status updates (delays, cancellations) are displayed in real time.
   * Validate that passengers can check in online and download their boarding passes.
