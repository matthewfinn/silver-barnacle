# Chapter 3 - POISED API Testing Strategy

POISED Heuristic

1. Parameters
2. Output
3. Interop
4. Security
5. Errors
6. Data

[Collection](https://postman-api-fundamentals-student-expert-team-1813.postman.co/workspace/Postman-API-Fundamentals-Studen~5a01a9a7-1d98-4345-b7e0-ca86f17d9ec3/collection/8404157-e2d834b5-e333-4d84-9438-25be41248875?action=share&creator=8404157)

## Running Restful Booker API Locally

[https://github.com/mwinteringham/restful-booker](https://github.com/mwinteringham/restful-booker)

Node application

```
npm install -- retrieve packages the app requires
npm start
```

App is available on http://localhost:3001

Add 2 new environments in postman, one for production URL and one for localhost

## 3.1 Parameters (Input)

Boundary value testing. Test different values for all params, nulls, empty, remove attributes etc.

POST for creating a booking throws returns status code 500 if `firstName` parameter is empty, invalid date etc.

Find out how API reacts under different conditions.

## 3.2 Output

Most common response is `200 OK`

Delete request returns `201 created` which is strange, did we create something? This is an output error.

Add header to change output to XML - Name: `Accept`, Value: `application/xml` - Tested with _Get Booking By ID_

Now to test *Get All Bookings* which continues to return JSON - this means that endpoint is not processing the header correctly.

Logging - 500 Internal Server Error can be improved. More descriptive error messages should be included.

## 3.3 Interop(erability)

An API is nothing by itself.

It needs to communicate in a way that is useful to other services.

Considerations

* Parameter formatting (date formats for example, i.e. dd-mm-yyyy, mm-dd-yyyy)
* How you're returning your information. Example get booking by name only returns an ID so another call is required to get useful info, could it just be returned in 1 call? It would depend on the usecase for the endpoint.

## 3.4 Security

Examples require Authorization or Cookie header.

Having security at UI level is not enough to secure an API.

Cross-site scripting attack - script executed in browser

Example:

```
{
    "firstname" : "<script>alert(\"gotcha!\"</script>,
    "lastname" : "Brown",
    "totalprice" : 111,
    "depositpaid" : true,
    "bookingdates" : {
        "checkin" : "2018-01-01",
        "checkout" : "2019-01-01"
    },
    "additionalneeds" : "Breakfast"
}
```

Convert to HTML on codebeautify.org, and we can see an alert being display when it's converted

Very important to check at UI level and server level. Possible solution is to not allow `<` character

## 3.5 Errors

There are a lot of ways bad information can make its way into a request, A service needs to be able to handle this gracefully without crashing.

One important aspect is proper communication of the erroneous result.

The other important part of error handling is passing back actionable information to the application developer.

Ideally never have a `500 Internal Server Error`.

Errors should have an exception or debug log.

## 3.6 Data

Don't trust response is doing what it says, double check underlying data store via API or database.

Units are meaningless without specification of unit i.e. `"price" : 100` Euros? Dollars? Additional attribute for currency needed here.

**The last data aspect I want to talk about is scalability, so that's asking the API if I have a thousand bookings in this database, will I be able to perform all my functions quickly enough?**

Can use collection runner to run collection multiple times.

[Collection](https://postman-api-fundamentals-student-expert-team-1813.postman.co/workspace/Postman-API-Fundamentals-Studen~5a01a9a7-1d98-4345-b7e0-ca86f17d9ec3/collection/8404157-72a3fbde-4077-45e0-ac8a-64dee04ec139?action=share&creator=8404157&active-environment=8404157-68a9363e-289d-4a30-8c1e-25ed66f1c697)


![img.png](assets/img.png?t=1741631556809)
