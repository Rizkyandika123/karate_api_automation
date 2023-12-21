function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    username: 'test123',
    password: 'test123',
    baseURL: 'https://reqres.in'
  }
  if (env == 'dev') {
    config.baseURL = 'https://reqres.in/dev'
  } else if (env == 'stg') {
    config.baseURL = 'https://reqres.in/stg'
  }

  karate.configure('connectionTimeout', 30000)
  karate.configure('readTimeout', 30000)


  return config;
}