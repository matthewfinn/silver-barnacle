# Chapter 10 - SetInterval

setInterval runs a block of code, or a function, every “x” milliseconds.

* `setTimeout` says, "I will run this block of code in this number of time, and I'll do it once."
* `setInterval` keeps going. Every 500 milliseconds, if that's what we set it to, it keeps running the same block of code.

````javascript
var sayHello = setInterval(function(){console.log("hello")},1000);
````
So, every second it will write to the console, "hello."

Now, if I went to stop it, I could refresh the page, or I can use the clearInterval command and I just say, clearInterval(sayHello).

````javascript
let botTodoCount = 0;
let creatorBot = setInterval(function(){
        document.querySelector('input.new-todo').value="todoSetInterval " +botTodoCount;
        document.querySelector('input.new-todo').dispatchEvent(new Event('change',{'bubbles':true}));

        botTodoCount++;

        if(botTodoCount>=100){
            clearInterval(creatorBot);
        }
    }, 500);
````

Parameterised version that creates number of todos as a parameter
````javascript
function startTodoCreator(maxCount) {
    let botTodoCount = 0;
    let creatorBot = setInterval(function() {
        document.querySelector('input.new-todo').value = "todoSetIntervalParam " + botTodoCount;
        document.querySelector('input.new-todo').dispatchEvent(new Event('change', { 'bubbles': true }));

        botTodoCount++;

        if (botTodoCount >= maxCount) {
            clearInterval(creatorBot);
        }
    }, 500);
}

// Call the function with a desired max count
startTodoCreator(50);
````

## Quiz
**1. If we create a `setInterval` and do not assign it to a variable we can stop it by:**
   refreshing the browser page

**2. If we create a setInterval and assign it to a variable we can stop it using the command: var sayHello = setInterval(function(){console.log("hello")},1000);**
   clearInterval(sayHello)
  
**3. When we use `setInterval` we need to wrap it in a for loop:**
   false because setInterval runs every X milliseconds

**4. A `setInterval` will run:**
   forever, until page is refreshed or it is cleared
