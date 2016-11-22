`import Ember from 'ember';`

TeamsRoute = Ember.Route.extend

  model: ->
    teams: @store.findAll('team')

`export default TeamsRoute;`
