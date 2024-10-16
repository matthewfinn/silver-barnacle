/**
 * Given a positive integer millis, write an asynchronous function that sleeps for millis milliseconds. It can resolve any value.
 */


/**
 * @param {number} millis
 * @return {Promise}
 */
async function sleep(millis) {
    await new Promise(res => setTimeout(res, millis))
}

/** TEST CODE
 * let t = Date.now()
 * sleep(100).then(() => console.log(Date.now() - t)) // 100
 */

/* EXPLANATION:
The sleep function takes a positive integer millis as input.
It then creates a Promise that resolves after millis milliseconds using the setTimeout function.
The Promise is then awaited using the await keyword, which allows the function to pause execution until the Promise is resolved. */