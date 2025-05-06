# Chapter 5 - Working with XML Response

The way that REST Assured determines how to process the response that's being returned by any given API, is it looks for the value of the content-type header.
If that's JSON, REST Assured will automatically treat the response as being JSON.
If the content-type header value in the response is equal to XML, REST Assured will see the response body as being XML, and so on, for all the types of response body contents.

Here's an example response in JSON format from our API:
```json
{
  post code: "90210",
  country: "United States",
  country abbreviation: "US",
  places: [
    {
      place name: "Beverly Hills",
      longitude: "-118.4065",
      state: "California",
      state abbreviation: "CA",
      latitude: "34.0901"
    }
  ]
}
```


And the XML equivalent:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<response>
  <postcode>90210</postcode>
  <country>United States</country>
  <countryAbbreviation>US</countryAbbreviation>
  <places>
    <place longitude="-118.4065" latitude="34.0901">
      <placeName>Beverly Hills</placeName>
      <state>California</state>
      <stateAbbreviation>CA</stateAbbreviation>
    </place>
  </places>
</response>
```
