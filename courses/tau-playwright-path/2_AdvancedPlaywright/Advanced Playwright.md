# Advanced Playwright
[Playwright website](https://playwright.dev/)
[Advanced Playwright - GitHub repository](https://github.com/raptatinha/tau-advanced-playwright)
[Demo QA](https://demoqa.com/login)
[Introduction to Playwright Training](https://testautomationu.applitools.com/playwright-intro/)
[Renata Andrade - Instructor website](https://testingwithrenata.com/)

## Chapter 1 - Optimising Authentication

### Regular Auth with Page Object

### Stored Auth with Global-Setup via UI

### Stored Auth for multi roles

### Advanced - Auth via API request

### Quiz

### Exercises
1. Comment the line `test.use({ storageState: { cookies: [], origins: [] } });` from [login.spec.ts](tau-advanced-playwright-main/tests/ui/specs/login.spec.ts), add a `.only` at the `test.describe` inside the same file and run the test with the command `test-ui-c`. Observe what happens. Revert the first change and run the test again. See that it's passing again. Revert all the code at the end.
2. In the [playwright.config.ts](tau-advanced-playwright-main/playwright.config.ts) change the path of the `storageState`, add some folder name and change the file name. In the [profile-stored-authentication.spec.ts](tau-advanced-playwright-main/tests/ui/specs/profile-stored-authentication.spec.ts) add a `.only` at the `test.describe` and run the test with the command `test-ui-c`. Observe the result. What differences did you notice?
3. In the [global-setup.ts](tau-advanced-playwright-main/tests/setup/global-setup.ts) change the headless mode to `false`. Run the test [profile-stored-authentication.spec.ts](tau-advanced-playwright-main/tests/ui/specs/profile-stored-authentication.spec.ts) by adding a `.only` at the `test.describe` and using the command `test-ui-c`. Observe the result. Was it any faster than in headless mode?
4. In the [global-setup.ts](/tests/setup/global-setup.ts) explore other browsers instead of chromium.  Run the test [profile-stored-authentication.spec.ts](tau-advanced-playwright-main/tests/ui/specs/profile-stored-authentication.spec.ts) by adding a `.only` at the `test.describe` and using the command `test-ui-c`. What browser performed better?
5. In the [global-setup.ts](tau-advanced-playwright-main/tests/setup/global-setup.ts) implement the trace of failures by following this doc // https://playwright.dev/docs/test-global-setup-teardown#capturing-trace-of-failures-during-global-setup. Force a test failure (by passing an invalid username or password for example). What are the advantages of using trace in this file?
6. Implement a regular sign in test and a sign in using stored state for another website that you have access to. If you need a suggestion, you can use https://demo.applitools.com/ (any username and password) or https://www.saucedemo.com/. What challenges did you have?
7. Implement an authentication via API request following this doc https://playwright.dev/docs/auth#authenticate-with-api-request. You can use the same https://demoqa.com/books or any other website. How faster that is compared to the UI sign in?
8. Implement a multi-role sign in test using the "auth-setup" strategy (using something similar to the [auth-setup.ts](tau-advanced-playwright-main/tests/setup/auth-setup.ts) file & [playwright-auth.config.ts](tau-advanced-playwright-main/playwright-auth.config.ts) setup & [profile-stored-auth-multi-role-user.spec.ts](tau-advanced-playwright-main/tests/ui/specs-auth/profile-stored-auth-multi-role-user.spec.ts)) for an application that you have access to. If you need a suggestion, you can use https://www.saucedemo.com/ (there are different users that could be used for different scenarios)
9. Implement a multi-role sign in test using the "auth-setup" strategy (using something similar to the [auth-setup.ts](tau-advanced-playwright-main/tests/setup/auth-setup.ts) file & [playwright-auth.config.ts](tau-advanced-playwright-main/playwright-auth.config.ts) setup & [profile-stored-auth-multi-role-example.spec.ts](tau-advanced-playwright-main/tests/ui/specs-auth/profile-stored-auth-multi-role-example.spec.ts)) for an application that you have access to. If you need a suggestion, you can use https://www.saucedemo.com/ (there are different users that could be used for different scenarios).



### Resources
1. [configure-globalsetup-and-globalteardown](https://playwright.dev/docs/test-global-setup-teardown#configure-globalsetup-and-globalteardown)
2. [capturing-trace-of-failures-during-global-setup](https://playwright.dev/docs/test-global-setup-teardown#capturing-trace-of-failures-during-global-setup)
3. [trace-viewer](https://playwright.dev/docs/trace-viewer)
4. [auth#multiple-signed-in-roles](https://playwright.dev/docs/auth#multiple-signed-in-roles)
5. [auth#testing-multiple-roles-together](https://playwright.dev/docs/auth#testing-multiple-roles-together)
6. [auth#authenticate-with-api-request](https://playwright.dev/docs/auth#authenticate-with-api-request)

## Chapter 2 - Dynamic Page Objects & Fixtures

### Quiz

### Exercises

### Resources

## Chapter 3 - Interacting with APIs

### Quiz

### Exercises

### Resources

## Chapter 4 - Data Management

### Quiz

### Exercises

### Resources

## Chapter 5 - CI with Observability

### Quiz

### Exercises

### Resources