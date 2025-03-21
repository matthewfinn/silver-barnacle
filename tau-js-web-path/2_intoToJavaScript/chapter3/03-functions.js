function sum(a, b) {
    return a+b;
}
console.log("sum(10, 10): " + sum(10, 10)); // 20

function product(a, b) {
    return a*b;
}
console.log("product(12, 12): " + product(12, 12)); //144

const bigProduct = product(964, 57354);

console.log("bigProduct: " + bigProduct);

// anonymous function is the first param
setTimeout(function () {
    console.log("Anonymous function");
}, 1000);

// arrow function
setTimeout(() => {
    console.log("Arrow function");
}, 2000);

// shorted version can be used if a one-liner
setTimeout(() =>console.log("Arrow function one-liner") , 3000);

