[🔙 Back to Index](../index.md)

[🔙 Back to Index](../index.md)

# Component Integration Testing
* AKA Unit Integration Testing#
* Focuses on interfaces and interactions between integrated components
* Performed after Component testing – mainly by developers
* In general part of an automated CI process

### Objectives
* Reducing risk
* Verifying whether the functional and non-functional behaviour of the interfaces is as designed as specified
* Building confidence in the quality of the interfaces – mainly through automation
* Finding defects in the interfaces, interactions or components
* Preventing defects from getting into higher test levels
* Prevent regression of existing interfaces, interactions or components using automated regression tests

### Test Basis
* Software and design
* Sequence diagrams
* Interface and communication protocol specifications
* Architecture at component level

### Test Objects
* Databases
* Infrastructure
* Interfaces
* APIs
* Microservices
* Modules

### Typical Defects & Failures
* Incorrect data, missing data or incorrect data encoding
* Incorrect sequencing or timing of interface calls
* Interface mismatch
* Failures in communication between components
* Unhandled or improperly handled communication failures between components
* Incorrect assumptions about the meanings, units or boundaries of the data being passed between components

### Approach & Responsibilities
* Should focus on the integration itself, not on the individual modules
* Functional, non-functional and structural test types are applicable
* Best practice is to first plan integration tests and integration strategy before building the components
* Risk analysis helps to focus component integration testing
* Greater scope means more difficulty in isolating defects – Continuous Integration including test automation can help

### Strategies
1. Top - Down
   * Testing takes place from the GUI down. Components or systems are substituted by stubs
2. Bottom Up
   * Testing takes place from the bottom of the control flow upward. Components or systems are substituted by drivers
3. Functional Incremental
   * Integration and testing takes place based on the functions or functionalities as per the functional specification document
4. Big-Bang
   * All units are linked at once, resulting in a complete system

### Examples
* Testing if a login module correctly interacts with an authentication service.
* Testing if an API correctly fetches, inserts, updates, or deletes data in a database.
* Ensuring that a React/Angular/Vue frontend correctly communicates with a backend REST or GraphQL API.
* Verifying that two microservices exchange data correctly using HTTP requests, gRPC, or message queues.
* Testing if a file upload component successfully stores files in cloud storage (e.g., AWS S3, Azure Blob Storage).
