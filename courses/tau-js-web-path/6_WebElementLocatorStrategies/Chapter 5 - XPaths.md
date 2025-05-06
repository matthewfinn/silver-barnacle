# Chapter 5 - XPaths
XPaths are the strongest locator type. XPath syntax can uniquely identify any element on a page. 
It can be used for both HTML and XML documents. However, XPath is also the most complicated locator type.

## Writing XPaths

#### Locate by Path from Root
`/html/body`

#### Locate by Tag Anywhere
`//input`

#### Locate by Direct Children
We can also mix the single slash and the double slash for direct children.

Let's say I wanted to find links that are in a list. 
I can start with a double slash and find any unordered list on the page, and then I can use single slashes to denote direct children “ul/li”. 
I could use another single slash to indicate direct children of links on that page.
`//ul/li/a`

#### Locate by Any Element
`//*`

#### Locate by Any Descendants
`//div//`

#### Locate by Attribute Value Equality
Can use any attribute with the `@` notation
`//li[@class="zcm__item"]`
            or 
`//input[@id="search_button"]`


### XPaths can also have logical AND and OR operations for those conditional phrases.
#### Locate by Attribute Condition AND
For example, let's say that I want to find all of these small icon images on the page that are small in size. 
I can write an XPath like this, give me the image where the width is less than 20 and the height also is less than 20.
`//img[@width<20 and @height<20]`

#### Locate by Attribute Condition OR
Select that element based on either or of these identifiers — input where the `name` equals `q` or the `id` equals `search_form_input`.
`//input[@name="q" or @id="search_form_input"]`

### Functions
#### Contains
If I were to look at all divs that contain the word `result` in their `class`
` //div[contains(@class, "result")]`

If I were to look at all divs that contain the word `result` in their `class`
` //div[contains(@class, "result")]`

#### Starts-with
divs that start with a class or have a class called `result`
`//div[starts-with(@class, "result")]`

#### NOT
Locate by Logical not function
All links that do not contain the class "header"
`//a[not(contains(@class, "header"))]`

All links that do not start with the class "header"
`//a[not(starts-with(@class, "header"))]`

## Basic XPath Rules and Examples
#### Path from root
`/html/body`

#### Tag anywhere
`//input`

#### Direct Children
`//ul/li/a`
    or
`//div/a`

#### Descendants
`//div//a`

#### Any Element
`//*`

#### Any Descendants
`//div//*`

#### Attribute Value Equality
`//li[@class="zcm__item"]`

#### Attribute Condition AND
`//img[@width<20][@height<20]`
            or 
`//img[@width<20 and @height<20]`

#### Attribute Condition OR
`//input[@name="q" or @id="search_form_input"]`

#### Contains Function
`//div[contains(@class, "result")]`
or
`//div[contains(@class, "result__snippet")]`

#### Starts with function
`//div[starts-with(@class, "result")]`
or
`//div[starts-with(@data-testid,"search")]`

#### Logical not function
`//a[not(contains(@class, "header"))]`

## Conclusion
XPaths are more complex than CSS selectors.
Sometimes, you need an XPath to pinpoint an element when the structure of a page leaves you no alternatives.

## Resources
[XPath Syntax](https://www.w3schools.com/xml/xpath_syntax.asp)
[XPath Tutorial](https://www.w3schools.com/xml/xpath_intro.asp)
[XPath Functions](https://developer.mozilla.org/en-US/docs/Web/XPath/Functions)
[XPath Axes](https://www.w3schools.com/xml/xpath_axes.asp)
[CSS Vs. XPath](http://elementalselenium.com/tips/32-xpath-vs-css)
[XML & XPath](https://www.w3schools.com/xml/xml_xpath.asp)

## Quiz
1. **Any element on a Web page can be uniquely located using XPath.**
    
    True

2. **Which of the following XPaths would locate all image <img> elements that are within hyperlink <a> elements?**

    `//div[contains(@class, "classname")]`
3. **What is the best way to get a <div> element by class name using an XPath (assuming you have made sure there are no false positives)?**

    `//div[contains(@class, "classname")]`

4. **Which of the following XPaths would locate all paragraphs that do not contain the class “main-content”?**
    
    `//p[not(contains(@class, "main-content"))]`
    



