import Ember from 'ember';
import ToriiFirebaseAdapter from 'emberfire/torii-providers/firebase';

export default ToriiFirebaseAdapter.extend({
  firebase: Ember.inject.service()
});
