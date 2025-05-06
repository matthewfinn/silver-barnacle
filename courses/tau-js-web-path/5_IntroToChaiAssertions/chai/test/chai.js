import { expect, assert } from 'chai';
import 'chai/register-should.js';


// expect API examples
let a=1, b=1;
expect(a).to.be.equals(b, "a and b are not equal");

// testing a failure
let c=2, d=3;
//expect(c).to.be.equals(d, "c and d are not equal"); //expected failure

//object/string/boolean
function myObj(){
    return{
        a: 100,
        b: 'Hello'
    }
}

let x = new myObj(), y= new myObj();
expect(x).to.be.an('object');
//expect(x).to.be.equals(y, 'x and y are not equal'); // this fails
//This means that when we use equal or equals it is not looking at the content of the object.

//To compare object contents, we should use something called deep.equal, or deep.equals.
expect(x).to.be.deep.equals(y, 'x and y are not equal');
expect(x).to.be.an('object').and.to.be.deep.equals(y);
x.should.be.deep.equals(y, 'x and y are not equal');
(x).should.be.an('object').and.to.be.deep.equals(y);

//assert
assert.deepEqual(x,y, 'x and y are not equal');

//arrays
let numbers = [1,2,3,0];
expect(numbers).to.be.an('array').that.includes(3);
(numbers).should.be.an('array').that.includes(3);
assert.isArray(numbers, 'numbers is not an array');

