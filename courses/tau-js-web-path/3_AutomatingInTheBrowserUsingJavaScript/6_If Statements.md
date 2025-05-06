# Chapter 6 - If Statements

````javascript
var toggles = document.querySelectorAll('.toggle');
for(togglepos=0;togglepos<toggles.length;togglepos++){
	if(togglepos%2==0){
		toggles[togglepos].click();
	}
}
````