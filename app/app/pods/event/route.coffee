`import Ember from 'ember';`
`import Firebase from 'firebase'`

PlayerRoute = Ember.Route.extend

  model: ->
    if @session.get('uid')
      players: @store.query('player', {orderBy: 'uid', startAt:@session.get('uid'), endAt:@session.get('uid')})

  beforeModel: ->
    @set('store.page_title', "Events")

`export default PlayerRoute;`
