# Chapter 4 - Test Features

### Exclusive Tests
[Exclusive Tests](https://mochajs.org/#exclusive-tests)

Allows us to execute only the specified test suite or a test case.
This can be achieved by adding .only() function, and it can be added to both describe() and it() functions.

````javascript
var assert = require('assert');

describe('Mathematical Operations - Test Suite', function(){
    var a = 10;
    var b = 10;

  it.only('Addition of two numbers', function(done){
    var c = a+b;
    assert.equal(c,20);
});
````

### Inclusive Tests
[Inclusive Tests](https://mochajs.org/#inclusive-tests)

Inverse of the .only() function.
This can be achieved by adding .skip(). 
This will tell Mocha to simply ignore these tests suites or test cases. 
This is applicable for both pre-bundled functions, describe() and it().

````javascript
var assert = require('assert');

describe('Mathematical Operations - Test Suite', function(){
    var a = 10;
    var b = 10;

  it.skip('Addition of two numbers', function(done){
    var c = a+b;
    assert.equal(c,20);
});
````

### Pending Tests
[Pending Tests](https://mochajs.org/#pending-tests)

Pending tests are the ones that someone should write eventually.
Pending tests will be included in the test results and marked as pending. A pending test is not considered as failed a test.
A pending test will not be having a callback function.
````javascript
// Pending Test
    it('This is a test for Pending Test Feature');
````

