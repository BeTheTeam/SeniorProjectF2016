`import Ember from 'ember'`

EventController = Ember.Controller.extend

  players: Ember.computed.alias 'model'


  actions:
    addPlayer: ->
      @model.pushObject @playerName
      @set('playerName', "")

`export default EventController`
