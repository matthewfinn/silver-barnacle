# Introduction to Playwright

[Course link](https://testautomationu.applitools.com/playwright-intro/)
[Playwright website](https://playwright.dev/)
[Introduction to Playwright - GitHub repository](https://github.com/raptatinha/tau-introduction-to-playwright)
[Renata Andrade - Instructor website](https://testingwithrenata.com/)


Playwright is a framework that enables reliable end-to-end testing for modern web applications.

It supports multiple languages, and in this course, we are going to focus on Typescript.

## Playwright Documentation - Menus & Search
[https://playwright.dev/](https://playwright.dev/)

## How to install Playwright
`npm init playwright@latest`

## How to run Playwright tests
`npx playwright test`

## Chapter 1 Time to Explore Playwright
[Exercises](exercises/chapter1.md)
[Resources](extra-resources/chapter1.md)

### Quiz
1. **What is the best way to connect to the Playwright community?**

   Discord Channel

2. **Where can we find information about the breaking changes of each release?**

   Playwright's GitHub Release Notes

3. **Why should we know the Playwright's best practices?**

   To optimize the test execution and increase the code maintainability

4. **What is the command to install Playwright?**

   `npm init playwright@latest`

5. **What is the command to run the tests via terminal?**

   `npx playwright test`


### Quiz

## Chapter 2 The Test Runner & Your First Test
[Exercises](exercises/chapter2.md)
[Resources](extra-resources/chapter2.md)

### Quiz
1. **Why is important to use retries in a test project?**
   
   In case something happens with the environment, we wouldn't want to have a false negative. With retries, we prevent this and other situations to happen and we have less flaky tests. However, it's important to take a look at recurring situations of retries and see if there is something that could be done to improve it.

2. **What is the default value for the property "open" on the HTML report that we can omit on the playwright.config.ts?**
   
   on-failure

3. **What definition takes precedence when Playwright runs a test considering the cli options and the playwright.config.ts file?**
   
   The values defined on the cli options over the values defined on the playwright.config.ts

4. **What's the param to the Playwright test runner to run the tests that don't have a specific tag?**
   
   --grep-invert

5. **What are some valid methods to locate an element?**
   
   getByRole, getByText, getByTestId, locator

6. **What is a valid way to write an assertion in Playwright?**
   
   `await expect(page.getByText(text)).toBeVisible();`

7. **What happens if we don't use the `{ exact: true }` for `await page.getByText('Java', {exact: true}).click();`?**

   Playwright will get all the elements that contains the text "Java" anywhere and in case there is more than 1 will thrown an error and fail the test.

## Chapter 3 Coding Like a Pro
[Exercises](exercises/chapter3.md)
[Resources](extra-resources/chapter3.md)

### Quiz
1. **Why would we have a beforeEach method in a test?**

   To simplify writing and avoid code duplication. The beforeEach will be executed always before each test and common usages of it are: open a URL, create a page object, log test information such as test title.

2. **What is correct about test.describe?**

   It's optional to have a test.describe and we can have more than 1 test.describe in a test file. We can also use test.describe.skip to skip all the test scenarios inside a describe or test.describe.only to run only this describe.

3. **What is NOT correct about methods?**

   If you have a beforeEach, you need to have a corresponding afterEach.

4. **What is NOT true about Page Object Models?**

   It's mandatory in your project if you want a clean code.

5. **What is the difference between `.toContainText()` and `.toHaveText()`?**

   `.toHaveText()` will consider the exact text if using a string, while `.toContainText()` will consider if the text is substring in the same situation.

6. **What is a right way to click and hold for 5 secs?**

   .click({ delay: 5000 })

## Chapter 4 Visual Regression Testing with Applitools
[Exercises](exercises/chapter4.md)
[Resources](extra-resources/chapter4.md)

Playwright has the ability to produce and visually compare screenshots through the command - expect(page).toHaveScreenshot().

### Quiz
1. **What's the difference between the ultra fast grid (UFG) and the classic runner?**
   The UFG perform cross-browser testing and rerenders snapshots on all the target browsers in the cloud while the classic runner renders snapshots using only the machine's local configuration.
   
2. **What is NOT true about Applitools?**
   
   We can only compare snapshots of a full page. There is no way to select or ignore an specific area for comparison.
   
3. **What parameters does the eyes.open method take?**

   driver, appName, testName, viewportSize, sessionType

4. **When does Applitools save the snapshot baseline?**

   When we run the first test it automatically creates a baseline or when there is a failure and we manually accept the new baseline.

## Chapter 5
[Exercises](exercises/chapter5.md)
[Resources](extra-resources/chapter5.md)

1. **What you cannot find inside the trace?**
   
   Test Video
  
2. **What are things displayed by Playwright when a test fails?**

   Expected vs Received, Locator resolved to multiple elements and a few suggestions of how to fix it, Line of the code with the error.
   
3. **What are the configuration options necessary to setup a good report?**

   retries, reporter, trace
   
4. **What is necessary to stop the code at certain line when debugging?**

   a breakpoint
   