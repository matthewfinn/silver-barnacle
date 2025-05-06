[🔙 Home](../home.md)

# Shift-Left Approach

### What is the Shift-Left Approach?
* Early Testing
* Don't wait until the code has been written

![image14.png](assets/image14.png)

**The earlier a bug is found the cheaper it is to fix**
![image15.png](assets/image15.png)


### Shift-Left Best Practices
* Static Testing (reviewing) of the specification
* Write test cases before the code is written
* Run the code in a test harness during implementation
* Implement CI & CD
* Complete static analysis before dynamic testing
* Non-Functional tests should also be done earlier (shift-left)

### Points of Attention
* All stakeholders need to buy-in to the idea
* Investments are needed in the earlier development phases:
  * Training 
  * Effort
  * Cost

### Example: API Testing with Shift-Left Approach

**Scenario**
A development team is building a new REST API for a financial application. Traditionally, testing would be done after development is complete, but in a shift-left approach, testing is integrated early

**How Shift-Left is Applied**
**1. API Contract Testing with OpenAPI**
   * Before coding begins, the team defines the API contract using OpenAPI (Swagger)
   * QA and developers collaborate to review the contract, ensuring consistency and correctness.
   * Mock servers (e.g., Prism or WireMock) are used to test integrations before backend implementation is complete

**2. Automated Unit Tests with API Stubs**
   * Developers write unit tests (e.g., using JUnit + RestAssured in Java) to validate individual API endpoints
   * Instead of waiting for a full backend, API responses are stubbed using MockMvc or similar tools

**3. Continuous Integration (CI) with API Tests**
   * As soon as a developer pushes code, automated API tests run in the CI pipeline (e.g., GitHub Actions, GitLab CI, or Jenkins)
   * Tests include schema validation, response codes, and security checks (e.g., OWASP ZAP for security scanning)

**4. Performance & Security Testing Early**
   * Basic performance testing with JMeter or k6 is done on staging APIs before full-scale load testing
   * Security tests check for common API vulnerabilities like SQL injection, XSS, or authentication flaws early in development

**5. Static Analysis & Linting in PRs**
   * Before merging, static code analysis tools (e.g., SonarQube, ESLint) catch potential bugs and security flaws

**Benefits**
  * Bugs in API definitions are caught before development starts
  * Developers get faster feedback with automated tests
  * Security and performance issues are detected early, reducing costs
  * The team spends less time debugging in later stages