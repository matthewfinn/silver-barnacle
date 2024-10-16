/**
 * Write a function createCounter. It should accept an initial integer init. It should return an object with three functions.
 * The three functions are:
 * 		increment() increases the current value by 1 and then returns it.
 * 		decrement() reduces the current value by 1 and then returns it.
 * 		reset() sets the current value to init and then returns it.
 * /
 * 
 * 
 * /**
 * @param {integer} init
 * @return { increment: Function, decrement: Function, reset: Function }
 */
var createCounter = function(init) {
	var initial = init;
	return {
		increment: () => {return ++init},
		reset: () => { init = initial; return initial},
		decrement: () => {return --init}
	}
};

/** Test Code */
 const counter = createCounter(5)
 console.log(counter.increment()); // 6
 console.log(counter.reset()); // 5
 console.log(counter.decrement()); // 4
 //*/