`import Ember from 'ember';`
`import Firebase from 'firebase'`

TeamsRoute = Ember.Route.extend

  store: Ember.inject.service()

  beforeModel: () ->
    @set('store.page_title', "Teams")

  model: ->
    console.log("pulling up model")
    all_teams = @get('store').findAll('team')
    return all_teams.then(((teams) ->
      my_teams = (@get('session.role') == 'coach' && @get('store').peekRecord('coach', @get('session.uid')).get('teams')) || false
      all_teams = my_teams && teams.toArray().filter(((t) -> t.get('coach.id') != @get('session.uid')).bind(@)) || teams
      to_ret = {
        teams: all_teams
        my_teams: my_teams
      }
      console.log("RAWR!")
      console.log(to_ret)
      return to_ret
    ).bind(@))

`export default TeamsRoute;`
