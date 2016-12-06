`import Ember from 'ember';`

ShowTeamController = Ember.Controller.extend

  freePlayers: (Ember.computed.filter 'model.players', (player) ->
    @model.team.get('players').indexOf(player) < 0
    ).property('model.team.players')

  actions:
    addPlayer: (player) ->
      player.get('teams').pushObject(@model.team)
      player.save()
      @model.team.get('players').pushObject(player)
      @model.team.save()

    removePlayer: (player) ->
      player.get('teams').removeObject(@model.team)
      player.save()
      @model.team.get('players').removeObject(player)
      @model.team.save()



`export default ShowTeamController;`
