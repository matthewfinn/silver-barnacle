var randomBot = setInterval(function(){

var theFunctions = [];

// push to functions array
for (var prop in rando) {
    if (typeof rando[prop] == 'function') {
        theFunctions.push(prop);
    }
}

// get a random index
randomFnIdx = Math.floor(Math.random() * theFunctions.length);

// call the function in rando with the index/key of the function name
rando[theFunctions[randomFnIdx]]();
}, 1000);

//clearInterval(randomBot);