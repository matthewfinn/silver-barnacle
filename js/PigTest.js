
var convertToPig = function(text) {

    const arrayOfWords = text.split(" ");
    
    for(let i = 0; i< arrayOfWords.length; i++){
		arrayOfWords[i] = convertWord(arrayOfWords[i]);
	}
    return arrayOfWords;
    
};

var convertWord = function(word){
    let regex = /^[^aeiou]+/
    let consonants = word.match(regex);

    return consonants !== null
    ? word
        .replace(regex, "")
        .concat(consonants)
        .concat("ay")
    : word.concat("way");
    
    
    return word;
}

var checkIfWordBeginsWithConsonant = function(word){


    return true;
}

// TEST CODE
var str1 = "How are you"
var str2 = "Pleased to meet you"
var str3 = "I don't understand"

console.log(convertToPig(str1)); // false
console.log(convertToPig(str2)); // true
console.log(convertToPig(str3)); // false
