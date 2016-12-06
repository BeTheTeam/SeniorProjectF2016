`import Ember from 'ember';`

TeamsRoute = Ember.Route.extend

  model: (params) ->
    this_team = @store.findRecord('team', params.team_id)
    return Ember.RSVP.hash({
      team: this_team,
      players: @store.findAll('player')
    })

`export default TeamsRoute;`
