`import Ember from 'ember';`
`import Firebase from 'firebase'`

AppRoute = Ember.Route.extend

  storage: Ember.inject.service()

  setupController: (c, m) ->
    c.set('isCoach', Ember.computed 'session', ->
      @get('session.role') == 'coach'
    )

  beforeModel: () ->
    @set('store.page_title', "BeThe.Team")
    @get('session').fetch().then(((a) ->
      return a
    ).bind(@), (e) ->
      console.log(e)
    )
    
`export default AppRoute;`
