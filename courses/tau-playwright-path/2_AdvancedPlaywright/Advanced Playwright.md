# Advanced Playwright
[Playwright website](https://playwright.dev/)
[Advanced Playwright - GitHub repository](https://github.com/raptatinha/tau-advanced-playwright)
[Demo QA](https://demoqa.com/login)
[Introduction to Playwright Training](https://testautomationu.applitools.com/playwright-intro/)
[Renata Andrade - Instructor website](https://testingwithrenata.com/)

## Chapter 1 - Optimising Authentication

### Regular Auth with Page Object

**login.spec.ts** 

We have the imports here, as usual.

We are getting the username and password from the `.env` file configured
``` typescript
import { test } from '@playwright/test';
import LoginPage from '../pages/login-page';
import pages from '../../utils/pages';
import userData from '../../data/user-data';

const userName = process.env.APP_USERNAME!;
const password = process.env.PASSWORD!;
let loginPage: LoginPage;

test.use({ storageState: { cookies: [], origins: [] } }); // doesn't share the logged in session
// test.use({ storageState: undefined }); // https://github.com/microsoft/playwright/issues/17396
test.describe.configure({ mode: 'serial' });

test.beforeEach(async ({ page }) => {
  await page.goto(pages.loginPage);
  loginPage = new LoginPage(page);
});

test.describe('Book Store - Login', () => {
  test(`successfull login`, async () => {
    await loginPage.doLogin(userName, password);
    await loginPage.checkLoggedIn();
  });

  test(`failing login - invalid username`, async () => {
    const invalidUsername = userData.invalidUsername;
    await loginPage.doLogin(invalidUsername, password);
    await loginPage.checkInvalidCredentials();
  });

  test(`failing login - invalid password`, async () => {
    const invalidPassword = userData.invalidPassword;
    await loginPage.doLogin(userName, invalidPassword);
    await loginPage.checkInvalidCredentials();
  });
});
```

**login-page.ts**
POM for the login page
``` typescript
import { type Page, type Locator , expect } from '@playwright/test';
import messages from '../../utils/messages';

class LoginPage {
  readonly page: Page;
  readonly loginButton: Locator;
  readonly messagePanel: Locator;
  readonly password: Locator;
  readonly userName: Locator;

  constructor(page: Page) {
    this.page = page;
    this.loginButton = page.getByRole('button', { name: 'Login' });
    this.messagePanel = page.locator('#output');
    this.password = page.getByPlaceholder('Password');
    this.userName = page.getByPlaceholder('UserName');
  }

  async fillEmail(email: string) {
    await this.userName.fill(email);
  }

  async fillPassword(password: string) {
    await this.password.fill(password);
  }

  async doLogin(email: string, password: string) {
    await this.fillEmail(email);
    await this.fillPassword(password);
    await this.loginButton.click();
  }

  async checkLoggedIn() {
    await expect(this.page).toHaveURL(/.*profile/);
    await expect(this.page).toHaveTitle(/DEMOQA/);
  }

  async checkInvalidCredentials() {
    await expect(this.messagePanel).toHaveText(messages.login.invalid);
  }
}

export default LoginPage;
```

**Run these tests in UI mode**
`npx playwright test --ui tests/ui/specs/login.spec.ts --project=chromium`


#### Debugging Global-Setup with Traces

If there are issues with the setup file you'll need to enable a trace, as per below, to be able to debug

**global-setup.ts**
``` typescript
import { chromium, FullConfig } from '@playwright/test';
import LoginPage from '../ui/pages/login-page';
import uiPages from '../utils/uiPages';

async function globalSetup(config: FullConfig) {
  const user = process.env.APP_USERNAME!;
  const password = process.env.PASSWORD!;
  const { baseURL, storageState } = config.projects[0].use;
  const browser = await chromium.launch({ headless: true, timeout: 10000 });
  const page = await browser.newPage();
  const loginPage = new LoginPage(page);
  try {

    await page.context().tracing.start({ screenshots: true, snapshots: true });
    await page.goto(baseURL + uiPages.login);
    await loginPage.doLogin(user, password);
    await loginPage.checkLoggedIn();
    await page.context().storageState({ path: storageState as string });
    await page.context().tracing.stop({
      path: './test-results/setup-trace.zip',
    });
    await browser.close();
  } catch (error) {
    await page.context().tracing.stop({
      path: './test-results/failed-setup-trace.zip',
    });
    await browser.close();
    throw error;
  }
}

export default globalSetup;

// https://playwright.dev/docs/test-global-setup-teardown#capturing-trace-of-failures-during-global-setup
// https://playwright.dev/docs/trace-viewer

```

In order to view the trace after setup has failed you can use the following command
`npx playwright show-trace .\test-results\failed-setup-trace.zip`
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