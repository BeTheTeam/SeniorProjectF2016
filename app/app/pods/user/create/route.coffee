`import Ember from 'ember';`
`import Firebase from 'firebase'`

UserCreateRoute = Ember.Route.extend

  model: ->
    roles: @store.findAll('role')

`export default UserCreateRoute;`
