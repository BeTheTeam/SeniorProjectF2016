`import Ember from 'ember';`
`import ToriiFirebaseAdapter from 'emberfire/torii-adapters/firebase';`

MyToriiFirebaseAdapter = ToriiFirebaseAdapter.extend
  firebase: Ember.inject.service()

  fetch: ->
    console.log('test fetch')
    token = @get('storage.token')
    console.log(token)
    if Ember.isEmpty(token)
      throw new Error('No token in storage')
    
    Ember.RSVP.resolve(
      token
    )

  open: ->
    cosole.log('test open')
    @set('storage.token', 'test')
    Ember.RSVP.resolve()

  close: ->
    console.log('test close')
    @set('storage.token', null)
    Ember.RSVP.resolve()

`export default MyToriiFirebaseAdapter`
