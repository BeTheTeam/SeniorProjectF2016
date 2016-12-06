`import Ember from 'ember';`
`import Firebase from 'firebase'`

RegisterRoute = Ember.Route.extend

  model: ->
    roles: ['Coach', 'Organizer', 'Scout', 'Player']

  beforeModel: ->
    @set('store.page_title', 'Register')

`export default RegisterRoute;`
