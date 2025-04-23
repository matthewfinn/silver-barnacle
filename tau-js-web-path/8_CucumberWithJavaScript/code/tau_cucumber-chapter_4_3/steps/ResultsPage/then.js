import { Then } from '@cucumber/cucumber';
import verifyLinksContain from "../../support/assertions/verifyLinkContains";

Then(/^links related to "(.*)" are shown on the results page$/, keyword => {
  verifyLinksContain($$(".LC20lb"), keyword);
});