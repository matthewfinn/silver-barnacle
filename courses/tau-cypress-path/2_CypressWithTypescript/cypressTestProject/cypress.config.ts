const { defineConfig } = require("cypress");
const path = require('path');

module.exports = defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      // This makes @fixtures workac
      config.env = {
        ...config.env,
        alias: {
          '@fixtures': path.resolve(__dirname, 'cypress/fixtures'),
          '@typings': path.resolve(__dirname, '../../TrelloTestApplication/src/typings'),
        },
      };
      return config;
    },
    baseUrl: 'http://localhost:3000',

  },
});
