## Chapter 2 - Exercises

1. Change the number of workers on [playwright.config.ts](../playwright.config.ts) and see how it affects the tests run time. Use the command `npm run test:e2e:all` to run all the existing tests. Note that the number of workers will change too on the terminal. Suggestions: 1, 10, 100. What happens when you change it to 100?
2. Change the reporter to 2 different options of your preference (mouse hover "reporter" to see the valid options). Besides the HTML, which ones could be useful for a project and why?
3. Change the value of trace for each option available and identify the differences between them. Note how the size of the folder changes for each option.
4. Enable the video and check how it looks. Is it more useful than the trace in your opinion?
5. Create a new project on [playwright.config.ts](../playwright.config.ts), define a few unique settings and create a new script on [package.json](../package.json). Execute the new script. What useful params would make the test run even easier for you? Suggestion: Play with the different browsers and devices.
6. Create a new test file, describe a simple new test case and implement a new test. What other locators did you use besides `getByRole` and `getByText`. How about assertions, what other LocatorAssertions did you use besides `toBeVisible`, `toHaveURL` and `not.toBeVisible`?
7. Open the [demo-todo-app.spec.ts](../tests-examples/demo-todo-app.spec.ts) and add a .only to one of the describes, run the tests. Use the command `npm run test:e2e:all`. Did it work?
8. Still in the [demo-todo-app.spec.ts](../tests-examples/demo-todo-app.spec.ts) revert the .only and add a new tag to some of the tests/describes. Update the script `test:e2e:smoke` in [package.json](../package.json) to use the new tag. Did it work?
