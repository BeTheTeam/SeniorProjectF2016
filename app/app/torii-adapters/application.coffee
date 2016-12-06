`import Ember from 'ember';`
`import ToriiFirebaseAdapter from 'emberfire/torii-adapters/firebase';`

MyToriiFirebaseAdapter = ToriiFirebaseAdapter.extend
  firebase: Ember.inject.service()
  storage: Ember.inject.service()
  session: Ember.inject.service()
  store: Ember.inject.service()

  fetch: () ->
    this_u = @get('storage.cu')
    if Ember.isEmpty(this_u)
      throw new Error('No user in storage')
      return
    else
      @get('store').findRecord('user', this_u.uid ).then(((u) ->
        this_u.role = u.get('role')
        @get('store').findRecord(u.get('role'), this_u.uid).then(((tu) ->
          this_u.typed = tu.data
          return this_u
          ).bind(@))
        ).bind(@))

  open: (this_u) ->
    console.log(this_u)
    @set('storage.cu', this_u)
    @get('store').findRecord('user', this_u.uid ).then(((u) ->
      this_u.role = u.get('role')
      @get('store').findRecord(u.get('role'), this_u.uid).then(((tu) ->
        this_u.typed = tu.data
        return this_u
      ).bind(@))
    ).bind(@))

  close: ->
    @set('storage.cu', null)
    return @get('session').close().then((() => @transitionTo('index')).bind(@));

`export default MyToriiFirebaseAdapter`
