`import Ember from 'ember';`
`import Firebase from 'firebase'`

UserCreateController = Ember.Controller.extend

  loginEmail: undefined
  loginPassword: undefined

  roleOptions: Ember.computed.alias('model.roles')

  actions:
    selection: ->

    createUser: ->
      console.log(@get('session').createUser())
    
`export default UserCreateController;`
