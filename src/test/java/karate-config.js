function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'stagging';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    username: 'admin1',
    password: 'welcome',
    _url: "https://reqres.in"
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
    //To reset the value of variable based on the value of system property using below syntax
    // During run time we need to specify the value of system property in JVM argument
    config.username = 'author'
    config.password = 'authorpass'
  } else if (env == 'e2e') {
    // customize
     config.username = 'Diksha'
    config.password = 'authorpassdiksh'
  }
 
  else if (env == 'staging') {
    // Initilize the config for staging
    config.username: 'admin1',
    config.password: 'welcome',
    config._url: "https://staging.reqres.in"
  }
  else if (env == 'pre-prod') {
   // Initilize the config for pre-prod
   config.username: 'admin1',
    config.password: 'welcome',
    config._url: "https://preprod.reqres.in"
  }
   else if (env == 'prod') {
    //Initilize the config for prod
    config.username: 'admin1',
    config.password: 'welcome',
    config._url: "https://prod.reqres.in"
  }
  return config;
}