`import Ember from 'ember';`

PlayersRoute = Ember.Route.extend

  model: (params) ->
    this_player = @store.findRecord('player', params.player_id)
    return Ember.RSVP.hash({
      player: this_player
    })

`export default PlayersRoute;`
