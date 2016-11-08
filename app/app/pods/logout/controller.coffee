`import Ember from 'ember';`
`import Firebase from 'firebase';`

LogoutController = Ember.Controller.extend

  beforeModel: ->
    @get('session').close()


`export default LogoutController;`
