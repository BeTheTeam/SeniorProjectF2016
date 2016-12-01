`import Ember from 'ember';`
`import Firebase from 'firebase'`

TeamsRoute = Ember.Route.extend

  store: Ember.inject.service()

  beforeModel: () ->
    @set('store.page_title', "Teams")

  model: ->
    {
      teams: @get('store').peekRecord('coach', @get('session.uid')).get('teams')
    }
    # teams: @get('session').get('teams')

`export default TeamsRoute;`
