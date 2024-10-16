/**
 * Given an integer array arr and a mapping function fn, return a new array with a transformation applied to each element.
 * The returned array should be created such that returnedArray[i] = fn(arr[i], i).
 * Please solve it without the built-in Array.map method.
 */
 

 /**
 * @param {number[]} arr
 * @param {Function} fn
 * @return {number[]}
 */
function testFn(arr, fn) {

	for(let i = 0; i< arr.length; i++){
		arr[i] = fn(arr[i], i)
	}
    
   return arr;
};

// support functions 
var plusone = function plusOne(n){
	return n + 1;
}

var double = function double(n){
	return n * 2;
}

// TEST CODE
arr = [1,2,3];
console.log(testFn(arr, plusone));

arr = [1,2,3];
console.log(testFn(arr, double));