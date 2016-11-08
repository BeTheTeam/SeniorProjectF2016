`import Ember from 'ember';`

LogoutRoute = Ember.Route.extend

  model: ->
    @get('session').close()
    @transitionTo('index')

`export default LogoutRoute;`
