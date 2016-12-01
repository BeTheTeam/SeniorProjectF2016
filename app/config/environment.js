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
    //ENV.APP.LOG_RESOLVER = true;
    //ENV.APP.LOG_ACTIVE_GENERATION = true;
    //ENV.APP.LOG_TRANSITIONS = true;
    //ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    //ENV.APP.LOG_VIEW_LOOKUPS = true;
    //ENV.firebase.apiKey = process.env.BTT_TEST_FB_APIKEY;
    //ENV.firebase.authDomain = process.env.BTT_TEST_FB_AUTHDOMAIN;
    //ENV.firebase.databaseURL = process.env.BTT_TEST_FB_DATABASEURL;
    //ENV.firebase.storageBucket = process.env.BTT_TEST_FB_STORAGEBUCKET;
    //ENV.firebase.messagingSenderId = process.env.BTT_TEST_FB_MESSAGINGSENDERID;
    ENV.torii = {
      sessionServiceName: 'session'
    };
  }

  if (environment === 'test') {

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';

    ENV.firebase.apiKey = process.env.BTT_TEST_FB_APIKEY;
    ENV.firebase.authDomain = process.env.BTT_TEST_FB_AUTHDOMAIN;
    ENV.firebase.databaseURL = process.env.BTT_TEST_FB_DATABASEURL;
    ENV.firebase.storageBucket = process.env.BTT_TEST_FB_STORAGEBUCKET;
    ENV.firebase.messagingSenderId = process.env.BTT_TEST_FB_MESSAGINGSENDERID;

    ENV.testing = {
      user: "test@bethe.team",
      password: "password"
    };
  }

  if (environment === 'production') {

  }

  return ENV;
};
