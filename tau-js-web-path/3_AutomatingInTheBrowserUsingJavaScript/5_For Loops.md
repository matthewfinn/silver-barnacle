# Chapter 5 - For Loops

````javascript
const toggles = document.querySelectorAll('.toggle');

for(togglepos=0; togglepos<toggles.length; togglepos++){
    toggles[togglepos].click();
}
````


A loop to do it multiple times for some test data
```javascript
for(let i = 1; i <= 20; i++){
    document.querySelector("input.new-todo").value="Chapter5 - "+i;
    document.querySelector("input.new-todo").dispatchEvent(new Event('change', {'bubbles': true}));
}
```

A nicer loop to edit each of them
````javascript
const labels = document.querySelectorAll('ul.todo-list li label');
let editText = null;

for(elempos = 0; elempos < labels.length; elempos++){

    let stringValue = labels[elempos].textContent
    labels[elempos].dispatchEvent(new Event('dblclick', {'bubbles': true}));

    editText = document.querySelector(".edit")

    // set the new value to be the old value + "amended"
    editText.value= stringValue + " - amended";

    // display the 'blur' event
    editText.dispatchEvent(new Event('blur', {'bubbles': true}));
}
````

