`import Ember from 'ember';`
`import ToriiFirebaseAdapter from 'emberfire/torii-adapters/firebase';`

MyToriiFirebaseAdapter = ToriiFirebaseAdapter.extend
  firebase: Ember.inject.service()

  fetch: (auth) ->
    console.log("so fetch")
    console.log(auth)

  open: (auth) ->
    # console.log(firebase.query('userprofile', {uid: auth.uid}))
    console.log(auth)
    return auth

  close: ->
    @set('session.uid', null)
    return @get('session').close().then(() => @transitionTo('index'));

`export default MyToriiFirebaseAdapter`
