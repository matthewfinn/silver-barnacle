# Chapter 9 - SetTimeout

There is a risk that doing this is too quick.
No user is ever going to create 100 items in milliseconds

```javascript
for(let i = 1; i <= 100; i++){
    autoTodo.createTodo("todo " + i);
}
```

Issue here is synchronisation

### SetTimeout

Example below - In 1000ms after call it'll run `console.log("hello")`

```javascript
setTimeout(function(){
    console.log("hello")
}, 1000)
```

This means a 5-second wait before calling the function autoTodo.createTodo with the args "hello again"

````javascript
setTimeout(autoTodo.createTodo, 5000, "hello again")
````

If we were to do the below it would just wait 5 seconds before returning the return value of autoTodo.createTodo (there isn't any)

````javascript
setTimeout(autoTodo.createTodo("hello again"), 5000)
````

Putting it all together (we don't need to wait 5 seconds)

```javascript
for(let i = 1; i <= 100; i++){
    setTimeout(autoTodo.createTodo, i*100, "todo "+ i)
}
```
OR
````javascript
for(x=1;x<=100;x++){
    setTimeout(
        function (name){
            document.querySelector("input.new-todo").value=name;
            document.querySelector("input.new-todo").dispatchEvent(new Event('change', { 'bubbles': true }))
        }
    , x*100,"todo "+x)
}
````
## Quiz
**1. In order to clear the localstorage from the console we use the command:**
   localStorage.clear()

**2. Using a for loop to create test data is:**
   possible for some applications but not the todoMVC application

**3. The `setTimeout` function:**
   runs a function after X milliseconds has passed

**4. The following command waits 1000 milliseconds before running the `createTodo` code: setTimeout(autoTodo.createTodo("make jello"),1000)**
   False

**5. The following command waits 1000 milliseconds before running the `createTodo` code: setTimeout(autoTodo.createTodo, 1000, "make jello")**
   True
