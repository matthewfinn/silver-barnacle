/* Given an object or an array, return if it is empty.

An empty object contains no key-value pairs.
An empty array contains no elements.
You may assume the object or array is the output of JSON.parse. */

/**
 * @param {Object|Array} obj
 * @return {boolean}
 */
var isEmpty = function(obj) {

    //check if object but not array? check if 0 length : check if array ? check empty : return false
    return (typeof obj === 'object' && !Array.isArray(obj)) ? 
        Object.keys(obj).length === 0 : Array.isArray(obj) ? 
            obj.length === 0 : false;
    
};

// TEST CODE
var obj1 = {"x": 5, "y": 42}
var obj2 = {}
var obj3 = [null, false, 0]

console.log(isEmpty(obj1)); // false
console.log(isEmpty(obj2)); // true
console.log(isEmpty(obj3)); // false
