const { defineConfig } = require("cypress");
const path = require('path');

module.exports = defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      // This makes @fixtures work
      config.env = {
        ...config.env,
        alias: {
          '@fixtures': path.resolve(__dirname, 'cypress/fixtures'),
        },
      };
      return config;
    },
    baseUrl: 'http://localhost:3000',

  },
});
