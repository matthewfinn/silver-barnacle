# Chapter 3 - Objects & Classes
## Chapter 3.1 - Objects

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