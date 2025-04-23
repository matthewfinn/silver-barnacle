import { Given } from '@cucumber/cucumber';
import goToURL from "../../support/actions/goToURL";
import homePage from "../../pages/Home";

Given("A web browser is at the Google home page", () => {
  goToURL(homePage.url);
});