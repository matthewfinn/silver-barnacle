let counter = 11;
let greeting = "Hi";
let car = { 
    colour: "green", 
    electric: false 
};

console.log(typeof counter); // number
console.log(typeof greeting); // string
console.log(typeof car); // object
console.log(typeof car.colour); // string
console.log(typeof car.electric); // boolean

console.log(car)
car.colour = "blue"
console.log(car)

const add = (a: number, b: number) => {
    return a + b;
}

console.log(add(1,2)) // 3

type EvenNumber = 2 | 4 | 6 | 8

const addEvenNumbers= (a: EvenNumber, b: EvenNumber) => {
    return a + b;
}

//console.log(addEvenNumbers(1,2)) // compile time error as 1 is not part of the new EvenNumbers type
/**
TSError: ⨯ Unable to compile TypeScript:
src/types.ts:30:28 - error TS2345: Argument of type '1' is not assignable to parameter of type 'EvenNumbers'.
 */

console.log(addEvenNumbers(6,2)) // 8