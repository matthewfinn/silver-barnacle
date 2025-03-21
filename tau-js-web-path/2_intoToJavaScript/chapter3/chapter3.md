# Chapter 3 - Functions
## Chapter 3.1 - Functions
Functions have a few goals:
* Help you organize your code for readability.
* Allow you to take blocks of code and make them easily repeatable.

All functions return something. If it does not explicitly return something, it must return undefined.

## Chapter 3.2 - Anonymous functions & Arrow functions
### Anonymous Functions
These are functions that have the same rules - they need an input, output and logic,** but the major difference here is that we don't give these functions a name**, hence anonymous.
You'll see this most commonly when you need to pass a function as a callback.

### Callbacks
In JavaScript, callbacks are functions that can be used as inputs to another function.

Sometimes you'll want to assign some behavior or logic to happen after an event occurs.
A great example of this is the setTimeout function.
setTimeout() takes two inputs, a function, and a time in milliseconds.
The function is the behavior that should happen, and the time in milliseconds is how long we should wait for that behavior to happen.

### Arrow functions
Arrow functions are just like standard functions, except for there's a bit of syntactic difference.

