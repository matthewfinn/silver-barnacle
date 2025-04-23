import { Given } from '@cucumber/cucumber';
import goToURL from "../../support/actions/goToURL";

Given("A web browser is at the Google home page", () => {
  goToURL("/");
});