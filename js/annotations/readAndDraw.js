const axios = require("axios")
const cheerio = require("cheerio")

async function readAndDraw(fileURL) {
  const xCoordinateIndex = 0; // x - coordinate index
  const unicodeCharacterIndex = 1 // it's the item at index 1 in each group that we would like to print 
  const yCoordinateIndex = 2; // y - coordinate index

  axios.get(fileURL) // gets the response from loading the webpage
    .then(response => {
      const html = response.data; // assign the webpage html to a constant
      const $ = cheerio.load(html) // load html into the $ constant
      const rows = []; // empty array to store each row of the table
      const yValues = []; //empty array to story mapped Y axis values
      const selector = 'tbody tr' // selector for table on webpage

      // get the table elements from the webpage 
      $(selector).each(function (i, e) {
        const row = []; // empty array
        $(this).find("th, td").each(function (i, e) {
          row.push($(this).text().trim());
        });
        rows.push(row); // push the content to the array of rows
      });

      rows.shift(); // removes first element from the array of arrays... which is the column headers

      // create a map of Y axis value keys and they're associated objects
      rows.forEach(row => {
        const key = row[yCoordinateIndex];
        if (!yValues[key]) {
          yValues[key] = []; // Init an array if the key doesn't exist
        }
        yValues[key].push(row); // Append the item to the relevant group
      });


      // Get the keys of the object
      const keys = Object.keys(yValues);

      // Sort the keys in descending order as the Y axis printing should start with the largest value and iterate in descedning order
      keys.sort((a, b) => Number(b) - Number(a));

      // loop through each set of keys
      for (const element of keys) {

        var xValues = yValues[element]; // get the objects for the Y value key in this iteration
        xValues.sort((a, b) => a[0] - b[0]); // sort the objects by x co-ordinate value in ascending order

        // declaration of var used to compare previous and current value
        let lastValue = null
        xValues.forEach(item => {

          const currentValue = item[xCoordinateIndex]; // x - coordinate

          if (lastValue !== null) {
            if (currentValue !== lastValue) {
              // check how many spaces between the current and last X co-ordinates, taking 1 away as 1 space is implied and doesn't require a printed space
              const spaces = currentValue - lastValue - 1;
              // print the unicode space character for each space
              for (let index = 0; index < spaces; index++) {
                process.stdout.write('\u0020');
              }
            } 
          }

          process.stdout.write(item[unicodeCharacterIndex]); // Print the 2nd element of each sub-array which is the unicode character
          lastValue = currentValue; // Update lastValue for the next iteration so we can compare

        });
        console.log(); // line separation between groups of the y axis
      }


    })
    .catch(console.error); // some error handling to diagnose anything going wrong

};

//readAndDraw("https://docs.google.com/document/d/e/2PACX-1vRMx5YQlZNa3ra8dYYxmv-QIQ3YJe8tbI3kqcuC7lQiZm-CSEznKfN_HYNSpoXcZIV3Y_O3YoUB1ecq/pub")
readAndDraw("https://docs.google.com/document/d/e/2PACX-1vShuWova56o7XS1S3LwEIzkYJA8pBQENja01DNnVDorDVXbWakDT4NioAScvP1OCX6eeKSqRyzUW_qJ/pub");