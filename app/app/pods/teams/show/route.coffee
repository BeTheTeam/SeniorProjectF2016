`import Ember from 'ember';`

TeamsRoute = Ember.Route.extend

  model: (params) ->
    team: @store.findRecord('team', params.team_id)
    players: @store.findAll('player')

`export default TeamsRoute;`
