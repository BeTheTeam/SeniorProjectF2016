`import Ember from 'ember';`

LogoutRoute = Ember.Route.extend

  model: ->
    @get('session').close()
    @transitionToRoute('index')

`export default LogoutRoute;`
