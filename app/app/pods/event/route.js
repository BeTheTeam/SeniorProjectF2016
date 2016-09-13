import Ember from 'ember';;
var EventRoute;

EventRoute = Ember.Route.extend({
  model: function() {
    return ["Player 1", "Player 2", "Player 2"];
  }
});

export default EventRoute;;
