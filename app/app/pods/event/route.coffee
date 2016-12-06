`import Ember from 'ember';`
`import Firebase from 'firebase'`

PlayerRoute = Ember.Route.extend

  model: ->
    teams: @store.findAll('team')
    players: @store.findAll('player')
    #if @session.get('uid')
      #modelToReturn.players = @store.query('player', {orderBy: 'uid', startAt:@session.get('uid'), endAt:@session.get('uid')})
    #modelToReturn

  beforeModel: ->
    @set('store.page_title', "Events")

`export default PlayerRoute;`
