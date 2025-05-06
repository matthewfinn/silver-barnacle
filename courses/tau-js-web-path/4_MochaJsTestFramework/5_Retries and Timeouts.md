# Chapter 5 Retries & Timeouts

### Retry

[Retry Tests](https://mochajs.org/#retry-tests)

You can choose to retry failed tests up to a certain number of times. This feature is designed to handle end-to-end tests (functional tests/Selenium…) where resources cannot be easily mocked/stubbed.
**It’s not recommended to use this feature for unit tests.**

This feature does re-run a failed test and its corresponding `beforeEach/afterEach` hooks, but not `before/after` hooks. `this.retries()` has no effect on failing hooks.

````js
describe('retries', function () {
    // Retry all tests in this suite up to 4 times
    this.retries(4);

    beforeEach(function () {
        browser.get('http://www.yahoo.com');
    });

    it('should succeed on the 3rd try', function () {
        // Specify this test to only retry up to 2 times
        this.retries(2);
        expect($('.foo').isDisplayed()).to.eventually.be.true;
    });
});
````


### Timeouts

[Timeouts](https://mochajs.org/#timeouts)

#### Suite-Level
Suite-level timeouts may be applied to entire test “suites”, or disabled via `this.timeout(0)` 
This will be inherited by all nested suites and test-cases that do not override the value.

````javascript
describe('a suite of tests', function () {
  this.timeout(500);

  it('should take less than 500ms', function (done) {
    setTimeout(done, 300);
  });

  it('should take less than 500ms as well', function (done) {
    setTimeout(done, 250);
  });
});
````

#### Test-Level
Test-specific timeouts may also be applied, or the use of this.timeout(0) to disable timeouts all together:
````javascript
it('should take less than 500ms', function (done) {
  this.timeout(500);
  setTimeout(done, 300);
});
````

#### Hook-Level
Hook-level timeouts may also be applied:

````javascript
describe('a suite of tests', function () {
  beforeEach(function (done) {
    this.timeout(3000); // A very long environment setup.
    setTimeout(done, 2500);
  });
});
````
Again, use `this.timeout(0)` to disable the timeout for a hook.

