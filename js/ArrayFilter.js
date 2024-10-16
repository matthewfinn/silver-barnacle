/**
 * Given an integer array arr and a filtering function fn, return a filtered array filteredArr.
 * The fn function takes one or two arguments:
 * 	1. arr[i] - number from the arr
 *  2. i - index of arr[i]
 * 
 * filteredArr should only contain the elements from the arr for which the expression fn(arr[i], i) evaluates to a truthy value. A truthy value is a value where Boolean(value) returns true.
 * 
 * Please solve it without the built-in Array.filter method.
 */ 



var filter = function(arr, fn) {
    let returnArray = [];

    for(let i = 0; i < arr.length; i++){
        if(fn(arr[i],i)){
            returnArray.push(arr[i]);
        }
    }
    return returnArray
};



// TEST CODE
function greaterThan10(n) { return n > 4; }
function firstIndex(n, i) { return i === 0; }

var arr = [1,2,3,4,5,22,33];
console.log(filter(arr, greaterThan10));
console.log(filter(arr, firstIndex));
