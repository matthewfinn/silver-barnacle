# Chapter 4 - CSS Selectors
CSS selectors are expressions that use pattern matching to find elements on a web page. 
CSS documents use these selectors to apply style to elements.

Example:
~~~css
body {
  background-color: lightblue;
}

.main-content {
  font-family: Helvetica;
}
~~~
Both body and `.main-content` are simple CSS selectors. body matches any body HTML element, and `.main-content` matches any element that has the main-content class.
    
## Writing CSS Selectors
### tag
The most basic type of CSS Selector is simply a tag name. I could type “body” or “div”, or any other type of tag name in, and that would be a valid CSS Selector

### tag & class name
It slightly more useful is to attach a class name (example, `div.result`), 
this will select all elements that have both this tag name of div and that contain a class called `result`.
It's **not** a class equals but rather a class contains. An element can multiple classes, one of which could be `result`

### class name 
To search by class name alone, do a dot, and then the class name: `.result`

### ID
To write a CSS Selector that use the id you start with a hash character: `#search_form_input`

### Chaining
##### ancestor-descendant relationships
CSS selectors can chain together ancestor-descendant relationships or parent-child relationships of elements.

Example
`div.cw div.result`
That will guarantee that I will only select all the `div.result` elements if they are descendants of the `div.cw` element or elements.

##### parent-child relationships
If you use the arrow bracket (>), that forces a direct parent-child relationship (ex. `div.cw > div.result`).

To get items with the `zcm__item` class. I could select them with `li.zcm__item`, and there are four. 

But let's say you want to get a link within the list item. 
`li.zcm__item > a`

### Combining CSS selectors
Let's say you want to get all lists on the page, whether they are ordered lists or unordered list `("ol, ul")`

Anytime you use a comma for a CSS Selector, it acts like a logical OR, meaning I want to get all elements that match this selector or that match this selector.

An example of selecting list items that appear in either ordered lists or unordered lists
``

### Attributes
Locate by attribute existence
`[style]`

You can limit this further to say I want to get only the div elements with a style attribute like this:
`div[style]`

Locate by tag with attribute value
`a[data-zci-link = 'images']`

Locate by tag with attributes contains — 
`div[class* = 'result']`

Give me all the div results that contain the `results` class but do not contain the `result—more` class
`div.result:not(.result--more)`

3rd element in the list of results
`div.result:nth-child(3)`

Locate the link itself 
`div.footer_cards a[data-id='traffic']`

Locate the title
`div.footer_cards a[data-id='traffic'] .footer__card__title`

Locate the icon
`div.footer_cards a[data-id='traffic'] .footer__card__icon`

Locate by the text
`div.footer_cards a[data-id='traffic'] .footer__text`

### Basic CSS Selector Examples
Tag name: `div`
Class name: `.result`
Tag and class name: `div.result`
ID: `#search_form_input`
Descendants: `div.cw div.result`
Direct children: `li.zcm__item > a`
Multiple selectors: `ol, ul`
Attribute existence: `[style]`
Tag with attribute: `div[style]`
Tag with attribute equality: `a[data-zci-link='images']`
Tag with attribute contains: `div[class*='results']`
Logical not pseudoclass: `div.result:not(.result--more)`
Nth child pseudoclass: `div.result:nth-child(5)`

## Conclusion
CSS selectors are great web element locators. They can be much more specific than IDs and class names for the elements they select. They also use CSS syntax, so most web developers already know how to use them. However, they can also become complex - and sometimes unnecessarily complex. 
Always make sure to test your CSS selectors when writing them.
Furthermore, CSS selectors are not all-powerful: they cannot uniquely identify any given element on the page. CSS selectors can never select elements by text content, and they cannot always select elements by index. We will need XPath for those locators.

## Quiz
HTML Document for Quiz Questions 5 and 6

````html
<html>
<body>
	<div class=”article opinion” id=”main-article”>
		<div class=”section”>
			<h2 class=”topic-header”>Main Argument</h2>
			<p>...</p>
		</div>
		<div class=”section”>
			<h2 class=”topic-header”>Rebuttal</h2>
			<p>...</p>
		</div>
		<div class=”section”>
			<button class=”response-button” name=”agree”>Agree with Argument</button>
			<button class=”response-button” name=”disagree”>Agree with Rebuttal</button>
		</div>
	</div>
</body>
</html>
````

1. **What are CSS selectors?**

   A type of Web element selector.
   Part of the CSS syntax.
   Pattern-matching expressions.

2. **CSS selectors can uniquely identify any given element on a Web page.**

    False

3. **Which of the following CSS selectors would select only “div” elements with the class name “parent”?**

   `div.parent`

4. **Which of the following CSS selectors would select only <div> elements that do not have the class name "parent"?**

   `div:not(.parent)`

5. **Review the HTML document above. Which of the following CSS selectors would uniquely identify the main article div?**

   `#main-article`

6. **Review the HTML document above. Which of the following CSS selectors would NOT uniquely identify the "Agree with Argument" button?**

   `div.article div.section button[1]`
    


    
    