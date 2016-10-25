`import Ember from 'ember'`
`import _ from 'lodash/lodash'`

EventController = Ember.Controller.extend

  players: Ember.computed.alias 'model.players'
  heats: undefined
  heatSize: 3
  numOfHeats: 3

  actions:
    addPlayer: ->
      newPlayer = @store.createRecord('player', (
        name: @.get('playerName')
      ))
      newPlayer.save()
      @set('playerName', "")

    generateHeats: ->
      #TODO This can probably be done with a nice functional solution
      numHeats = @get('players.length')//@heatSize
      shuffledPlayers = _.shuffle(@get('players').toArray())
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
