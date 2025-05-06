const myCar = {
    name: "Toyota Corolla",
    engineSize: 1.3,
    "engine code": "4EFE",
    printDetails: function() {
        console.log("I am a " + this.name + " with a " + this.engineSize + " litre engine");
    }
}; // object literal

//https://javascript.plainenglish.io/can-javascript-object-keys-have-spaces-ed389758e5c3
console.log(myCar);
console.log("name: "+ myCar.name);
console.log("engineSize: " + myCar.engineSize);
console.log("engine code: " + myCar["engine code"]);

myCar.name = "Toyota Corolla AE100";
myCar["engine code"] = "5EFE";
myCar.engineSize = 1.5

console.log(myCar);
console.log("name: "+ myCar.name);
console.log("engineSize: " + myCar.engineSize);
console.log("engine code: " + myCar["engine code"]);
myCar.printDetails();



class Car {
    constructor(name, engineSize) {
        this.name = name;
        this.engineSize = engineSize;
    }

    printDetails() {
        console.log("I am a " + this.name + " with a " + this.engineSize + " litre engine");
    }
}

let myNewCar = new Car("Volvo V70", 2.4);
console.log(myNewCar);
console.log(myNewCar.printDetails())