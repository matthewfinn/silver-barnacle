# Web Accessibility Testing Checks
World Wide Web Consortium or W3C has created the web accessibility initiative which contains resources to help you make the product that you're testing more accessible. Each of these checks has guidelines on how to do it, what to look out for and general tips.

## Checks That Can Be Automated
* **Page Title**
  * An automated tool can detect if your page doesn't have a page title.
  * Page title is important because this is the first thing that the screen reader says when a user visits your page.
  * Without a page title, your users will be confused as to what page they are on, especially if they have multiple tabs open.
* **Image text alternatives**
  * An automated accessibility testing tool can check if images have the alt text attribute.
  * If you have blind users, they rely heavily on these alt texts to help them understand the images that they can't see.
* **Headings**
  * An automated tool can also check if it has the correct heading structure and if there are any missing heading elements.
  * For example, it's recommended for your page to have at least one heading. 
  * Having a good heading structure helps out on how your page will be accessed using keyboard only.
* **Colour Contrast**
  * An accessibility testing tool can help you detect any elements on your page that doesn't have sufficient color contrast and can report basic preliminary issues.
  * This is helpful because some users will find it hard to read the text if it doesn't have a sufficient contrast between the text and the background.
* **HTML Structure**
  * You can also use an automated tool to detect errors in your HTML structure.
  * For example, it can report if there are any required elements or attributes missing in any of your HTML elements.
* **ARIA Labels**
  * The aria-label attribute is used as a label to elements where the label is not visible on the screen.
  * This is particularly helpful for using screen readers.

## Checks That Need Manual Testing
**The automated tools are there to help you detect if attributes are present.**

* **Page Title**
  * For example, it will report if a title element is there, but you still need to check if the page title makes sense
  * 
* **Image text alternatives**
  * You can have this attribute added in, but you still need to verify if the value of this attribute makes sense, especially when it's being used by a screen reader.
* **Headings**
  * We still need to verify the heading structure makes sense by using your keyboard to access the page.
* **Colour Contrast**
  * With color contrast, you can't just rely on what the tool is telling you. You still need to assess this yourself manually. The tool is just here to guide us.
* **HTML Structure**
  * With the HTML structure, you still need to use your keyboard to test that the structure makes sense when accessing it with your keyboard only.
* **ARIA Labels**
  * You still have to use a screen reader to determine if the label name provided makes sense and gives more meaning to the element that you are focusing on.

**So as you can see, human intervention is still very much needed if you're doing accessibility testing.**
**Automation can help us identify issues earlier on, but it cannot be relied on 100%.**

## Other Considerations
* **Feedback on form submissions**
  * If you have forms on your website, you need to make sure that there is feedback provided whenever your users submit the form or make mistakes. 
  * The messages should be clear and easy to understand.
* **Clarity of Subtitles**
  * If you have any videos embedded, you need to test that the subtitles are clear and represent the video well.
* **Can Animations be switched off?**
  * Make sure that there is an option to turn this off as users might find these attracting. Give them the option to control it.
* **Is the content accessible via keyboard only?**
  * Uou still need to use your keyboard to verify some of the automated accessibility checks, so this is really important when doing accessibility testing.
* **Are elements focusable?**
  * When you focus on an element, is it clear? Do the users know that they are on that element?
* **Does it have clear fonts?**
  * Does your website have clear fonts? Make sure as well that the content is easy to read and understand.
* **Can audio levels be modified?**
  * If you have audio or videos, make sure that the audio levels can be modified and your users can control these.
* **Is the layout responsive?**
  * Is the layout responsive? If they are on mobile, are you showing the mobile version?
  * Are buttons or links big enough? So when they're using devices with smaller view ports, they can access this easily.

## Tips on doing accessibility testing
1. **First, decide within your team what Web Content Accessibility Guideline level you want to achieve.**
2. **Get involved with your UX team and collaborate with them.**
3. **Start testing on a basic page and just play around with it.**
4. **Use your keyboard more and try not to use your mouse.**
5. **Play around with screen readers.**
6. **Turn off your speakers and test if there is a way to turn subtitles or captions on.**
7. **Use an accessibility testing checklist so you have an idea on what to track and what to suggest to your teams to fix.**
8. **Do exploratory testing and timebox your sessions. Set the goal that you want to achieve.**
9. **Decide on what other tools can help you.**

## Resources
[Web Accessibility Initiative](https://www.w3.org/WAI/)
[Web Accessibility Easy Checks](https://www.w3.org/WAI/test-evaluate/preliminary/)
[Automated Accessibility Rules from Deque](https://dequeuniversity.com/rules/axe/4.0)