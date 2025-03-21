# Chapter 1 - Intro to API Testing

[Course Resources](https://testautomationu.applitools.com/exploring-service-apis-through-test-automation/resources.html)

API stands for Application Programming Interface, which basically just means that it's one piece of code talking to another piece of code.

**Examples**

* Website talking to a database back end.
* Mobile application talking to an authentication service.

## The API Contract

The way that an API works is through a contract.

APIs are contracts that enabled communication.

* Request

  * Endpoint
  * Headers
  * Body
* Response

  * Status Code
  * Headers
  * Body

## **APIs are for developers**

Things that are important:

* Correctness - contract is honoured in the way is specified
* Provide value - doing something the application needs
* Intuitive - easy to work with

**APIs are public! Do not assume they'll only be accessed through the expected UI, they can potentially be accessed from anywhere**

Good example of API documentation - [Spotify API](https://developer.spotify.com/documentation/web-api)

## View APIs in your browser

* Chrome
  * View > Developer > Developer Tools
* Firefox
  * Tools > Web Developer > Toggle Tools

Chrome:

Select network tab > Filter XHR for HTTP requests

## View APIs from your mobile device with a proxy tool

* Fiddler
  * Optimised for Windows
  * Free
* Charles
  * Windows/Mac
  * Required a licence
