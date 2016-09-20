`import Ember from 'ember'`
`import _ from 'lodash/lodash'`

EventController = Ember.Controller.extend

  players: Ember.computed.alias 'model'
  heats: undefined
  heatSize: 3

  actions:
    addPlayer: ->
      @model.pushObject @playerName
      @set('playerName', "")

    generateHeats: ->
      #TODO This can probably be done with a nice functional solution
      numHeats = @get('players').length//@heatSize
      shuffledPlayers = _.shuffle(@.get('players'))
      tempHeats = []
      for i in [0...numHeats]
        singleHeat = []
        for j in [0...@heatSize]
          singleHeat.push shuffledPlayers[(@heatSize*i)+j]
        tempHeats.push(singleHeat)
      @set('heats', tempHeats)



`export default EventController`
