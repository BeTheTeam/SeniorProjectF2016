`import Ember from 'ember'`

IndexRoute = Ember.Route.extend

  model: ->

  beforeModel: ->
    @set('store.page_title', 'Welcome to BeThe.Team!')

`export default IndexRoute;`
