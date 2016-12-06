/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'senior-project',
    podModulePrefix: 'senior-project/pods',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    firebase: {
      apiKey: process.env.apiKey,
      authDomain: process.env.authDomain,
      databaseURL: process.env.databaseURL,
      storageBucket: process.env.storageBucket,
      messagingSenderId: process.env.messagingSenderId
    },
    torii: {
      sessionServiceName: 'session'
    },
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    }
  };

  if (environment === 'development') {

  }

  if (environment === 'test') {

  }

  if (environment === 'production') {

  }

  return ENV;
};
