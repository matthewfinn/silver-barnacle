[🔙 Back to Index](../index.md)

[🔙 Back to Index](../index.md)

# System Integration Testing
* Focuses on interactions between systems, packages and microservices (also external)
* External dependencies can cause challenges
* Can be performed after or during System testing – mainly by testers
* Test environments should be as close to the operational environment as possible

### Objectives
* Reducing risk
* Verifying whether the functional and non-functional behaviour of the integrated system(s) is as designed and specified
* Building confidence in the quality of the system
* Finding defects in the system(s)
* Preventing defects from getting into the acceptance level
* Prevent regression of existing systems using (automated) regression tests

### Test Basis
* System design
* Use cases
* Architecture at system level
* Workflows
* External interface definitions

### Test Object
* Subsystems
* Interfaces between systems
* Microservices
* Modules

### Typical Defects & Failures
* System interface mismatch
* Failures in communication between systems
* Unhandled or improperly handled communication failures between systems
* Incorrect assumptions about interactions between systems

### Approach & Responsibilities
* Should focus on the integration itself, not on individual systems
* Functional, non-functional and structural test types are applicable
* Best practice is to first plan integration test and integration strategy before building the systems
* System integration testing heavily depends on the Integration strategy (top-down, bottom-up, big bang, incremental)
* Risk analysis helps to focus system integration testing
* Greater scope means more difficulty in isolating defects – Continuous Integration including test automation can help

### Examples
* E-commerce System Integration – Ensuring an online store correctly integrates with a payment gateway (e.g., Stripe, PayPal) and an inventory management system.
* HR & Payroll System – Checking if an HR system correctly integrates with a payroll processing service and a tax calculation system.
* User Authentication Across Systems – Verifying if a Single Sign-On (SSO) solution (e.g., Okta, Auth0) correctly integrates across multiple applications.
* Airline Reservation System – Ensuring that a flight booking system correctly integrates with third-party services for seat selection, payment, and loyalty programs.
* Logistics & Supply Chain Integration – Verifying that a shipping company’s tracking system integrates correctly with warehouse and inventory management systems.

