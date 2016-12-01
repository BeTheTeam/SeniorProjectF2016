`import Ember from 'ember'`
`import _ from 'lodash/lodash'`

EventController = Ember.Controller.extend

  players: Ember.computed.alias 'model.players'
  teams: Ember.computed.alias 'model.teams'
  heats: undefined
  heatSize: 3
  numOfHeats: 3
  team1: undefined
  team2: undefined

  combinedTeams: Ember.computed 'team1', 'team2', ->
    t1 = @store.peekRecord('team', @team1.id)
    t2 = @store.peekRecord('team', @team2.id)
    playerList = t1.get('players').toArray()
    t2p = t2.get('players').toArray()
    return playerList.concat(t2p)

  actions:
    # addPlayer: ->
    #   newPlayer = @store.createRecord('player', (
    #     name: @.get('playerName'),
    #     uid: @session.get('uid')
    #   ))
    #   newPlayer.save()
    #   @set('playerName', "")

    generateHeats: ->
      #TODO This can probably be done with a nice functional solution
      console.log @get('combinedTeams.length')//@heatSize
      numHeats = @get('combinedTeams.length')//@heatSize
      shuffledPlayers = _.shuffle(@get('combinedTeams'))
      tempHeats = []
      for i in [0...numHeats]
        singleHeat = []
        for j in [0...@heatSize]
          singleHeat.push shuffledPlayers[(@heatSize*i)+j]
        tempHeats.push(singleHeat)
      @set('heats', tempHeats)

    generateNumberOfHeats: ->
      numHeatsPossible = @get('combinedTeams.length')//@heatSize
      console.log('numHeatsPossible: ' + numHeatsPossible)
      console.log('numOfHeats: ' + @numOfHeats)
      # Defaults to number of heats possible with the given heat size
      if numOfHeats < numHeatsPossible
        numOfHeats = numHeatsPossible

      shuffledPlayers = _.shuffle(@get('combinedTeams'))
      tempHeats = []
      for i in [0...@numOfHeats]
        singleHeat = []
        for j in [0...@heatSize]
          singleHeat.push shuffledPlayers[(@heatSize*i)+j]
        tempHeats.push(singleHeat)
      @set('heats', tempHeats)

`export default EventController`
