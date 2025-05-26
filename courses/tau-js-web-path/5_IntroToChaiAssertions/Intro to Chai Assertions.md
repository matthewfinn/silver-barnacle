# Chapter 1 - Introduction to Chai
[Chai Assertion Library](https://www.chaijs.com/)

Chai is an assertion library for JavaScript frameworks.

Assert statements are used to make sure that the assumptions and actual results of the function are exactly same.

We need a lot of assertions in our test to make sure that the actual result is same as the expected one or
that meets the acceptance criteria of the test.

Chai's interfaces are broadly classified into two: TDD styles and BDD styles.

| **BDD** | **TDD** |
|---------|---------|
| Expect  | Assert  |
| Should  |         |

# Chapter 2 - Installing Chai

As a prerequisite, NodeJS has to be installed.
Adding Chai Assertion Library
Okay, so I have created a simple Node JS project called “chai” here. Let us see how to add Chai Library to this one.

Navigate to the project path through a terminal and enter the command:

`npm install chai -save-dev`

# Chapter 3 - Assertions
### 3.1 Assertion Styles: Assert, Expect & Should

[Course Code](https://github.com/aparna-gopalakrishnan/tau-chai-tutorial)
[Chai Documentation - Expect](https://www.chaijs.com/guide/styles/#expect)
[Chai Documentation - Should](https://www.chaijs.com/guide/styles/#should)
[Chai Documentation - Assert](https://www.chaijs.com/guide/styles/#assert)

To get the Chai interfaces we need to import Chai to this file, which can be done by creating a variable:
````javascript
var chai = require('chai')
, expect = chai.expect
, should = chai.should();
````
If using ESM (The modern module system, introduced in ES6 (ES2015)) we can use:
````javascript
import { expect, 'chai/register-should', assert } from 'chai';
````

List of chains that can be used
````javascript
/*-------
Chains
---------
to
be
been
is
that
which
and
has
have
with
    at
    of
same
but
does
still
------------
*/
````

### Expect
The BDD style is exposed through expect or should interfaces. In both scenarios, you chain together natural language assertions.
````javascript
var expect = require('chai').expect
, foo = 'bar'
, beverages = { tea: [ 'chai', 'matcha', 'oolong' ] };

expect(foo).to.be.a('string');
expect(foo).to.equal('bar');
expect(foo).to.have.lengthOf(3);
expect(beverages).to.have.property('tea').with.lengthOf(3);
````

Expect also allows you to include arbitrary messages to prepend to any failed assertions that might occur.
````javascript
var answer = 43;

// AssertionError: expected 43 to equal 42.
expect(answer).to.equal(42);

// AssertionError: topic [answer]: expected 43 to equal 42.
expect(answer, 'topic [answer]').to.equal(42);
````

This comes in handy when being used with non-descript topics such as booleans or numbers.

### Should
The should style allows for the same chainable assertions as the expect interface, however it extends each object with a should property to start your chain. This style has some issues when used with Internet Explorer, so be aware of browser compatibility.

````javascript
var should = require('chai').should() //actually call the function
, foo = 'bar'
, beverages = { tea: [ 'chai', 'matcha', 'oolong' ] };

foo.should.be.a('string');
foo.should.equal('bar');
foo.should.have.lengthOf(3);
beverages.should.have.property('tea').with.lengthOf(3);
````

#### Differences
First of all, notice that the expect require is just a reference to the expect function, whereas with the should require, the function is being executed.

````javascript
var chai = require('chai')
, expect = chai.expect
, should = chai.should();
````

The expect interface provides a function as a starting point for chaining your language assertions. It works on node.js and in all browsers.

The should interface extends Object.prototype to provide a single getter as the starting point for your language assertions. It works on node.js and in all modern browsers except Internet Explorer.

#### Should Extras
Given that should works by extending Object.prototype, there are some scenarios where should will not work. Mainly, if you are trying to check the existence of an object. Take the following pseudocode:

````javascript
db.get(1234, function (err, doc) {
// we expect error to not exist
// we expect doc to exist and be an object
});
````

Given that err should be null or undefined, err.should.not.exist is not a valid statement as undefined and null haven’t been extended with a should chain starter. As such, the appropriate few assertions for this scenario are as follows:

````javascript
var should = require('chai').should();
db.get(1234, function (err, doc) {
should.not.exist(err);
should.exist(doc);
doc.should.be.an('object');
});
````

Provided you assigned should to a var, you have access to several quick helpers to keep you out of trouble when using should.
````javascript
should.exist
should.not.exist
should.equal
should.not.equal
should.Throw
should.not.Throw
````


### Assert
The assert style is exposed through assert interface. This provides the classic assert-dot notation,
similar to that packaged with node.js. This assert module, however, provides several additional tests and is browser compatible.

````javascript
var assert = require('chai').assert
, foo = 'bar'
, beverages = { tea: [ 'chai', 'matcha', 'oolong' ] };

assert.typeOf(foo, 'string'); // without optional message
assert.typeOf(foo, 'string', 'foo is a string'); // with optional message
assert.equal(foo, 'bar', 'foo equal `bar`');
assert.lengthOf(foo, 3, 'foo`s value has a length of 3');
assert.lengthOf(beverages.tea, 3, 'beverages has 3 types of tea');
````

### Configuration
#### config.includeStack
* @param {Boolean}
* @default false

User configurable property, influences whether stack trace is included in Assertion error message. Default of false suppresses stack trace in the error message.
````javascript
chai.config.includeStack = true; // turn on stack trace
````
#### config.showDiff
* @param {Boolean}
* @default true

User configurable property, influences whether or not the showDiff flag should be included in the thrown AssertionErrors.
false will always be false; true will be true when the assertion has requested a diff be shown.

````javascript
chai.config.showDiff = false; // turn off reporter diff display
````

#### config.truncateThreshold
* @param {Number}
* @default 40

User configurable property, sets length threshold for actual and expected values in assertion errors. If this threshold is exceeded, the value is truncated.
Set it to zero if you want to disable truncating altogether.

````javascript
chai.config.truncateThreshold = 0; // disable truncating
````