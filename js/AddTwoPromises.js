/**
 * Given two promises promise1 and promise2, return a new promise. 
 * promise1 and promise2 will both resolve with a number. The returned promise should resolve with the sum of the two numbers.
 */


/**
 * @param {Promise} promise1
 * @param {Promise} promise2
 * @return {Promise}
 */
var addTwoPromises = async function(promise1, promise2) {
    var [c1, c2] = await Promise.all([promise1, promise2]);
    return c1 + c2;
};


// TEST CODE
 addTwoPromises(Promise.resolve(9), Promise.resolve(16))
   .then(console.log); // 4
