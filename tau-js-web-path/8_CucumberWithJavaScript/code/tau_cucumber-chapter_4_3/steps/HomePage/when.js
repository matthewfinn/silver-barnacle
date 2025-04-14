import { When } from "@cucumber/cucumber";

When(/^The user enters "(.*)" into the search bar$/, async (keyword) => {
  // Wait for the search bar to be visible and pause to see the action
  const searchBar = $(".gLFyf.gsfi");
  await searchBar.waitForDisplayed({ timeout: 5000 });
  browser.pause(2000); // Pause for 2 seconds to see the search bar

  // Click on the search bar and pause to see the click action
  await searchBar.click();
  browser.pause(2000); // Pause for 2 seconds to see the click action

  // Set the keyword value in the search bar and pause to see the text being entered
  await searchBar.setValue(keyword);
  browser.pause(2000); // Pause for 2 seconds to see the text being typed

  // Wait for the search button to be visible and clickable, then click it, with a pause
  const searchButton = $(".aajZCb .gNO89b");
  await searchButton.waitForDisplayed({ timeout: 5000 });
  browser.pause(2000); // Pause for 2 seconds before clicking the button
  await searchButton.click();
});
