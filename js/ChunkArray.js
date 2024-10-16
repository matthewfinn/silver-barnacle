/* Given an array arr and a chunk size size, return a chunked array.
A chunked array contains the original elements in arr, but consists of subarrays each of length size. 
The length of the last subarray may be less than size if arr.length is not evenly divisible by size.
You may assume the array is the output of JSON.parse. In other words, it is valid JSON.
Please solve it without using lodash's _.chunk function. */

/**
 * @param {Array} arr
 * @param {number} size
 * @return {Array}
 */
var chunk = function(arr, size) {
    // if we've an empty array just return that so we avoid taking up memory and declaring unnecessary things
    if(arr.length == 0) return arr;

    // the array length isn't zero so we'll at least be returning something 
    var chunkedArray  = [];

    // if the chunks are larger than the array length just push the original array to the one we're returning
    if(size >= arr.length){
        chunkedArray.push(arr)
        return chunkedArray;
    }

    
    let idx = 0; 
    while (idx < arr.length) {
        
        // push a slice of the original array with the given size to the new array of arrays... 
        // Array.slice will add any available values if the 2nd index is out of bounds it seems
        // from the docs "If end >= array.length or end is omitted, array.length is used, causing all elements until the end to be extracted."
        // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice

        chunkedArray.push(arr.slice(idx, idx + size)); 
        
        idx += size // move the index on by the size of the required chunk
        
    }
    return chunkedArray;
};

var size, arr;
arr = [8,5,3,2,6], size = 3

console.log(chunk(arr, size))