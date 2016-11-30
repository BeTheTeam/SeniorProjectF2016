`import Ember from 'ember';`

ShowTeamController = Ember.Controller.extend

  freePlayers: Ember.computed.filterBy 'model.players', 'team', null

  actions:
    addPlayer: (player) ->
      player.set('team', @model.team)
      player.save()

    removePlayer: (player) ->
      player.set('team', null)
      player.save()


`export default ShowTeamController;`
