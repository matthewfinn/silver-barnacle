# Chapter 6 - Reporters 

[Reporters](https://mochajs.org/#reporters)

In general, Mocha reporters are mostly terminal based.

There are different types of reporters available as part of Mocha, of which, spec and dot matrix are the commonly used reporter types.

Spec is the default reporter.

The spec reporter outputs a hierarchical view according to the test cases.

The dot matrix reporter is a series of characters which represent the test cases.

Failures are highlighted in the red exclamation mark, the pending tests with the blue comma and the slow tests as a yellow color.

There are other types that are available like NYAN, TAP, Landing Strip, List, Progress, JSON, Json Stream.

### Using Mocha Reporters

Now let's see the first type of reporter, which is nothing but the spec.
In order to get a custom report, we need to execute this command

`mocha test/ --reporter spec`

`mocha test/ --reporter dot`

`mocha test/ --reporter nyan`

`mocha test/ --reporter json`