`import Ember from 'ember';`
`import Firebase from 'firebase'`

RegisterRoute = Ember.Route.extend

  model: ->
    roles: @store.findAll('role')

`export default RegisterRoute;`
