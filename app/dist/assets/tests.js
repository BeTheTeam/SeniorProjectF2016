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
define('senior-project/tests/test-helper', ['exports', 'senior-project/tests/helpers/resolver', 'ember-mocha'], function (exports, _seniorProjectTestsHelpersResolver, _emberMocha) {

  (0, _emberMocha.setResolver)(_seniorProjectTestsHelpersResolver['default']);
});
define('senior-project/tests/test-helper.jshint', ['exports'], function (exports) {
  'use strict';

  describe('JSHint | test-helper.js', function () {
    it('should pass jshint', function () {
      if (!true) {
        var error = new chai.AssertionError('test-helper.js should pass jshint.');
        error.stack = undefined;throw error;
      }
    });
  });
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