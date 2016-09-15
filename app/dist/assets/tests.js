define('senior-project/tests/app.jshint', ['exports'], function (exports) {
  'use strict';

  describe('JSHint | app.js', function () {
    it('should pass jshint', function () {
      if (!true) {
        var error = new chai.AssertionError('app.js should pass jshint.');
        error.stack = undefined;throw error;
      }
    });
  });
});
define('senior-project/tests/helpers/destroy-app', ['exports', 'ember'], function (exports, _ember) {
  exports['default'] = destroyApp;

  function destroyApp(application) {
    _ember['default'].run(application, 'destroy');
  }
});
define('senior-project/tests/helpers/destroy-app.jshint', ['exports'], function (exports) {
  'use strict';

  describe('JSHint | helpers/destroy-app.js', function () {
    it('should pass jshint', function () {
      if (!true) {
        var error = new chai.AssertionError('helpers/destroy-app.js should pass jshint.');
        error.stack = undefined;throw error;
      }
    });
  });
});
define('senior-project/tests/helpers/module-for-acceptance', ['exports', 'qunit', 'senior-project/tests/helpers/start-app', 'senior-project/tests/helpers/destroy-app'], function (exports, _qunit, _seniorProjectTestsHelpersStartApp, _seniorProjectTestsHelpersDestroyApp) {
  exports['default'] = function (name) {
    var options = arguments.length <= 1 || arguments[1] === undefined ? {} : arguments[1];

    (0, _qunit.module)(name, {
      beforeEach: function beforeEach() {
        this.application = (0, _seniorProjectTestsHelpersStartApp['default'])();

        if (options.beforeEach) {
          options.beforeEach.apply(this, arguments);
        }
      },

      afterEach: function afterEach() {
        if (options.afterEach) {
          options.afterEach.apply(this, arguments);
        }

        (0, _seniorProjectTestsHelpersDestroyApp['default'])(this.application);
      }
    });
  };
});
define('senior-project/tests/helpers/module-for-acceptance.jshint', ['exports'], function (exports) {
  'use strict';

  describe('JSHint | helpers/module-for-acceptance.js', function () {
    it('should pass jshint', function () {
      if (!true) {
        var error = new chai.AssertionError('helpers/module-for-acceptance.js should pass jshint.');
        error.stack = undefined;throw error;
      }
    });
  });
});
define('senior-project/tests/helpers/resolver', ['exports', 'senior-project/resolver', 'senior-project/config/environment'], function (exports, _seniorProjectResolver, _seniorProjectConfigEnvironment) {

  var resolver = _seniorProjectResolver['default'].create();

  resolver.namespace = {
    modulePrefix: _seniorProjectConfigEnvironment['default'].modulePrefix,
    podModulePrefix: _seniorProjectConfigEnvironment['default'].podModulePrefix
  };

  exports['default'] = resolver;
});
define('senior-project/tests/helpers/resolver.jshint', ['exports'], function (exports) {
  'use strict';

  describe('JSHint | helpers/resolver.js', function () {
    it('should pass jshint', function () {
      if (!true) {
        var error = new chai.AssertionError('helpers/resolver.js should pass jshint.');
        error.stack = undefined;throw error;
      }
    });
  });
});
define('senior-project/tests/helpers/start-app', ['exports', 'ember', 'senior-project/app', 'senior-project/config/environment'], function (exports, _ember, _seniorProjectApp, _seniorProjectConfigEnvironment) {
  exports['default'] = startApp;

  function startApp(attrs) {
    var application = undefined;

    var attributes = _ember['default'].merge({}, _seniorProjectConfigEnvironment['default'].APP);
    attributes = _ember['default'].merge(attributes, attrs); // use defaults, but you can override;

    _ember['default'].run(function () {
      application = _seniorProjectApp['default'].create(attributes);
      application.setupForTesting();
      application.injectTestHelpers();
    });

    return application;
  }
});
define('senior-project/tests/helpers/start-app.jshint', ['exports'], function (exports) {
  'use strict';

  describe('JSHint | helpers/start-app.js', function () {
    it('should pass jshint', function () {
      if (!true) {
        var error = new chai.AssertionError('helpers/start-app.js should pass jshint.');
        error.stack = undefined;throw error;
      }
    });
  });
});
define("senior-project/tests/integration/event/event-test", ["exports", "senior-project/tests/pages/event"], function (exports, _seniorProjectTestsPagesEvent) {
  describe("Integration: EventPage", function () {
    before(function () {
      return this.page = _seniorProjectTestsPagesEvent["default"];
    });
    beforeEach(function () {
      return this.page.visit();
    });
    return describe("adding players", function () {
      return it("can add a new player", function () {
        expect(this.page.numPlayers).to.equal(3);
        this.page.setPlayerName('Derp');
        this.page.addPlayer();
        return andThen((function (_this) {
          return function () {
            expect(_this.page.numPlayers).to.equal(4);
            return expect(_this.page.playerInputValue);
          };
        })(this));
      });
    });
  });
});
define('senior-project/tests/page-object', ['exports', 'ember-cli-page-object'], function (exports, _emberCliPageObject) {
  exports.attribute = _emberCliPageObject.attribute;
  exports.clickOnText = _emberCliPageObject.clickOnText;
  exports.clickable = _emberCliPageObject.clickable;
  exports.collection = _emberCliPageObject.collection;
  exports.contains = _emberCliPageObject.contains;
  exports.count = _emberCliPageObject.count;
  exports.create = _emberCliPageObject.create;
  exports.fillable = _emberCliPageObject.fillable;
  exports.selectable = _emberCliPageObject.fillable;
  exports.hasClass = _emberCliPageObject.hasClass;
  exports.is = _emberCliPageObject.is;
  exports.isHidden = _emberCliPageObject.isHidden;
  exports.isVisible = _emberCliPageObject.isVisible;
  exports.notHasClass = _emberCliPageObject.notHasClass;
  exports.property = _emberCliPageObject.property;
  exports.text = _emberCliPageObject.text;
  exports.triggerable = _emberCliPageObject.triggerable;
  exports.value = _emberCliPageObject.value;
  exports.visitable = _emberCliPageObject.visitable;
  exports['default'] = {
    attribute: _emberCliPageObject.attribute,
    clickOnText: _emberCliPageObject.clickOnText,
    clickable: _emberCliPageObject.clickable,
    collection: _emberCliPageObject.collection,
    contains: _emberCliPageObject.contains,
    count: _emberCliPageObject.count,
    create: _emberCliPageObject.create,
    fillable: _emberCliPageObject.fillable,
    hasClass: _emberCliPageObject.hasClass,
    is: _emberCliPageObject.is,
    isHidden: _emberCliPageObject.isHidden,
    isVisible: _emberCliPageObject.isVisible,
    notHasClass: _emberCliPageObject.notHasClass,
    property: _emberCliPageObject.property,
    selectable: _emberCliPageObject.fillable,
    text: _emberCliPageObject.text,
    triggerable: _emberCliPageObject.triggerable,
    value: _emberCliPageObject.value,
    visitable: _emberCliPageObject.visitable
  };
  Object.defineProperty(exports, 'buildSelector', {
    enumerable: true,
    get: function get() {
      return _emberCliPageObject.buildSelector;
    }
  });
  Object.defineProperty(exports, 'findElementWithAssert', {
    enumerable: true,
    get: function get() {
      return _emberCliPageObject.findElementWithAssert;
    }
  });
  Object.defineProperty(exports, 'findElement', {
    enumerable: true,
    get: function get() {
      return _emberCliPageObject.findElement;
    }
  });
  Object.defineProperty(exports, 'getContext', {
    enumerable: true,
    get: function get() {
      return _emberCliPageObject.getContext;
    }
  });
});
define('senior-project/tests/pages/event', ['exports', 'ember-cli-page-object'], function (exports, _emberCliPageObject) {
  var EventPage, clickable, collection, count, fillable, isHidden, value, visitable;

  collection = _emberCliPageObject['default'].collection, visitable = _emberCliPageObject['default'].visitable, clickable = _emberCliPageObject['default'].clickable, isHidden = _emberCliPageObject['default'].isHidden, count = _emberCliPageObject['default'].count, fillable = _emberCliPageObject['default'].fillable, value = _emberCliPageObject['default'].value;

  EventPage = _emberCliPageObject['default'].create({
    visit: visitable('/event'),
    addPlayer: clickable('.add-player'),
    setPlayerName: fillable('.player-name-input'),
    playerInputValue: value('.player-name-input'),
    numPlayers: count('.players'),
    players: collection({
      itemScope: '.players'
    })
  });

  exports['default'] = EventPage;
});
define('senior-project/tests/resolver.jshint', ['exports'], function (exports) {
  'use strict';

  describe('JSHint | resolver.js', function () {
    it('should pass jshint', function () {
      if (!true) {
        var error = new chai.AssertionError('resolver.js should pass jshint.');
        error.stack = undefined;throw error;
      }
    });
  });
});
define('senior-project/tests/test-helper', ['exports', 'senior-project/tests/helpers/resolver', 'ember-mocha', 'senior-project/tests/helpers/start-app', 'ember'], function (exports, _seniorProjectTestsHelpersResolver, _emberMocha, _seniorProjectTestsHelpersStartApp, _ember) {
  var Em;

  Em = _ember['default'];

  (0, _seniorProjectTestsHelpersStartApp['default'])();

  (0, _emberMocha.setResolver)(_seniorProjectTestsHelpersResolver['default']);
});
define('senior-project/tests/unit/controllers/event-test', ['exports', 'chai', 'ember-mocha'], function (exports, _chai, _emberMocha) {

  (0, _emberMocha.describeModule)('controller:event', 'EventController', {
    // Specify the other units that are required for this test.
    // needs: ['controller:foo']
  }, function () {
    // Replace this with your real tests.
    (0, _emberMocha.it)('exists', function () {
      var controller = this.subject();
      (0, _chai.expect)(controller).to.be.ok;
    });
  });
});
/* jshint expr:true */
define('senior-project/tests/unit/controllers/event-test.jshint', ['exports'], function (exports) {
  'use strict';

  describe('JSHint | unit/controllers/event-test.js', function () {
    it('should pass jshint', function () {
      if (!true) {
        var error = new chai.AssertionError('unit/controllers/event-test.js should pass jshint.');
        error.stack = undefined;throw error;
      }
    });
  });
});
define('senior-project/tests/unit/pods/event/controller-test', ['exports', 'chai', 'ember-mocha'], function (exports, _chai, _emberMocha) {

  (0, _emberMocha.describeModule)('controller:event', 'EventController', {
    // Specify the other units that are required for this test.
    // needs: ['controller:foo']
  }, function () {
    // Replace this with your real tests.
    (0, _emberMocha.it)('exists', function () {
      var controller = this.subject();
      (0, _chai.expect)(controller).to.be.ok;
    });
  });
});
/* jshint expr:true */
define('senior-project/tests/unit/pods/event/controller-test.jshint', ['exports'], function (exports) {
  'use strict';

  describe('JSHint | unit/pods/event/controller-test.js', function () {
    it('should pass jshint', function () {
      if (!true) {
        var error = new chai.AssertionError('unit/pods/event/controller-test.js should pass jshint.');
        error.stack = undefined;throw error;
      }
    });
  });
});
define('senior-project/tests/unit/pods/event/route-test', ['exports', 'chai', 'ember-mocha'], function (exports, _chai, _emberMocha) {

  (0, _emberMocha.describeModule)('route:event', 'EventRoute', {
    // Specify the other units that are required for this test.
    // needs: ['controller:foo']
  }, function () {
    (0, _emberMocha.it)('exists', function () {
      var route = this.subject();
      (0, _chai.expect)(route).to.be.ok;
    });
  });
});
/* jshint expr:true */
define('senior-project/tests/unit/pods/event/route-test.jshint', ['exports'], function (exports) {
  'use strict';

  describe('JSHint | unit/pods/event/route-test.js', function () {
    it('should pass jshint', function () {
      if (!true) {
        var error = new chai.AssertionError('unit/pods/event/route-test.js should pass jshint.');
        error.stack = undefined;throw error;
      }
    });
  });
});
/* jshint ignore:start */

require('senior-project/tests/test-helper');
EmberENV.TESTS_FILE_LOADED = true;

/* jshint ignore:end */
//# sourceMappingURL=tests.map