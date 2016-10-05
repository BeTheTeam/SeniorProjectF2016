import Ember from 'ember';
import ToriiFirebaseAdapter from 'emberfire/torii-adpaters/firebase';

export default ToriiFirebaseAdapter.extend({
  firebase: Ember.inject.service()
});
