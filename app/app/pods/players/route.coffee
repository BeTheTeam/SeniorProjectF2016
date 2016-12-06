`import Ember from 'ember';`
`import Firebase from 'firebase'`

PlayersRoute = Ember.Route.extend

  store: Ember.inject.service()

  beforeModel: () ->
    @set('store.page_title', "Players")

`export default PlayersRoute;`
