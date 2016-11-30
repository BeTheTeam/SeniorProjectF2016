`import Ember from 'ember';`
`import Firebase from 'firebase'`

AppRoute = Ember.Route.extend

  storage: Ember.inject.service()

  beforeModel: () ->
    @get('session').fetch().then(((a) ->

    ).bind(@), (e) ->
      console.log(e)
    )
    @set('store.page_title', "BeThe.Team")

`export default AppRoute;`