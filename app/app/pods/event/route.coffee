`import Ember from 'ember';`

PlayerRoute = Ember.Route.extend

  model: ->
    players: @store.findAll('player')

`export default PlayerRoute;`
