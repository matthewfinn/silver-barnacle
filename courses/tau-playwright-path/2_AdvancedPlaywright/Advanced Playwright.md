# Advanced Playwright
[Playwright website](https://playwright.dev/)
[Advanced Playwright - GitHub repository](https://github.com/raptatinha/tau-advanced-playwright)
[Demo QA](https://demoqa.com/login)
[Introduction to Playwright Training](https://testautomationu.applitools.com/playwright-intro/)
[Renata Andrade - Instructor website](https://testingwithrenata.com/)

## Chapter 1 - Optimising Authentication

### Regular Auth with Page Object

**`login.spec.ts`** 

We have the imports here, as usual.
We are getting the username and password from the `.env` file configured

**Note:** needed to change the original variable name `USERNAME` to `APP_USERNAME` as on Windows the environment variable `USERNAME` is always set by the OS to your logged-in account i.e. mattf




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

**`login-page.ts`**

To check the invalid credentials, we check if the panel has the invalid login message that's being called from this `utils/message.ts` file as well.

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
#### Storing Login State
Playwright has a way to restore the login state so you don't need to repeat these steps for every single test.

To exemplify how storing the sign in works, we are going to open the `profile-stored-authentication.spec.ts`, which is also under the specs folder and the `profile-page.ts`, which is also under pages.

We do have the `ProfilePage` object model, and in the `beforeEach` you can see that we go straight to the `pages.profile` and we create a new `profilePage` page object, passing the `page`.

In the `describe`, we just do `checkLoggedIn` - you can see in this method here that we do not do any sign in, and neither in the constructor.

**`profile-stored-authentication.spec.ts`**

``` typescript
import { test } from '@playwright/test';
import ProfilePage from '../pages/profile-page';
import pages from '../../utils/pages';

let profilePage: ProfilePage;

test.beforeEach(async ({ page }) => {
    await page.goto(pages.profile);
    profilePage = new ProfilePage(page);
});

test.describe('Profile - Stored Auth', () => {
    test('Check logged in', async () => {
        await profilePage.checkLoggedIn();
    });
});

```

**`profile-page.ts`**
``` typescript
import { type Page, type Locator , expect, type BrowserContext } from '@playwright/test';
import bookListData from '../../data/book-list-data';
import apiPaths from '../../utils/apiPaths';

class SearchPage {
  readonly page: Page;
  readonly bookAdminLabel: Locator;
  readonly booksCollectionRequestRegExp: RegExp;
  readonly bookUserLabel: Locator;
  readonly gridRow1: Locator;
  readonly gridRow2: Locator;
  readonly notLoggedInLabel: Locator;
  readonly searchField: Locator;
  readonly titleHeaderLabel: Locator;
  
  constructor(page: Page) {
    this.page = page;
    this.bookAdminLabel = page.getByText('Eloquent JavaScript, Second Edition');
    this.booksCollectionRequestRegExp = new RegExp(apiPaths.account);
    this.bookUserLabel = page.getByText('Understanding ECMAScript 6');
    this.gridRow1 = page.locator('div:nth-child(1) > .rt-tr > div:nth-child(2)').last();
    this.gridRow2 = page.locator('div:nth-child(2) > .rt-tr > div:nth-child(2)');
    this.notLoggedInLabel = page.getByText('Currently you are not logged into the Book Store application, please visit the login page to enter or register page to register yourself.');
    this.searchField = page.getByPlaceholder('Type to search');
    this.titleHeaderLabel = page.getByText('Title');
  }
  // Removed code above and below this to make it cleaner to read for documentation purposes
  async checkLoggedIn() {
    await expect(this.notLoggedInLabel).not.toBeVisible();
  }
}

export default SearchPage;

```
### Stored Auth with Global-Setup via UI
In the `playwright.config.ts`, we have two items that will be essential for reusing the sign in state.
One is the `globalSetup`, where you define a file that will actually do the sign in and create a JSON file with the sign in state to be reused across other tests.

Second is the `storageState` - that will be the file that will store the state for us.

``` typescript
export default defineConfig({
  globalSetup: require.resolve('./tests/setup/global-setup'),
  fullyParallel: false,
  forbidOnly: !!process.env.CI,
  retries: 0,
  workers: undefined,
  reporter: 'html',
  // timeout: 5000,
  use: {
    storageState: 'storageState.json',
    trace: 'on',
    baseURL: process.env.ENV === 'production' 
      ? baseEnvUrl.production.home
      : process.env.ENV === 'staging' 
        ? baseEnvUrl.staging.home
        : baseEnvUrl.local.home
  },
```


`storageState.json` is a group of cookies and origins so every time it starts a test, Playwright will automatically load that for you.

![](assets/storage-state.png)

Important to note here, if you don't have this `globalSetup` running for every run, you could have the file stored in your server or your local machine.

So, you don't necessarily need the `globalSetup` if you have a way to have this session saved on the machine that you're running the tests on.

Another note is that this will run once per run.

### Stored Auth for multi roles
When we have multiple roles or different users in our application, we have another strategy that we can use.

Here is an example in `profile-stored-auth-multi-role-admin.spec.ts`, which is under tests > ui > specs-auth.

In this file, we are using the `storageState: '.auth/admin.json'`, and you can define it at the beginning of the file for all the tests or inside the describe, as it shows here.
![](assets/chapter1.2-img1.png)

In case you have more than one `describe`, you can have different JSON files within them.

It's important to remember that your application needs to support multi-session or multi-user so you are able to run those tests.

Another example here - we have one for the user - it's the same thing, but with the `storageState` inside the `describe`. This will have the same effect as long as we only have 1 `describe`

![](assets/chapter1.2-img2.png)

In order to execute that, we will use a different strategy in the `playwright.config.ts` file.

We need to remove the `globalSetup` and the `storageState` because they cannot be used simultaneously alongside this method.

``` ts
projects: [
    { 
      name: 'auth-setup', 
      testMatch: /auth-setup\.ts/ 
    },
    {
      name: 'chromium',
      use: { 
        ...devices['Desktop Chrome'],
       },
    },
    {
      name: 'chromium-auth',
      use: { 
        ...devices['Desktop Chrome'] ,
        // storageState: '.auth/admin.json', //use this in case you have multiple projects one per user
      },
      dependencies: ['auth-setup'],
    },
  ],
```


Going straight to `auth-setup.ts`, it's pretty similar to the global setup that we just saw.

The only difference is that we are going to have one path for one user or role and another path for another user or role.

![](assets/chapter1.2-img4.png)


![](assets/chapter1.2-img5.png)

Both are using a common function called `doLogin` that will get the `baseURL`, create a new page object, go to a page, do the login, wait for the URL just to make sure the cookies are loaded, and check if it's logged in.

Right after that, for each method, we are creating a new `storageState` based on the path we just set.


In this third example, `profile-stored-auth-multi-role-example.spec.ts`, which is also under the specs-auth folder, we will see something a little bit different.

We are also using the `storageState`, as we saw previously, but instead, inside one test, we are creating two different contexts, one with the `adminContext` and one with the `userContext`, and then we'll create a new page for the admin and a new page for the user. With that, we can run two tests simultaneously with two different users.

![](assets/chapter1.2-img8.png)


### Advanced - Auth via API request
Instead of using the global setup to do it via UI or the auth setup that uses the same UI methodology, we could create an API call via `post` and then get the authentication and store it in a file.

![](assets/chapter1.2-img11.png)


### Quiz
1. **What is the right way to skip the stored sign in?**
		`test.use({ storageState: { cookies: [], origins: [] } });`
2. **What are two valid configurations inside the playwright.config.ts to enable the auto sign in (via stored session)?**
		globalSetup & storageState

3. **What is not true about the auto sign in feature?**
		Playwright supports muti-role auto sign in using only one browser context

4. **When it's used the multi-role strategy via auth-setup file, the methods are considered tests.**
		true

5. **Running the tests with the stored sign in methodology usually decreases the tests runtime in more than 50%.**
		true


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

### Hook file for reusable POM creation
The first thing to look at is **`profile-with-dynamic-pom.spec.ts`**
``` typescript
import { test } from '@playwright/test';
import ProfilePage from '../pages/profile-page';
import hooks from '../../utils/hooks';
import pages from '../../utils/pages';

let profilePage: ProfilePage;

test.beforeEach(async ({ page }) => {
    // await page.goto(pages.profile);
    // profilePage = new ProfilePage(page);
    profilePage = await hooks.beforeEach(page, ProfilePage, pages.profile);
});

test.describe('Profile - Dynamic Page Object Model', () => {
    test('Check logged in', async () => {
        await profilePage.checkLoggedIn();
    });
});

```
This file is a regular spec file with its imports, and since we are testing the profile page, we created a new variable `profilePage` here with the type of the page object `ProfilePage`.

Usually, we would have a ``goto`` and a new page object creation inside the ``beforeEach`` method.

Instead, we are doing it via ``hooks.beforeEach``

Inside our ``describe`` test method, we are performing a ``checkLoggedIn`` that comes from the ``profilePage``.

**`hooks.ts`**
Let's understand what ``hooks.beforeEach`` does.

```
import { Page } from '@playwright/test';
import { buildUrl } from './uiUrlBuilder';
import BookPage from '../ui/pages/book-page';
import LoginPage from '../ui/pages/login-page';
import ProfilePage from '../ui/pages/profile-page';

async function beforeEach(
  page: Page,
  PageObjectParam: LoginPage|BookPage|ProfilePage,
  targetPage: string,
  params?: Record<any, any>
) {
  await page.goto(buildUrl(targetPage, params));
  const pageObject = await new PageObjectParam(page);
  return pageObject;
}

export default { beforeEach };

```

1. This function can be named anything, and it has the first parameter ``page``, which is the playwright driver. 
2. The second parameter is the ``PageObjectParam`` that can be of type ``LoginPage``, ``BookPage``, or ``ProfilePage``, which are the page objects that we have in this application. You can have as many as you want.
3. The third parameter ``targetPage`` is a string, 
4. Lastly, extra ``params``, which is not required but comes in a Record<any, any>.


Inside this method, then we will finally do the ``page.goto`` and use ``buildUrl`` (which is in the next section).

We are finally creating the ``pageObject`` in this dynamic way.So it doesn't matter necessarily what exactly you are creating, as long as you pass the right ``PageObjectParam``, then you'll be able to create that.

And we ``return`` the ``pageObject`` to be consumed in the test file.

The benefit of using this is that if you need to create a new page object, you can replace these two lines with one single line, and it will create and go to the page automatically for you for each test.

Again, less lines of code, and of course, faster development of the tests.
### URL Builder for dynamic URL creation

**`uiUrlBuilder.ts`**
```
import uiPages from '../utils/uiPages';

export function buildUrl(page: string, params?: Record<any, any>) {
  const uiPath = uiPages[page];
    
  const qParams = new URLSearchParams(params);
  
  const url = params
  ? `${uiPath.concat('?')}${qParams.toString()}`
  : uiPath;

  /**
    * page  bookStore
    * uiPath  /books
    * params  { book: '9781449337711' }
    * qParams  URLSearchParams { 'book' => '9781449337711' }
    * url  /books?book=9781449337711
  */

  return url;
}

```

The idea here is to create things dynamically, to do so you need to understand the pattern of your application.

### Fixture file for reusable flows
Playwright Test is based on the concept of test fixtures.
Test fixtures are used to establish the environment for each test, giving the test everything it needs and nothing else. 
Test fixtures are isolated between tests. 
With fixtures, you can group tests based on their meaning, instead of their common setup.

**`book-with-fixture-and-api-spec.ts`**
``` typescript
/**
 * 1. import the fixture file instead of the @playwright/test
 * 2. as soon as you use "bookPage" as a param of the test, the fixture will be called 
 * 3. In the fixture file, will create the POM
 * 4. Next step in the fixture is the function "use", so it goes back to the test file
 * 5. In the test file, it will execute all the commands, (cleanBooks and bookPage.goto)
 * 6. As the test ends, it goes back to the fixture and executes the first intruction after the "use"
 * 7. In the fixture file, execute bookPage.addToYourCollection, passing the param defined in the describe.
*/

import { test } from '../fixtures/books-fixture';
import { APIRequestContext, Page } from '@playwright/test';
import baseAPIUrl from '../../utils/environmentBaseUrl';
import deleteBookAPIRequest from '../../api/requests/delete-books-collection';
import userData from '../../data/user-data';

test.describe.configure({ mode: 'serial' });

let apiContext: APIRequestContext;
const env = process.env.ENV!;
const password = process.env.PASSWORD!;
const userId = process.env.USERID!;
const userName = process.env.APP_USERNAME!;

test.beforeAll(async ({ playwright }) => {
    // apiContext = await playwright.request.newContext({ storageState: 'storageState.json' });
    apiContext = await playwright.request.newContext({
        baseURL: baseAPIUrl[env].api,
        extraHTTPHeaders: {
            // Authorization: `Basic ${apiToken}`,
            Authorization: `Basic ${Buffer.from(`${userName}:${password}`).toString('base64')}`,
            // Authorization: `Basic ${env}`,
            Accept: 'application/json',
        },
    });
});

test.describe('Books - Fixture & API', () => {
    // The scope of use is file or describe
    test.use({ isDupe: false });
    test('Add brand new book', async ({ page, bookPage }) => { //first thing that will happen is to call the fixture automatically. whenever the fixture has a "use" it goes back to the test and then go back to the fixture again when the test is done and execute any remaining commands
        await cleanBooks(userId, page);
        await bookPage.goto(userData.books.new);
    });
});

async function cleanBooks(userId: string, page: Page) {
    await deleteBookAPIRequest.deleteAllBooksByUser(apiContext, userId);
    // await page.reload();
};


```

**`book-fixture.ts`**

``` typescript
import BookPage from '../pages/book-page';
import hooks from '../../utils/hooks';
import pages from '../../utils/pages';

type MyFixtures = {
  bookPage: BookPage;
}
export type Duplicate = {
  isDupe: boolean;
}
export const test = base.extend<MyFixtures & Duplicate>({
  isDupe: false, 
  bookPage: async ({ page, isDupe }, use) => {
    const bookPage = await hooks.beforeEach(page, BookPage, pages.bookStorePage);
    await use(bookPage);
    await bookPage.addToYourCollection(isDupe);
  },
});

export { expect } from '@playwright/test';
```
### Quiz
1. **What are some of the advantages of using dynamic page object creation?**

	speed up test implementation; increase code maintainability

2. **Building the url dynamically can be hard to implement the first time because you need to understand the application pattern**
	true

3. **What does the command `use` do when it's inside a fixture?**

	It goes straight to the test and executes all the test steps. When the test is done, it returns to the fixture and continues to the next available step.
	
4. **How do we pass params between tests and fixtures?**
	`test.use({ paramName: value }) ;`

### Exercises
1. Implement a new test using dynamic page object for the Forms page (https://demoqa.com/automation-practice-form). Note that this page doesn't require a sign in, so you'll need to have it covered. What changes in the existing code you had to make? How did you handle the buildUrl strategy?

2. Implement a new test using fixture for the search at the Book Store page (https://demoqa.com/books). Explore scenarios for 1 single result ("You Don't Know JS"), multiple results ("java") and no results ("playwright"). How easy was to implement those multiple scenarios? Is the code easy to understand? Do you considere the use of fixtures for this scenario a good strategy?

3. Implement a new test using fixture for the search at the Book Store page (https://demoqa.com/books). Explore scenarios for 1 single result ("You Don't Know JS"), multiple results ("java") and no results ("playwright"). Explore the use of params too. How easy was to implement those multiple scenarios? Is the code easy to understand? Do you considere the use of fixtures for this scenario a good strategy?
### Resources
[test-fixtures](https://playwright.dev/docs/test-fixtures)
## Chapter 3 - Interacting with APIs
To learn about HTTPS requests, we are going to use the ``book-with-fixture-and-api-spec.ts`` which is under specs, and the ``delete-books-collection.ts``, which is under api/requests.
### APIRequestContext
This is a Playwright object that allows us to make the connection with the API.

In our ``beforeAll`` method, we are then creating a new connection using ``playwright.request.newContext``, passing the ``baseURL``, and the extra ``HTTPHeaders``.

Here, we are using Authorization: Basic passing the ``userName`` and ``password``, and Accept: 'application.json'.

Another way of doing this is using the apiToken if your application supports that.

As soon as this command is called, it will create a connection with the API, and from that, we can execute any command that we need.

In our ``test.describe``, we already see that we are using the fixture ``bookPage``, and inside the method ``cleanBooks`` we see the ``deleteBookAPIRequest``, ``deleteAllBooksByUser``.

This method is passing the ``apiContext`` and the ``userId``, and this is the method that we use to call our API.


**``book-with-fixture-and-api-spec.ts``**
``` typescript
/**
 * 1. import the fixture file instead of the @playwright/test
 * 2. as soon as you use "bookPage" as a param of the test, the fixture will be called 
 * 3. In the fixture file, will create the POM
 * 4. Next step in the fixture is the function "use", so it goes back to the test file
 * 5. In the test file, it will execute all the commands, (cleanBooks and bookPage.goto)
 * 6. As the test ends, it goes back to the fixture and executes the first intruction after the "use"
*/
import { test } from '../fixtures/books-fixture';
import { APIRequestContext, Page } from '@playwright/test';
import baseAPIUrl from '../../utils/environmentBaseUrl';
import deleteBookAPIRequest from '../../api/requests/delete-books-collection';
import userData from '../../data/user-data';

test.describe.configure({ mode: 'serial' });

let apiContext: APIRequestContext;
const env = process.env.ENV!;
const password = process.env.PASSWORD!;
const userId = process.env.USERID!;
const userName = process.env.APP_USERNAME!;

test.beforeAll(async ({ playwright }) => {
    // apiContext = await playwright.request.newContext({ storageState: 'storageState.json' });
    apiContext = await playwright.request.newContext({
        baseURL: baseAPIUrl[env].api,
        extraHTTPHeaders: {
            // Authorization: `Basic ${apiToken}`,
            Authorization: `Basic ${Buffer.from(`${userName}:${password}`).toString('base64')}`,
            // Authorization: `Basic ${env}`,
            Accept: 'application/json',
        },
    });
});

test.describe('Books - Fixture & API', () => {
    // The scope of use is file or describe
    test.use({ isDupe: false });
    test('Add brand new book', async ({ page, bookPage }) => { //first thing that will happen is to call the fixture automatically. whenever the fixture has a "use" it goes back to the test and then go back to the fixture again when the test is done and execute any remaining commands
        await cleanBooks(userId, page);
        await bookPage.goto(userData.books.new);
    });
});

async function cleanBooks(userId: string, page: Page) {
    await deleteBookAPIRequest.deleteAllBooksByUser(apiContext, userId);
    // await page.reload();
};


```

### HTTPS Methods, Request Options & Request URLs

Going to the method in ``delete-books-collection.ts``, we have normal imports, and this is the method we created.

**``delete-books-collection.ts``**
``` typescript
import { APIRequestContext } from '@playwright/test';
import { buildUrl } from '../../utils/apiUrlBuilder';
import { executeRequest } from '../../utils/apiRequestUtils';
import endpoints from '../../utils/apiEndpoints';
import methods from '../../utils/apiMethods';

async function deleteAllBooksByUser(apiContext: APIRequestContext, userId: string) {
  const method = methods.delete;
  const requestOptions = {};
  const requestUrl = buildUrl(endpoints.books.delete, userId);
  const response = await executeRequest(apiContext, requestUrl, method, requestOptions);
}

async function deleteBookAPIByIsbn(apiContext: APIRequestContext, userId: string, isbn: string) {
  const method = methods.delete;
  const requestOptions = { data: { isbn: isbn, userId: userId }};
  const requestUrl = buildUrl(endpoints.books.delete);
  const response = await executeRequest(apiContext, requestUrl, method, requestOptions);
}

export default { deleteAllBooksByUser, deleteBookAPIByIsbn };

```

Here, you see a sequence of four commands that will actually do everything for us.

First, we are defining the ``method`` of the API call - in this case, it is a ``delete``.

I have a file here ``apiMethods.ts`` mapping all the methods that we have.
``` typescript
export default {
  delete: 'delete',
  get: 'get',
  post: 'post',
  put: 'put',
};
```

Second is the ``requestOptions``. In this case, for ``deleteAllBooksByUser``, it's empty, but we could be passing a parameter, as we'll see here.

The fourth is the ``requestUrl``, that is actually the URL the endpoint will call, and here we are using ``buildUrl``, passing the ``endpoint``, and the ``userId``.
```typescript
export function buildUrl(endpoint: string, userId?: string, isbn?: string) {
  const env = process.env.ENV!;
  const url = [
    bindUrl(endpoint, env, userId, isbn),
    searchParamsForUrl(endpoint, userId),
  ]
  .filter(Boolean)
  .join('?');
  
  return url;
}
```

Finally, the command ``executeRequest`` will execute the request.
``` typescript
export async function executeRequest(
  apiContext: APIRequestContext,
  requestUrl: string,
  method: string,
  requestOptions: object
) {
  try {
    const response = await apiContext[method](requestUrl, requestOptions);
    const responseCode = await response.status();
    const responseOk = await response.ok();

    if (!responseOk) {
    // if (responseCode !== 200) {
      const errorStatus = `Code: ${responseCode} \r\n`;
      const responseStatus = `Status: ${responseOk} \r\n`;
      const errorResponse = `Response: ${await response.text()} \r\n`;
      throw `${errorStatus} ${errorResponse} ${responseStatus} `;
    }

    return response;

  } catch (error) {
    const errorRequestUrl = `Request url: ${requestUrl} \r\n`;
    const errorRequestMethod = `Method: ${method} \r\n`;
    const errorRequestOptions = `Request options: ${JSON.stringify(requestOptions)} \r\n`;

    throw new Error(
      `Invalid request! Failed on \'executeRequest\' method. \r\n ${errorRequestUrl} ${errorRequestMethod} ${errorRequestOptions} ${error}`
    );
  }
}
```


By doing these four commands, you can see that you can copy that same standard for every single method, and it can be easily replicated.
### Execute a request dynamically
We created an ``apiContext``, which is the connection to our API, passing the ``userName`` and the ``password``.

``` typescript
test.beforeAll(async ({ playwright }) => {
    // apiContext = await playwright.request.newContext({ storageState: 'storageState.json' });
    apiContext = await playwright.request.newContext({
        baseURL: baseAPIUrl[env].api,
        extraHTTPHeaders: {
            // Authorization: `Basic ${apiToken}`,
            Authorization: `Basic ${Buffer.from(`${userName}:${password}`).toString('base64')}`,
            // Authorization: `Basic ${env}`,
            Accept: 'application/json',
        },
    });
});
```

With that, we'll have the connection authorised, and we can perform more calls - get, post, delete, whatever.

In our test, we do have a method called ``cleanBooks`` that will call ``deleteAllBooksByUser`` where we see that we are mounting the request.

``` typescript
async function deleteAllBooksByUser(apiContext: APIRequestContext, userId: string) {
  const method = methods.delete;
  const requestOptions = {};
  const requestUrl = buildUrl(endpoints.books.delete, userId);
  const response = await executeRequest(apiContext, requestUrl, method, requestOptions);
}
```

If we look at ``apiEndpoints.ts``, this is where the endpoints under test are defined.

``` typescript
export default {
  books: {
    delete: 'api.books/delete',
    post: 'api.books/post',
    put: 'api.books/put',
  },
  account: {
    get: 'api.account/get',
  }
};

```

With ``bindUrl``, we are mapping these parts, then mounting the URL, adding the userId in case it exists, or adding the ISBN, in case it exists. Then, we join everything with a slash.

``` typescript
function bindUrl(endpoint: string, env: string, userId?: string, isbn?: string) {
  const parts = endpoint.replace(/\/.+$/, '').split('.');


  const endpointParts = parts.map((part) => {
    switch (part) {
      case 'api':
        return baseAPIUrl[env].api;
      default:
          return apiPath[part] ?? '/';
    }
  });


  if (endpoint === endpoints.account.get) {
    endpointParts.push(userId);
  }
  if (endpoint === endpoints.books.put) {
    endpointParts.push(isbn);
  }

  return endpointParts.join('/');
}
```


Back to the ``bindUrl``, we are mapping these parts, then mounting the URL, adding the userId`` ``in case it exists, or adding the ``ISBN``, in case it exists.

``` typescript
function bindUrl(endpoint: string, env: string, userId?: string, isbn?: string) {
  const parts = endpoint.replace(/\/.+$/, '').split('.');
  
  const endpointParts = parts.map((part) => {
    switch (part) {
      case 'api':
        return baseAPIUrl[env].api;
      default:
          return apiPath[part] ?? '/';
    }
  });
        
  if (endpoint === endpoints.account.get) {
    endpointParts.push(userId);
  }
  if (endpoint === endpoints.books.put) {
    endpointParts.push(isbn);
  }

  return endpointParts.join('/');
}
```

Again, the ``searchParamsForUrl`` method params will bind the parameters, in case they exist.

``` typescript
function searchParamsForUrl(page: string, userId?: string) {
  let queryParams;

  switch (page) {
    case endpoints.books.delete:
      queryParams = { UserId: userId };;
      break;
    default:
      queryParams = {};
  }

  return new URLSearchParams(queryParams).toString();
}
```



An example of how each part would look like for this books/delete endpoint.
- Here we have the "endpoint".
- Here we have the "parts".
- Here we have the "endpointParts", and then the "join", the "UserId", and finally the "url".
This is exactly what's going to be used in our buildUrl - that's going to be our endpoint.

```
/**
  * endpoint  api.books/delete
  * parts  [ 'api', 'books' ]
  * endpointParts  [ 'https://demoqa.com', 'BookStore/v1/Books' ]
  * endpointParts join  https://demoqa.com/BookStore/v1/Books
  * queryParams { UserId: '1117e3d4-9f6e-45a7-a8a9-db3ecf7b9603' }
  * url  https://demoqa.com/BookStore/v1/Books?UserId=1117e3d4-9f6e-45a7-a8a9-db3ecf7b9603
 */

```



When we go to executeRequest, we are receiving the parameters.

``` typescript
export async function executeRequest(
  apiContext: APIRequestContext,
  requestUrl: string,
  method: string,
  requestOptions: object
) {
  try {
    const response = await apiContext[method](requestUrl, requestOptions);
    const responseCode = await response.status();
    const responseOk = await response.ok();

    if (!responseOk) {
    // if (responseCode !== 200) {
      const errorStatus = `Code: ${responseCode} \r\n`;
      const responseStatus = `Status: ${responseOk} \r\n`;
      const errorResponse = `Response: ${await response.text()} \r\n`;
      throw `${errorStatus} ${errorResponse} ${responseStatus} `;
    }

    return response;

  } catch (error) {
    const errorRequestUrl = `Request url: ${requestUrl} \r\n`;
    const errorRequestMethod = `Method: ${method} \r\n`;
    const errorRequestOptions = `Request options: ${JSON.stringify(requestOptions)} \r\n`;

    throw new Error(
      `Invalid request! Failed on \'executeRequest\' method. \r\n ${errorRequestUrl} ${errorRequestMethod} ${errorRequestOptions} ${error}`
    );
  }
}
```



This first line is exactly the execution of the endpoint.


```typescript
const response = await apiContext[method](requestUrl, requestOptions);
```

It'll call the ``apiContext``, passing the method, the ``requestUrl``, and the ``requestOptions``.
### Error Handling

We are storing the ``responseCode`` and the ``responseOk`` here, and we create an ``!if`` condition to make sure the response is okay.

If it's not, we will log the response, and if there is an error, we will catch that too, printing our console and in our report everything about this error.

That's how we handle the errors in the application.

I forced an error by changing the user ID to an invalid ID, and here is what we got.
![](assets/chapter3-img9.png)
### Quiz
1. **What are the 3 needs to execute an API call using APIContextRequest?**
		https method, request Options, request URL

2. **We would implement an error handling file to increase reusability and to provide clear logs in case of an issue.**
		true

3. **Playwright supports only DELETE and POST, it doesn't support GET yet.**
		false

4. **Building the URL dynamically is required to execute an API call. Playwright doesn't support strings as URLS**
		false

### Exercises
1. Implement a new test for "delete 1 book from the collection" (https://demoqa.com/profile) using the existing `deleteBookAPIByIsbn` in [delete-books-collection.ts](/tests/api/requests/delete-books-collection.ts). 


2. Implement a new test for "add list of books to collection" (this is not available in the UI, only via API) - Here is the [swagger doc](https://demoqa.com/swagger/#/BookStore/BookStoreV1BooksPost:~:text=Description-,addListOfBooks,-*). 
### Resources
1. [class-apirequestcontext](https://playwright.dev/docs/api/class-apirequestcontext)
2. [class-apirequest](https://playwright.dev/docs/api/class-apirequest)
3. [class-apiresponse](https://playwright.dev/docs/api/class-apiresponse)

## Chapter 4 - Data Management
### .env file

#### Example `.env` file
``` json
APP_USERNAME='Matthew'
USERID='3b93751b-bba8-442f-a52a-254c88b58767'
PASSWORD='dfE!5wb1c&KCrw'
ENV='local'
APITOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6Ik1hdHRoZXciLCJwYXNzd29yZCI6ImRmRSE1d2IxYyZLQ3J3IiwiaWF0IjoxNzU2NDc3OTgwfQ.6PCGMDfyyvIy6t2cA18Op9tZ7hqum_H9Z3aEPvraAcY"
SLACK_WEBHOOK_URL='https://hooks.slack.com/services/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'
USERNAME_ADMIN='tau-admin'
USERNAME_USER='tau-user'
APPLITOOLS_API_KEY='maythequalitybewithyou'

```

Usually included in the `.gitignore` file

#### Setup
To use it the following is required in the `playwright.config.ts` file

``` typescript
require('dotenv').config()
```

as well as the following dependency in the `package.json` file
```json
    "dotenv": "^16.1.4" // not specifically this version but you get the idea
```

#### Usage
Examples of how you can access the defined variables in the `.env` is

**In a test file**
``` typescript

// // The `!` tells TypeScript that we are sure this env variable exists (non-null/non-undefined)
const username = process.env.APP_USERNAME!;
const password = process.env.PASSWORD!;
```

**In a configuration file**
``` typescript
  use: {
    storageState: 'storageState.json',
    trace: 'on',
    baseURL: process.env.ENV === 'production' 
      ? baseEnvUrl.production.home
      : process.env.ENV === 'staging' 
        ? baseEnvUrl.staging.home
        : baseEnvUrl.local.home
  },
```


#### Github Variables & Secrets
In GitHub inside your report you can go to Settings, scroll the left menu and find "Secrets and variables".
Click "Actions" and you'll find a "Secrets" tab and a "Variables" tab.

![](assets/chapter4-img5.png)

The difference between both is that secrets won't be logged - it'll be masked - and variables will be logged.

For example, if you are using an environment variable ``ENV``, it's okay to have it exposed here because it's okay to know the value.

But in the secrets, like ``APITOKEN``, you don't want to expose that to anyone, so it will mask it and keep it as a secret.

### JSON file

HERE via TS 3:16
### API


### Mock Data (https interception)

### CSV file

### Quiz
1. Why is it not recommended to push .env files?

2. What is a right way to use .env data in a file?

3. What is not a valid sintax?

4. Why is more recommended to manipulate data via API than via database?

5. Mocking the responses is a great resource and it should be used everytime we don't have testing data. This will guarantee the application is working 100% in all layers (UI, API, UNIT).

### Exercises

1. If you haven't yet, update your newly created tests (Exercise 2.1, 2.3, 2.4, 3.1, 3.2) to use JSON. What are the be benefits of using this approach? Is there any other approach you'd use for these scenarios?

2. Choose one of the scenarios and update it to use a CSV file. Where there any advantages from the coding perspective in using this approach? How about the advantages in terms of test runtime, which approach is the fastest?

3. Implement a test to perform a sort or a search using HTTPS interception for the Books List page (https://demoqa.com/books) - Here is the [swagger doc](https://demoqa.com/swagger/#/BookStore/BookStoreV1BooksGet:~:text=v1/Books-,Parameters,-Try%20it%20out). Do you consider this approach appropriate for this scenario? Why would you not use it?
### Resources
1. [passing-environment-variables](https://playwright.dev/docs/test-parameterize#passing-environment-variables)
2. [mock-api-requests](https://playwright.dev/docs/mock#mock-api-requests)
3. [mock-browser-apis](https://playwright.dev/docs/mock-browser-apis)
4. [create-tests-via-a-csv-file](https://playwright.dev/docs/test-parameterize#create-tests-via-a-csv-file)
## Chapter 5 - CI with Observability

### Quiz

### Exercises

### Resources