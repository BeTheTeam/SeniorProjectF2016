`import Ember from 'ember'`

HomeRoute = Ember.Route.extend

  model: ->

  beforeModel: ->
    @set('store.page_title', 'Home')

`export default HomeRoute;`