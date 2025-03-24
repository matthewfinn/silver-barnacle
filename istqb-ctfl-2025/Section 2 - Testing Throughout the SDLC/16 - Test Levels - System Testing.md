[🔙 Back to Index](../index.md)

# System Testing
* Focuses on the behavior and capabilities of a whole system or product
* Looks at the functional end-to-end tasks the system can perform and the non-functional behavior when performing these tasks
* Automated system regression tests provide confidence
* Often produces information for the stakeholders to make release decisions
* May also satisfy legal or regulatory standards or requirements
* Test environment should be as close as possible to the production environment spec

### Objectives
* Reducing risk
* Verifying whether the functional and non-functional behavior of the system is as designed and specified
* Validating that the system is complete and will work as expected
* Building confidence in the quality of the system as a whole
* Finding defects
* Preventing defects from getting into higher test levels or production
* In some cases – verifying data quality

### Test Basis
* System and software requirement
* Risk Analysis reports
* Use cases
* Epics and user stories
* Models of system behaviour
* State diagrams
* System and user manuals

### Test Object
* Applications
* Hardware/Software systems
* Operating systems
* System under test (SUT)
* System configuration and configuration data

### Typical Defects & Failures
* Incorrect calculations
* Incorrect or unexpected functional or non-functional system behavior
* Incorrect control or data flows within the system
* Failure to properly and completely carry out end-to-end functionality
* Failure of the system to work properly in the production environment
* Failure of the system to work as described in the system and user manuals

### Approach & Responsibilities
* Should focus on the overall, end-to-end behavior of the system as a whole
* Includes **functional** and **non-functional**
* Can be tested using specification-based techniques (black box) or structure-based techniques (white-box)
* Typically performed by independent testers
* Specification defects can lead to misunderstanding of expected system behavior, which can lead to false positives or false negatives
* Early involvement of testers reduces the risk of above situations occurring

### Examples
* E-commerce Platform – Testing the full system workflow, including browsing products, adding to cart, checking out, and receiving an order confirmation email.
* Banking Application – Ensuring all system functionalities like fund transfers, account statements, and loan applications work as expected.
* Airline Booking System – Testing the entire booking process, from searching flights to payment processing and ticket generation.
* POS System in Retail – Testing a store’s point-of-sale system, ensuring it correctly processes transactions, updates inventory, and prints receipts.