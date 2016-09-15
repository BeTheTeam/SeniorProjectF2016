"use strict";

/* jshint ignore:start */



/* jshint ignore:end */

define('senior-project/app', ['exports', 'ember', 'senior-project/resolver', 'ember-load-initializers', 'senior-project/config/environment'], function (exports, _ember, _seniorProjectResolver, _emberLoadInitializers, _seniorProjectConfigEnvironment) {

  var App = undefined;

  _ember['default'].MODEL_FACTORY_INJECTIONS = true;

  App = _ember['default'].Application.extend({
    modulePrefix: _seniorProjectConfigEnvironment['default'].modulePrefix,
    podModulePrefix: _seniorProjectConfigEnvironment['default'].podModulePrefix,
    Resolver: _seniorProjectResolver['default']
  });

  (0, _emberLoadInitializers['default'])(App, _seniorProjectConfigEnvironment['default'].modulePrefix);

  exports['default'] = App;
});
define('senior-project/blueprints/page-object-component', ['exports', 'ember-cli-page-object/blueprints/page-object-component'], function (exports, _emberCliPageObjectBlueprintsPageObjectComponent) {
  Object.defineProperty(exports, 'default', {
    enumerable: true,
    get: function get() {
      return _emberCliPageObjectBlueprintsPageObjectComponent['default'];
    }
  });
});
define('senior-project/blueprints/page-object-helper', ['exports', 'ember-cli-page-object/blueprints/page-object-helper'], function (exports, _emberCliPageObjectBlueprintsPageObjectHelper) {
  Object.defineProperty(exports, 'default', {
    enumerable: true,
    get: function get() {
      return _emberCliPageObjectBlueprintsPageObjectHelper['default'];
    }
  });
});
define('senior-project/blueprints/page-object', ['exports', 'ember-cli-page-object/blueprints/page-object'], function (exports, _emberCliPageObjectBlueprintsPageObject) {
  Object.defineProperty(exports, 'default', {
    enumerable: true,
    get: function get() {
      return _emberCliPageObjectBlueprintsPageObject['default'];
    }
  });
});
define('senior-project/components/app-version', ['exports', 'ember-cli-app-version/components/app-version', 'senior-project/config/environment'], function (exports, _emberCliAppVersionComponentsAppVersion, _seniorProjectConfigEnvironment) {

  var name = _seniorProjectConfigEnvironment['default'].APP.name;
  var version = _seniorProjectConfigEnvironment['default'].APP.version;

  exports['default'] = _emberCliAppVersionComponentsAppVersion['default'].extend({
    version: version,
    name: name
  });
});
define('senior-project/helpers/pluralize', ['exports', 'ember-inflector/lib/helpers/pluralize'], function (exports, _emberInflectorLibHelpersPluralize) {
  exports['default'] = _emberInflectorLibHelpersPluralize['default'];
});
define('senior-project/helpers/singularize', ['exports', 'ember-inflector/lib/helpers/singularize'], function (exports, _emberInflectorLibHelpersSingularize) {
  exports['default'] = _emberInflectorLibHelpersSingularize['default'];
});
define('senior-project/initializers/app-version', ['exports', 'ember-cli-app-version/initializer-factory', 'senior-project/config/environment'], function (exports, _emberCliAppVersionInitializerFactory, _seniorProjectConfigEnvironment) {
  exports['default'] = {
    name: 'App Version',
    initialize: (0, _emberCliAppVersionInitializerFactory['default'])(_seniorProjectConfigEnvironment['default'].APP.name, _seniorProjectConfigEnvironment['default'].APP.version)
  };
});
define('senior-project/initializers/container-debug-adapter', ['exports', 'ember-resolver/container-debug-adapter'], function (exports, _emberResolverContainerDebugAdapter) {
  exports['default'] = {
    name: 'container-debug-adapter',

    initialize: function initialize() {
      var app = arguments[1] || arguments[0];

      app.register('container-debug-adapter:main', _emberResolverContainerDebugAdapter['default']);
      app.inject('container-debug-adapter:main', 'namespace', 'application:main');
    }
  };
});
define('senior-project/initializers/data-adapter', ['exports', 'ember'], function (exports, _ember) {

  /*
    This initializer is here to keep backwards compatibility with code depending
    on the `data-adapter` initializer (before Ember Data was an addon).
  
    Should be removed for Ember Data 3.x
  */

  exports['default'] = {
    name: 'data-adapter',
    before: 'store',
    initialize: _ember['default'].K
  };
});
define('senior-project/initializers/ember-data', ['exports', 'ember-data/setup-container', 'ember-data/-private/core'], function (exports, _emberDataSetupContainer, _emberDataPrivateCore) {

  /*
  
    This code initializes Ember-Data onto an Ember application.
  
    If an Ember.js developer defines a subclass of DS.Store on their application,
    as `App.StoreService` (or via a module system that resolves to `service:store`)
    this code will automatically instantiate it and make it available on the
    router.
  
    Additionally, after an application's controllers have been injected, they will
    each have the store made available to them.
  
    For example, imagine an Ember.js application with the following classes:
  
    App.StoreService = DS.Store.extend({
      adapter: 'custom'
    });
  
    App.PostsController = Ember.ArrayController.extend({
      // ...
    });
  
    When the application is initialized, `App.ApplicationStore` will automatically be
    instantiated, and the instance of `App.PostsController` will have its `store`
    property set to that instance.
  
    Note that this code will only be run if the `ember-application` package is
    loaded. If Ember Data is being used in an environment other than a
    typical application (e.g., node.js where only `ember-runtime` is available),
    this code will be ignored.
  */

  exports['default'] = {
    name: 'ember-data',
    initialize: _emberDataSetupContainer['default']
  };
});
define('senior-project/initializers/export-application-global', ['exports', 'ember', 'senior-project/config/environment'], function (exports, _ember, _seniorProjectConfigEnvironment) {
  exports.initialize = initialize;

  function initialize() {
    var application = arguments[1] || arguments[0];
    if (_seniorProjectConfigEnvironment['default'].exportApplicationGlobal !== false) {
      var value = _seniorProjectConfigEnvironment['default'].exportApplicationGlobal;
      var globalName;

      if (typeof value === 'string') {
        globalName = value;
      } else {
        globalName = _ember['default'].String.classify(_seniorProjectConfigEnvironment['default'].modulePrefix);
      }

      if (!window[globalName]) {
        window[globalName] = application;

        application.reopen({
          willDestroy: function willDestroy() {
            this._super.apply(this, arguments);
            delete window[globalName];
          }
        });
      }
    }
  }

  exports['default'] = {
    name: 'export-application-global',

    initialize: initialize
  };
});
define('senior-project/initializers/injectStore', ['exports', 'ember'], function (exports, _ember) {

  /*
    This initializer is here to keep backwards compatibility with code depending
    on the `injectStore` initializer (before Ember Data was an addon).
  
    Should be removed for Ember Data 3.x
  */

  exports['default'] = {
    name: 'injectStore',
    before: 'store',
    initialize: _ember['default'].K
  };
});
define('senior-project/initializers/store', ['exports', 'ember'], function (exports, _ember) {

  /*
    This initializer is here to keep backwards compatibility with code depending
    on the `store` initializer (before Ember Data was an addon).
  
    Should be removed for Ember Data 3.x
  */

  exports['default'] = {
    name: 'store',
    after: 'ember-data',
    initialize: _ember['default'].K
  };
});
define('senior-project/initializers/transforms', ['exports', 'ember'], function (exports, _ember) {

  /*
    This initializer is here to keep backwards compatibility with code depending
    on the `transforms` initializer (before Ember Data was an addon).
  
    Should be removed for Ember Data 3.x
  */

  exports['default'] = {
    name: 'transforms',
    before: 'store',
    initialize: _ember['default'].K
  };
});
define("senior-project/instance-initializers/ember-data", ["exports", "ember-data/-private/instance-initializers/initialize-store-service"], function (exports, _emberDataPrivateInstanceInitializersInitializeStoreService) {
  exports["default"] = {
    name: "ember-data",
    initialize: _emberDataPrivateInstanceInitializersInitializeStoreService["default"]
  };
});
define('senior-project/pods/event/controller', ['exports', 'ember'], function (exports, _ember) {
  var EventController;

  EventController = _ember['default'].Controller.extend({
    players: _ember['default'].computed.alias('model'),
    actions: {
      addPlayer: function addPlayer() {
        this.model.pushObject(this.playerName);
        return this.set('playerName', "");
      }
    }
  });

  exports['default'] = EventController;
});
define("senior-project/pods/event/route", ["exports", "ember"], function (exports, _ember) {
  ;
  var EventRoute;

  EventRoute = _ember["default"].Route.extend({
    model: function model() {
      return ["Player 1", "Player 2", "Player 2"];
    }
  });

  exports["default"] = EventRoute;
  ;
});
define("senior-project/pods/event/template", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.5.1",
          "loc": {
            "source": null,
            "start": {
              "line": 1,
              "column": 206
            },
            "end": {
              "line": 1,
              "column": 268
            }
          },
          "moduleName": "senior-project/pods/event/template.hbs"
        },
        isEmpty: false,
        arity: 1,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createElement("p");
          dom.setAttribute(el1, "class", "players");
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var morphs = new Array(1);
          morphs[0] = dom.createMorphAt(dom.childAt(fragment, [0]), 0, 0);
          return morphs;
        },
        statements: [["content", "player", ["loc", [null, [1, 254], [1, 264]]]]],
        locals: ["player"],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "triple-curlies"
        },
        "revision": "Ember@2.5.1",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 1,
            "column": 293
          }
        },
        "moduleName": "senior-project/pods/event/template.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "class", "event-page");
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("button");
        dom.setAttribute(el2, "class", "add-player");
        var el3 = dom.createTextNode("Add a player");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element0 = dom.childAt(fragment, [0]);
        var element1 = dom.childAt(element0, [1]);
        var morphs = new Array(4);
        morphs[0] = dom.createMorphAt(element0, 0, 0);
        morphs[1] = dom.createElementMorph(element1);
        morphs[2] = dom.createMorphAt(element0, 2, 2);
        morphs[3] = dom.createMorphAt(element0, 3, 3);
        return morphs;
      },
      statements: [["inline", "input", [], ["type", "text", "value", ["subexpr", "@mut", [["get", "playerName", ["loc", [null, [1, 50], [1, 60]]]]], [], []], "placeholder", "Enter a player's name", "class", "player-name-input"], ["loc", [null, [1, 24], [1, 124]]]], ["element", "action", ["addPlayer"], ["on", "click"], ["loc", [null, [1, 132], [1, 165]]]], ["block", "each", [["get", "players", ["loc", [null, [1, 214], [1, 221]]]]], [], 0, null, ["loc", [null, [1, 206], [1, 277]]]], ["content", "outlet", ["loc", [null, [1, 277], [1, 287]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
define('senior-project/resolver', ['exports', 'ember-resolver'], function (exports, _emberResolver) {
  exports['default'] = _emberResolver['default'];
});
define('senior-project/router', ['exports', 'ember', 'senior-project/config/environment'], function (exports, _ember, _seniorProjectConfigEnvironment) {
  ;
  ;
  var Router;

  Router = _ember['default'].Router.extend({
    location: _seniorProjectConfigEnvironment['default'].locationType
  });

  Router.map(function () {
    return this.route('event');
  });

  exports['default'] = Router;
  ;
});
define('senior-project/services/ajax', ['exports', 'ember-ajax/services/ajax'], function (exports, _emberAjaxServicesAjax) {
  Object.defineProperty(exports, 'default', {
    enumerable: true,
    get: function get() {
      return _emberAjaxServicesAjax['default'];
    }
  });
});
define("senior-project/templates/application", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    return {
      meta: {
        "fragmentReason": {
          "name": "missing-wrapper",
          "problems": ["multiple-nodes", "wrong-type"]
        },
        "revision": "Ember@2.5.1",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 4,
            "column": 0
          }
        },
        "moduleName": "senior-project/templates/application.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("h2");
        dom.setAttribute(el1, "id", "title");
        var el2 = dom.createTextNode("Welcome to Ember");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var morphs = new Array(1);
        morphs[0] = dom.createMorphAt(fragment, 2, 2, contextualElement);
        return morphs;
      },
      statements: [["content", "outlet", ["loc", [null, [3, 0], [3, 10]]]]],
      locals: [],
      templates: []
    };
  })());
});
/* jshint ignore:start */



/* jshint ignore:end */

/* jshint ignore:start */

define('senior-project/config/environment', ['ember'], function(Ember) {
  var prefix = 'senior-project';
/* jshint ignore:start */

try {
  var metaName = prefix + '/config/environment';
  var rawConfig = Ember['default'].$('meta[name="' + metaName + '"]').attr('content');
  var config = JSON.parse(unescape(rawConfig));

  return { 'default': config };
}
catch(err) {
  throw new Error('Could not read config from meta tag with name "' + metaName + '".');
}

/* jshint ignore:end */

});

/* jshint ignore:end */

/* jshint ignore:start */

if (!runningTests) {
  require("senior-project/app")["default"].create({"name":"senior-project","version":"0.0.0+847fe51a"});
}

/* jshint ignore:end */
//# sourceMappingURL=senior-project.map