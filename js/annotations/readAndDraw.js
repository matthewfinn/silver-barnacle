const cheerio = require("cheerio")
const axios = require("axios")

async function readAndDraw(fileURL) {
  //const url = fileURL;
  axios.get(fileURL)
    .then(response => {
      const html = response.data;
      const $ = cheerio.load(html)
      const rows = [];

      const selector = 'tbody tr' // selector for table on webpage

      // get the elements from the webpage 
      $(selector).each(function (i, e) {
        const row = [];
        rows.push(row);

        $(this).find("th, td").each(function (i, e) {
          row.push($(this).text().trim());
        });
      });

      rows.shift(); // removes first element from the array of arrays... which is the column headers

      const splitIndex = 2; // y - coordinate index

      const yValues = {};

      rows.forEach(row => {
        const key = row[splitIndex];
        if (!yValues[key]) {
          yValues[key] = []; // Init an array if the key doesn't exist
        }
        yValues[key].push(row); // Append the item to the relevant group
      });

      const asplitIndex = 1 // it's the item at index 1 in each group that we would like to print 
      // Print only the 2nd element of each sub-array, grouped by key
      // Step 1: Get the keys of the object
      const keys = Object.keys(yValues);

      // Step 2: Sort the keys in descending order
      keys.sort((a, b) => Number(b) - Number(a));

      console.log("KEYS:" + keys)

      for (const element of keys) {

        //console.log("XVals for " + element +": " + yValues[element])

        var xValues = yValues[element];
        xValues.sort((a, b) => a[0] - b[0]);

        //console.log("isitanarray???? " + (xValues.constructor == Array)); // true

        //console.log("XVals for " + element +": " + xValues)

        let lastValue = null

        yValues[element].forEach(item => {

          const currentValue = item[0]; // x - coordinate

          if (lastValue == null) {
            for (let index = 0; index < currentValue; index++) {
              process.stdout.write('\u0020'); 
            }

          } else {
            if (currentValue === lastValue) {
              //process.stdout.write('\u0020'); 
            } else {
              const spaces = currentValue - lastValue - 1;
              //console.log("GAP between " + currentValue + " and " + lastValue + " is " + spaces); // separation between groups
              if (spaces > 1) {
                for (let index = 0; index < spaces; index++) {
                  process.stdout.write('\u0020');
                }
              }
              //console.log(`Current value (${currentValue}) is different from the last value.`);
            }

          }

          process.stdout.write(item[asplitIndex]); // Print the 2nd element of each sub-array
          lastValue = currentValue; // Update lastValue for the next iteration

        });
        console.log(); // separation between groups of the y axis
      }


    })
    .catch(console.error);



};

//readAndDraw("https://docs.google.com/document/d/e/2PACX-1vRMx5YQlZNa3ra8dYYxmv-QIQ3YJe8tbI3kqcuC7lQiZm-CSEznKfN_HYNSpoXcZIV3Y_O3YoUB1ecq/pub")
readAndDraw("https://docs.google.com/document/d/e/2PACX-1vShuWova56o7XS1S3LwEIzkYJA8pBQENja01DNnVDorDVXbWakDT4NioAScvP1OCX6eeKSqRyzUW_qJ/pub");