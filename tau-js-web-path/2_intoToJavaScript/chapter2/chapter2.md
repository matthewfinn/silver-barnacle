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
