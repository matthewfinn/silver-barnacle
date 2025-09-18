function fn() {
  var config = {};
  // Base URL for all API calls
  config.baseUrl = 'https://jsonplaceholder.typicode.com/';

  // Example of environment handling
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev'; // default
  }
  config.env = env;

  if (env === 'dev') {
    config.baseUrl = 'https://jsonplaceholder.typicode.com';
  } else if (env === 'qa') {
    config.baseUrl = 'https://qa.example.com';
  }

    karate.log('[Base URL]', config.baseUrl);


  return config;
}
