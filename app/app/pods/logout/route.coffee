`import Ember from 'ember';`

LogoutRoute = Ember.Route.extend

  model: ->
    @get('session').close()

`export default LogoutRoute;`
