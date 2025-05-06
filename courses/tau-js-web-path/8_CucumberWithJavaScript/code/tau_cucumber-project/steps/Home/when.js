import { When } from "@cucumber/cucumber";
import search from "../../support/actions/search";

When(/^the user searches for "(.*)"$/, keyword => {
  search(keyword);
});

When(/^the user clicks on the "(.*)" menu option in the menu$/, option => {
  selectMenuOption(option);
});