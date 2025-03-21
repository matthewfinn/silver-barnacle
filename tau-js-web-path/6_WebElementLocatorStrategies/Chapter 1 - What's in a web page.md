# Chapter 1 - What's in a Web Page?
A "Web page" is a document on the World Wide Web that can be displayed in a browser on a computer or device. 
Popular websites like Google, Facebook, and Wikipedia all have multiple pages with different content. 
Users can find web pages using URL addresses or search engines.

For example, let’s look at [this](https://en.wikipedia.org/wiki/Giant_panda) Wikipedia article on giant pandas. 
There’s quite a bit of content on this page:
* A title for the article
* Paragraphs of text
* Pictures of pandas 
* A search bar 
* Links to other articles
  
There are three main components:
1. HTML
2. CSS
3. JavaScript

## HTML
HTML stands for "Hypertext Markup Language." HTML is like the skeleton of the page: it provides the structure for all the content. 
HTML itself is not a programming language but rather a markup language: it simply declares what should appear. 
HTML pages have standard sections, and each "thing" on the page is written as an element.

Elements are written like this:
````html
<tagName attribute="value">content</tagName>
````
Each element type has a unique tag name. The element declaration begins and ends with the tag name surrounded by angle brackets `<>`, 
but the ending tag name is prefixed with a forward slash `/` to indicate the ending. 
The starting tag may also include attributes to customize the element. Content may be placed between the tags, such as raw text or other "nested" elements.

Below are some example elements in HTML:
* A paragraph of text: `<p>Hello, world!</p>`
* A link to another page: `<a href="[https://www.google.com/](https://www.google.com/)">Go to Google</a>`
* A header for large text: `<h1>BIG NEWS!</h1>`
* A button: `<button type="button">Click Me!</button>`
* A text input area: `<textarea rows="4" cols="50">Enter info here.</textarea>`
* An image: `<img src="smiley.gif" alt="Smiley face" width="42" height="42" />`

A basic HTML document could look like this:
```html
<!DOCTYPE html>
<html>
    <head>
   	 <title>Hello, World!</title>
    </head>
    <body>
       <div class="main-content">
   	    <h1>BIG NEWS!</h1>
    	    <p>HTML is awesome.</p>
       <div>
    </body>
</html>
```

## CSS
CSS stands for "Cascading Style Sheets." If HTML is the skeleton of the page, then CSS is the skin. 
It controls style and formatting for the appearance of the page. CSS can control things like:
* Colors
* Size
* Font
* Position
* Layout

Although CSS can be added directly to any HTML element using the style attribute, it is a best practice to put CSS into separate .css files for reusability. It is also common to create CSS "classes" to apply the same styles to specific elements.

Here’s an example of a CSS document:
```css
body {
  background-color: lightblue;
}
.main-content {
  Font-family: Helvetica;
}
```

The `body` styling will apply to all body elements. 
The `.main-content` styling will apply to all elements that use the `main-content` class, like the `div` element in the example HTML document above.

## JavaScript
HTML and CSS work together nicely, but they are static: They don’t make changes happen on the Web page. 
Dynamic content must come from JavaScript, a programming language that acts like the muscles of the page. 
Developers can use JavaScript to change elements and styling, handle user input, make service calls to backend systems, and more. 
Practically all modern Web applications use JavaScript to deliver a dynamic user experience on the front-end because all major browsers support it. 
There are countless JavaScript frameworks available, too, like Angular, React, and Bootstrap. JavaScript code can be written directly in HTML files or, as a better practice, in separate .js files.

Let’s add a JavaScript file that triggers an alert:
````javascript
alert("Here's some JavaScript!");

````
If we add the following to the `head` element of our HTML:
```html
<script src="example.js"></script>
```
Then, the alert will pop up whenever we load the page!

The Web browser is what brings these three pieces together. The browser is an application that loads and renders content from the World Wide Web. 
When a user requests a page through a browser, the website will return the HTML, CSS, and JavaScript files for the browser to execute and display. 
The browser brings the page to life! As a side comment, note that despite language standards, each browser handles things slightly differently, so watch out for peculiarities.

## Quiz

1. **What does HTML do in a web page?**
    
   HTML is a markup language that provides the structure of the page and its elements.
   
2. **HTML elements can have child elements nested within their content.**

   True

3. **Which of the following is something that CSS can do?**

   Set text size for the whole page to be small.
   Change the background color for a page.
   Position sections on a page relative to each other.
   **All the above.**

4. **How can CSS be added to an HTML element without using a separate .css file?**

   Set the element’s “style” attribute to the desired CSS properties.

5. **What analogies could be made for the three major components of a web page?**
   
   HTML is the skeleton, CSS is the skin, JavaScript is the muscle

6. **Why do nearly all modern Web applications use JavaScript for their front-end?**

   All major browsers support JavaScript for client-side execution.