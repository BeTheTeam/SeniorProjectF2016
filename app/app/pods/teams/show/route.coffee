`import Ember from 'ember';`

TeamsRoute = Ember.Route.extend

  model: (params) ->
    return @store.findRecord('team', params.team_id).then(((t) ->
      return Ember.RSVP.hash({
        team: t,
        players: @store.findAll('player')
        canEdit: t.get('coach.id') == @get('session.uid')
      })
    ).bind(@))



`export default TeamsRoute;`
