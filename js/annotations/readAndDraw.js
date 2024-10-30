const cheerio = require("cheerio")
const axios = require("axios")

async function readAndDraw(fileURL) {
  //const url = fileURL;
  axios.get(fileURL)
    .then(response => {
      const html = response.data;
      const $ = cheerio.load(html)
      const rows = [];

      const selector = 'tbody tr'

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

      // const map = new Map(Object.entries(yValues));
      // const sortedMap = new Map([...map.entries()].sort((a, b) => Number(b[0]) - Number(a[0])));
      // const sortedObj = Object.fromEntries(sortedMap);


      // console.log(sortedObj);
      // console.log(Object.keys(sortedObj)); // Should print: [ '2', '1', '0' ]
      // console.log(sortedMap); // This will display the sorted order clearly



      // Step 1: Get the keys of the object
      const keys = Object.keys(yValues);

      // Step 2: Sort the keys in descending order
      keys.sort((a, b) => Number(b) - Number(a));


      for (let i = keys.length - 1; i >= 0; i--) {
        //console.log(`Group ${key}:`);
        const key = keys[i];
        yValues[key].forEach(item => {
          process.stdout.write(item[asplitIndex]); // Print the 2nd element of each sub-array
        });
        console.log(); // separation between groups
      }


    })
    .catch(console.error);



};

readAndDraw("https://docs.google.com/document/d/e/2PACX-1vRMx5YQlZNa3ra8dYYxmv-QIQ3YJe8tbI3kqcuC7lQiZm-CSEznKfN_HYNSpoXcZIV3Y_O3YoUB1ecq/pub")