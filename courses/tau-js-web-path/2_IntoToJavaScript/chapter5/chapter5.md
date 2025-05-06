# Chapter 5 If Else & Conditionals

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


|**Value**|**To Boolean (Boolean(value))**|
|-----------|-----------------------|
|0, "", null, undefined, NaN, false|false|
|Any other value (e.g., "hello", 1, true, {})|true|


|**Operation**|**Coerced** Type|
|-----------|----------------------|
|"5" - 2|5 - 2 → 3 (string → number)|
|"5" + 2|"5" + "2" → "52" (number → string)|
|true + 1|	1 + 1 → 2 (boolean → number)|
