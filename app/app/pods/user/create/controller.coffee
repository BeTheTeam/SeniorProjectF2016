`import Ember from 'ember';`

UserCreateController = Ember.Controller.extend

  loginEmail: undefined
  loginPassword: undefined
  firebaseApp: Ember.inject.service()
  roleOptions: Ember.computed.alias('model.roles')
  showError: false
  errorMessage: undefined

  actions:
    selection: ->

    createUser: ->
      email = @get('loginEmail')
      pass = @get('loginPassword')
      if email != undefined && pass != undefined
        auth = @get('firebaseApp').auth()
        auth.createUserWithEmailAndPassword(email, pass).then(() ->
          # Successfully create user
          console.log('user created')
        , ((response) ->
          # Unsuccessfully created user
          console.log('user not created')
          Ember.set(@, 'showError', true)
          Ember.set(@, 'errorMessage', response.message)
          console.log(@get('showError'))
          console.log(@get('errorMessage'))
        ).bind(@))
    
`export default UserCreateController;`
