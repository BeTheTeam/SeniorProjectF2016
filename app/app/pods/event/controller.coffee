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

  anotherCompProperty: Ember.computed 'numOfHeats', ->
    console.log "This is a computed property happening"

  combinedTeams: Ember.computed 'players', 'team1', 'team2', ->
    console.log "This section is happening"
    playerList = []
    for player in @players
      console.log player.get('teamName')
      console.log @team1.get('name')
      console.log @team2.get('name')
      if player.get('teamName') == @team1.get('name') or player.get('teamName') == @team2.get('name')
        playerList.append(player)
    for player in playerList
      console.log player.get('name')
    playerList



  actions:
    addPlayer: ->
      newPlayer = @store.createRecord('player', (
        name: @.get('playerName'),
        uid: @session.get('uid')
      ))
      newPlayer.save()
      @set('playerName', "")

    generateHeats: ->
      #TODO This can probably be done with a nice functional solution
      console.log @get('team1.players').toArray()
      console.log @get('team2.players').toArray()
      numHeats = @get('combinedTeams.length')//@heatSize
      shuffledPlayers = _.shuffle(@get('combinedTeams').toArray())
      tempHeats = []
      for i in [0...numHeats]
        singleHeat = []
        for j in [0...@heatSize]
          singleHeat.push shuffledPlayers[(@heatSize*i)+j]
        tempHeats.push(singleHeat)
      @set('heats', tempHeats)

    generateNumberOfHeats: ->
      numHeatsPossible = @get('players').length//@heatSize
      console.log('numHeatsPossible: ' + numHeatsPossible)
      console.log('numOfHeats: ' + @numOfHeats)
      # Defaults to number of heats possible with the given heat size
      if numOfHeats < numHeatsPossible
        numOfHeats = numHeatsPossible

      shuffledPlayers = _.shuffle(@.get('players'))
      tempHeats = []
      for i in [0...@numOfHeats]
        singleHeat = []
        for j in [0...@heatSize]
          singleHeat.push shuffledPlayers[(@heatSize*i)+j]
        tempHeats.push(singleHeat)
      @set('heats', tempHeats)

`export default EventController`
