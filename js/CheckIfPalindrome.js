function isPalindrome(str) {
    // Remove non-alphanumeric characters and convert to lowercase
    /*
        /[^a-z0-9]/gi means:
        Match any character that is not (^) a letter (a-z) or digit (0-9),
        Do it case-insensitively (i),
        And apply it to all matches in the string (g).

        Simple example:
        console.log("A man, a plan!".replace(/[^a-z0-9]/gi, ''));
        // Output: "Amanaplan"
    */
    const cleanedStr = str.replace(/[^a-z0-9]/gi, '').toLowerCase();

    // Reverse the cleaned string
    const reversedStr = cleanedStr.split('').reverse().join('');

    // Check if the cleaned string is equal to its reversed version
    return cleanedStr === reversedStr;
}

// Example usage:
console.log(isPalindrome("A man, a plan, a canal, Panama"));  // true
console.log(isPalindrome("Hello, World!"));  // false