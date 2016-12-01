`import Ember from 'ember'`
`import _ from 'lodash/lodash'`

EventController = Ember.Controller.extend

  teams: Ember.computed.alias 'model.teams'

  actions:
    createTeam: ->
      if @get('teamName').length > 0
        coach = @get('store').peekRecord('coach', @get('session.uid'))
        newTeam = @store.createRecord('team', {
          name: @get('teamName')
          coach: coach
        })
        newTeam.save()
        coach.get('teams').pushObject(newTeam)
        coach.save()
        @set('teamName', "")
      else
        #TODO: Show Error

`export default EventController`
