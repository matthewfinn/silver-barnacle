# Chapter 6 - Advanced XPaths

### Selecting elements by text

Search results on DuckDuckGo are, as of today anyway, contained in a `<article/>` tag
where there is an attribute called `data-testid` that contains the value `result`.

If we want to search each of these to find the result that contain the phrase "GeeksForGeeks" we would do something like:

`//article[contains(@data-testid, "result")][contains(., "GeeksForGeeks")]`
This little dot right here (the one before the comma and "GeeksForGeeks") will get the text displayed for the element.

There's also a text function like this: `contains(text(), "GeeksForGeeks")]`

Can easily use my not function along with this also if we want to search for results that don't contain the phrase "GeeksForGeeks"

`//article[contains(@data-testid, "result")][not(contains(., "GeeksForGeeks"))]`

### Selecting elements by index

XPath can put indexes on any element.
For example if we want the 3rd article from the results list we would do
`(//article[contains(@data-testid, "result")])[3]`

### Selecting elements relative to other elements using advanced relationships

This is helpful when the desired element doesn't have a decent anchor of its own, or when trying to select a range of elements in a list.
Let's say we want to get all links on the page that have an image inside of them.

`//a[.//img]`

### Axes for relationships to the current node

An axis represents a relationship to the context (current) node, and is used to locate nodes relative to that node on the tree.

The two most useful axes I found are the “preceding” and “following” axes.

#### Preceding

Let's say that we want to get the links underneath the search bar. If I find them in source of the page,
I can see that they all have this class “zcm__link”. I can write an XPath like this:
`//a[contains(@class, "zcm__link")]`

If I want to get only the links after the web link,
if I look at the web link, I can see that it has a unique “data-zci-link” named “web”. I could update my XPath like this:
`//a[contains(@class, "zcm__link")][preceding::a[@data-zci-link="web"]]`
Be careful. The “preceding” axes doesn't select links that come before the web link. It selects the links that have the web link come before it.

#### Following

If I want to get only the links before the videos link, I could use the following axes instead:
`//a[contains(@class, "zcm__link")][following::a[@data-zci-link="videos"]]`

## Quiz

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

1. **XPaths are always slower than CSS selectors.**

   False
2. **Which of the following XPaths would locate a <p> paragraph that contains the word “elephant”?**

   `//p[contains(., "elephant")]`
3. **What are abilities XPath has that CSS selectors do not have?**

   Locating elements by text contents
   Locating any element by index
   Locating elements using conditional positions and axes
4. **Which of the following selectors would uniquely identify the “Rebuttal” header element in the above HTML?**

   `//h2[.="Rebuttal"]`
   `//div[@class="section"]/h2[starts-with(text(), "R")]`
   `(//h2[contains(@class, "topic-header")])[2]`

## Resources

[XPath Syntax](https://www.w3schools.com/xml/xpath_syntax.asp)
[XPath Tutorial](https://www.w3schools.com/xml/xpath_intro.asp)
[XPath Functions](https://developer.mozilla.org/en-US/docs/Web/XPath/Functions)
[XPath Axes](https://www.w3schools.com/xml/xpath_axes.asp)
[CSS Vs. XPath](http://elementalselenium.com/tips/32-xpath-vs-css)
[XML & XPath](https://www.w3schools.com/xml/xml_xpath.asp)
