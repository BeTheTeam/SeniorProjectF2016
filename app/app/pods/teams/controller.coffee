`import Ember from 'ember'`
`import _ from 'lodash/lodash'`

EventController = Ember.Controller.extend

  teams: Ember.computed.alias 'model.teams'

  actions:
    createTeam: ->
      newTeam = @store.createRecord('team', (
        name: @.get('teamName')
      ))
      newTeam.save()
      @set('teamName', "")

`export default EventController`
