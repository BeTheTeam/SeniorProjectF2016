`import Ember from 'ember';`
`import ToriiFirebaseAdapter from 'emberfire/torii-adapters/firebase';`

MyToriiFirebaseAdapter = ToriiFirebaseAdapter.extend
  firebase: Ember.inject.service()
  storage: Ember.inject.service()
  session: Ember.inject.service()

  fetch: () ->
    token = @get('storage.token')

    console.log(@session)
    if Ember.isEmpty(token)
      throw new Error('No token in storage')
      return
    else
      return @get('storage.cu')

  open: (auth) ->

    @set('storage.cu', auth)
    auth.getToken().then(((t) ->
      @set('storage.token', t)
    ).bind(@))
    return auth

  close: ->
    @set('storage.cu', null)
    @set('storage.token', null)
    return @get('session').close().then((() => @transitionTo('index')).bind(@));

`export default MyToriiFirebaseAdapter`
