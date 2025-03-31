# Introduction to Playwright

[Course link](https://testautomationu.applitools.com/playwright-intro/)
[Playwright website](https://playwright.dev/)
[Introduction to Playwright - GitHub repository](https://github.com/raptatinha/tau-introduction-to-playwright)
[Renata Andrade - Instructor website](https://testingwithrenata.com/)


Playwright is a framework that enables reliable end-to-end testing for modern web applications.

It supports multiple languages, and in this course, we are going to focus on Typescript.

# Introduction to Playwright
## Playwright Documentation - Menus & Search
[https://playwright.dev/](https://playwright.dev/)

## How to install Playwright
`npm init playwright@latest`

## How to run Playwright tests
`npx playwright test`

## Chapter 1
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

## Chapter 2
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

## Chapter 3
[Exercises](exercises/chapter3.md)
[Resources](extra-resources/chapter3.md)
## Chapter 4
[Exercises](exercises/chapter4.md)
[Resources](extra-resources/chapter4.md)
## Chapter 5
[Exercises](exercises/chapter5.md)
[Resources](extra-resources/chapter5.md)
