`import Ember from 'ember';`

PlayerRoute = Ember.Route.extend

  model: ->
    @store.findAll('player')

`export default PlayerRoute;`
