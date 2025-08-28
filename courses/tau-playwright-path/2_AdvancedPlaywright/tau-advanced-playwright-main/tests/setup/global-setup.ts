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
