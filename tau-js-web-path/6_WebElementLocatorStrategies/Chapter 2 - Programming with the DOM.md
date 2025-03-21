# Chapter 2 - Programming with the DOM

HTML, CSS, and JavaScript are all coded documents that a Web browser renders together into a visual Web page. 
When the browser renders the page and then does a subsequent execution, it needs an interface for handling the Web page. Enter the “DOM.”

The [Document Object Model](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction), or “DOM” for short, is a programming interface for HTML and XML documents. Programming with the DOM is a big deal. It enables programmers to manipulate the page in various ways, such as:

* Searching for elements
* Changing element content
* Changing the HTML structure of the page
* Changing the CSS styling of the page

The DOM is called an “object model” because it presents the page as an object. That “document object” contains an object representing each element. Element objects are nested from a root element to mirror the HTML structure of the page.

It is not dependent upon any one programming language. It is most commonly used by JavaScript to manipulate Web pages in a browser, but it could be used by any other language, too. A good example of this would be using a scripting language like Python to scrape Web page contents. Another good example would be using test automation to poke and prod pages. The DOM also works for XML.

The first step with DOM programming is getting the elements themselves. Programming with the DOM makes one thing very clear: there is a difference between an element, a locator, and a selector.

* An element is an object representing a live, rendered HTML element on the page.
* A locator is an object that points to an element on a page.
* A selector is a query string that denotes how to locate the element in the DOM.

To sum them up in one line: A locator uses a selector to find an element on a web page.

Why is this distinction important? Two main reasons:
1. Direct paths from root-to-child would be very long and complicated. It’s not uncommon for child elements to be nested under dozens of layers. Imagine programming the object references from parent to child for the whole chain - that would be crazy long! It makes more sense to write smaller, more meaningful locator queries to find desired elements.
2. There is no guarantee that specific elements will actually appear on the page. Dynamic content means ever-changing content, and elements can be added, removed, or changed on a whim. Developers could also change the HTML structure, too, so it makes more sense to try to “discover” desired elements. Errors in the HTML, CSS, or JavaScript may also cause web elements to not appear on the page at all.

For these reasons, we must separate the concerns of the element objects themselves and the locators used to find them.
There are many types of locators, such as:
* IDs
* Class names
* CSS selectors
* XPaths

Locators are the standard way for finding elements in a Web page, and that every element can have a unique locator. Also, know that a locator can return multiple elements, not just one - it will return all elements found that match its query.

Locators are also crucial for black-box testing outside of the browser. For example, Selenium WebDriver relies upon locators to find elements and interact with them. The main difference for WebDriver calls is that they cannot change the state of elements - they can only access the state and send interactions. Furthermore, WebDriver calls don’t call JavaScript directly - they operate using the WebDriver protocol.

Another browser automation tool that uses locators is Playwright. Unlike Selenium WebDriver, Playwright manipulates the browser using debug protocols. However, just like Selenium and Cypress, Playwright uses locators to find elements.

## Resources
[Intro to the DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction)
[Examples of web and XML development using the DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Examples)
[JavaScript HTML DOM](https://www.w3schools.com/js/js_htmldom.asp)
[Web Element Locators for Test Automation](https://automationpanda.com/2019/01/15/web-element-locators-for-test-automation/)

## Quiz
1. What does DOM stand for?

    Document Object Model

2. What types of documents can be modeled by the DOM interface?

    HTML & XML

3. What is a Web element locator?

   A query that finds and returns Web element objects from the DOM.

4. Why are Web elements and locators separate concerns? 

   * Page structure could change at any time due to dynamic content.
   * Referencing every element directly from root-to-child becomes unwieldy for large pages.
   * Elements might disappear from a page due to code changes or even bugs.

5. Every element on a page can have a unique locator.

   True

6. What is one thing JavaScript calls to the DOM can do that Selenium WebDriver calls cannot?

    Set an attribute value for an element.