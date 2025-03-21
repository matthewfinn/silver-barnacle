# Chapter 7 - Picking the Right Locator
## Choosing the best locator

Here’s my order of preference
1. Test ID using a data- attribute
2. ID (if the ID is unique on the page)
3. Input name (if the name is unique on the page)
4. Class name
5. Text value
6. CSS selector
7. XPath without text or indexing
8. Link text or partial link text
9. XPath with text and/or indexing

For example, we shouldn’t jump to using XPaths wherever IDs and class names will suffice. Test automation should always be as intuitive as possible.

## Resources
https://automationpanda.com/2019/01/15/web-element-locators-for-test-automation/
https://playwright.dev/python/docs/locators
https://playwright.dev/python/docs/codegen
https://applitools.com/docs/features/visual-locators.html
https://selectorshub.com/