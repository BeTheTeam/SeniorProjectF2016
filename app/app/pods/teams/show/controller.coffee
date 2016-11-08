`import Ember from 'ember';`

ShowTeamController = Ember.Controller.extend

  freePlayers: Ember.computed.filterBy('model.players', 'team')

  actions:
    addPlayer: (player) ->
      console.log player.get('name')


`export default ShowTeamController;`
