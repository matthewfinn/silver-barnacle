function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiURL: 'https://conduit-api.bondaracademy.com/api'
  }
  if (env == 'dev') {
    config.userEmail =  "matt.finn@hotmail.com"
    config.userPassword = "D$kpw!px8O^ZgPsq"
  } else if (env == 'qa') {
    config.userEmail =  "test@example.com"
    config.userPassword = "blabla"
  }

  // configure global Authorization header for all tests
  var accessToken = karate.callSingle('classpath:utils/CreateToken.feature', config).authToken;
  karate.configure('headers', {Authorization: accessToken})
  
  return config;
}