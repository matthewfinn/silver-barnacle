# Chapter 1 - Variable & Data Types

## Chapter 1.1 - Variables

Declarations

```javascript
 let "create a variable and reassign the value"
 const "can't reassign value"
 var "legacy"
```
| Feature               | `var`                                                         | `let`                                                                   | `const`                                                                 |
|-----------------------|---------------------------------------------------------------|-------------------------------------------------------------------------|-------------------------------------------------------------------------|
| Scope                 | **Function-scoped** – visible throughout the function it's in | **Block-scoped** – only visible inside the `{ }` block it's declared in | **Block-scoped** – only visible inside the `{ }` block it's declared in |
| Hoisted?              | ✅ Yes – moved to top and initialized as `undefined`           | ✅ Yes – moved to top but not initialized (in **TDZ**)                   | ✅ Yes – moved to top but not initialized (in **TDZ**)                   |
| Initialized on Hoist? | ✅ Yes (`undefined`)                                           | ❌ No – accessing before declaration causes **ReferenceError**           | ❌ No – accessing before declaration causes **ReferenceError**           |
| Can be Redeclared     | ✅ Yes                                                         | ❌ No                                                                    | ❌ No                                                                    |
| Can be Reassigned     | ✅ Yes                                                         | ✅ Yes                                                                   | ❌ No – but object/array contents can still be changed                   |
| Must Be Initialized?  | ❌ No                                                          | ❌ No                                                                    | ✅ Yes                                                                   |
| Typical Use Case      | Old/legacy code, rarely recommended now                       | Variables that will change (e.g. in loops or conditions)                | Constants or values that won’t be reassigned                            |


## Chapter 1.2 - JavaScript Data Types

### Strings

Strings are letters, numbers, emojis, and any type of character you see on the keyboard.

### Numbers

Numbers can be positive, negative whole numbers, or even be numbers with decimals.

### Booleans

Boolean - the boolean type is strictly true or false. That's it.

### Undefined vs. null

Undefined - Default value that gets assigned to a variable when you create it.

i.e.

```javascript
 let name;
```

Null - undefined usually means that there is no value. Null usually means that we are clearing out the value.
Just set values that you want to clear out to null and think about undefined being the default value when youcreate a variable but don't assign an initial value to it.

```javascript
name = null;
```
# Chapter 2 - Arrays
## Chapter 2.1 Arrays
Arrays are a data structure.

A data structure is a way to organize your data to best serve you.

Now, arrays for us are going to be a way to store multiple values in the same variable. And we grouped them all together.

## Chapter 2.2 Using Arrays
### Adding values to an Array
#### Assignment
When you create the array like we've done on line 10, and you can tell this is creation because we're using the equal sign and then square brackets: [], I can add another element right here.
Butter cookies are not the best in my top three, but they are okay when you're in a pinch. Let's look at this in the console.
```javascript
const favoriteCookies = [
            "chocolate chip", //0
            "iced oatmeal", //1
            "sugar cookie", //2
            "butter cookie"
        ];      
```
#### Push
```javascript
const favoriteCookies = [
            "chocolate chip", //0
            "iced oatmeal", //1
            "sugar cookie", //2
            "butter cookie"
        ];      
        favoriteCookies.push("windmill cookies");
        console.log(favoriteCookies);
```
### Removing Items from an Array
#### Pop
To remove items, what you do is use the pop command.
pop is going to remove the last element in the array.

```javascript
const favoriteCookies = [
            "chocolate chip", //0
            "iced oatmeal", //1
            "sugar cookie", //2
            "butter cookie"
        ];      
        favoriteCookies.push("windmill cookies");
        let removedItem = favoriteCookies.pop();
        console.log(removedItem)
        console.log(favoriteCookies);
```
### Accessing an individual item in an array
We have to use the square bracket notation: [].
```javascript
console.log(favoriteCookies[0]);
```

If you try to access an item that's out of bounds of the array index you get undefined

You can also put a variable fav here and set it to an index value. It's going to replace the fav with the actual value.

```javascript
let fav = 3;
console.log(favoriteCookies[fav]);
console.log(favoriteCookies.length);
console.log(favoriteCookies[favoriteCookies.length-1]);
```

# Chapter 3 - Functions
## Chapter 3.1 - Functions
Functions have a few goals:
* Help you organize your code for readability.
* Allow you to take blocks of code and make them easily repeatable.

All functions return something. If it does not explicitly return something, it must return undefined.

## Chapter 3.2 - Anonymous functions & Arrow functions
### Anonymous Functions
These are functions that have the same rules - they need an input, output and logic, **but the major difference here is that we don't give these functions a name**, hence anonymous.
You'll see this most commonly when you need to pass a function as a callback.

### Callbacks
In JavaScript, callbacks are functions that can be used as inputs to another function.

Sometimes you'll want to assign some behavior or logic to happen after an event occurs.
A great example of this is the setTimeout function.
setTimeout() takes two inputs, a function, and a time in milliseconds.
The function is the behavior that should happen, and the time in milliseconds is how long we should wait for that behavior to happen.

### Arrow functions
Arrow functions are just like standard functions, except for there's a bit of syntactic difference.


# Chapter 4 - Objects & Classes
## Chapter 4.1 - Objects

### Objects
Objects are a special data type in JavaScript.
They allow us to describe things with a lot of detail - the details are what we will call properties.
The properties allow us to describe our objects.

### Classes
Classes are a template for creating objects. They encapsulate data with code to work on that data.
Classes in JS are built on prototypes but also have some syntax and semantics that are unique to classes.
```javascript
// Declaration
class Rectangle {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
}

// Expression; the class is anonymous but assigned to a variable
const Rectangle = class {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
};

// Expression; the class has its own name
const Rectangle = class Rectangle2 {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
};
```
# Chapter 5 - If Else & Conditionals

## Equals

= is the assignment operator. It is used to assign a value to a variable.

```javascript
let x = 5;  // Assigns the value 5 to variable x
let y = "hello"; // Assigns the string "hello" to y
```

== (double equals) is the loose equality operator. It compares values but performs type coercion if the types don't match.

```javascript
console.log(5 == "5"); // true (string "5" is converted to number)
console.log(null == undefined); // true

```

=== (triple equals) is the strict equality operator. It compares both value and type, meaning no type conversion happens.

```javascript
console.log(5 === "5"); // false (different types: number vs. string)
console.log(null === undefined); // false

```

### When to Use?

Prefer === to avoid unintended type conversions.
Use == only when you specifically want JavaScript to perform type coercion (which is rare).

### Type coercion

#### Implicit Coercion (Automatic Conversion)

JavaScript automatically converts a value to a different type.
Common in operations like comparisons (==), arithmetic, and string concatenation.

```javascript
console.log("5" - 2);  // 3  (string "5" is coerced to number)
console.log("5" + 2);  // "52"  (number 2 is coerced to string)
console.log(true + 1); // 2  (true is coerced to 1)
```

#### Explicit Coercion (Manual Conversion)

```javascript
console.log(Number("123")); // 123
console.log(String(100));   // "100"
console.log(Boolean(0));    // false

```

#### Common Coercion Cases


| **Value**                                    | **To Boolean (Boolean(value))** |
|----------------------------------------------|---------------------------------|
| 0, "", null, undefined, NaN, false           | false                           |
| Any other value (e.g., "hello", 1, true, {}) | true                            |


| **Operation** | **Coerced** Type                   |
|---------------|------------------------------------|
| "5" - 2       | 5 - 2 → 3 (string → number)        |
| "5" + 2       | "5" + "2" → "52" (number → string) |
| true + 1      | 	1 + 1 → 2 (boolean → number)      |

# Chapter 6 - Loops
Loops allow us to repeat code over and over again.

