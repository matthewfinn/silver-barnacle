/**
 * Given an integer array nums, a reducer function fn, and an initial value init, return the final result 
 * obtained by executing the fn function on each element of the array, 
 * sequentially, passing in the return value from the calculation on the preceding element.
 * 
 * This result is achieved through the following operations: val = fn(init, nums[0]), val = fn(val, nums[1]), val = fn(val, nums[2]), ... 
 * until every element in the array has been processed. The ultimate value of val is then returned.
 * 
 * If the length of the array is 0, the function should return init.
 * 
 * Please solve it without using the built-in Array.reduce method. 
 */



function reduce(arr, fn, init){
	let returnValue = init;
	for(let i = 0; i < arr.length; i ++){
		returnValue = fn(returnValue, arr[i]);
	
	}
	return returnValue;
};

// TEST CODE
var nums = [1,2,3,4, 101]
var fn = function sum(accum, curr) { return accum + curr; }
const init = 0
console.log(reduce(nums, fn, init))