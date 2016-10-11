import Ember from 'ember';
import ToriiFirebaseAdapter from 'emberfire/torii-adapters/firebase';

export default ToriiFirebaseAdapter.extend({
  firebaseApp: Ember.inject.service(),
  
  actions: {

    createUser(email, pass) {
      const auth = this.get('firebaseApp').auth();
      auth.createUserWithEmailAndPassword(email, pass).then((userResponse) => {
        const user = this.store.createRecord('user', {
          id: userResponse.uid,
          email: userResponse.email
        });
        return user.save();
      });
    }

  }
  
});
