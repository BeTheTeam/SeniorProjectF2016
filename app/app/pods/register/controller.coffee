`import Ember from 'ember';`

RegisterController = Ember.Controller.extend

  firebaseApp: Ember.inject.service()
  roleOptions: Ember.computed.alias('model.roles')
  errorMsgs: []
  successMsg: false

  registerRole: undefined

  actions:

    newlineHook: ->
      Ember.$('#registerBtn').click()

    register: ->
      inputName = @get('registerName')
      inputEmail = @get('registerEmail')
      inputPassword = @get('registerPassword')
      inputRole = @get('registerRole')

      registerErrors = []

      if !inputRole
        registerErrors.push "You must select a role."
        Ember.set(@, 'errorMsgs', registerErrors)
      if !inputName
        registerErrors.push "You must enter a name."
        Ember.set(@, 'errorMsgs', registerErrors)
      if !inputEmail
        registerErrors.push "You must enter an email address."
        Ember.set(@, 'errorMsgs', registerErrors)
      if !inputPassword
        registerErrors.push "You must enter a password."
        Ember.set(@, 'errorMsgs', registerErrors)


      if inputEmail && inputPassword && inputName && inputRole

        auth = @get('firebaseApp').auth()
        newUserProfile = @store.createRecord('userprofile', (
          name: inputName,
          role: inputRole
        ))
        this_page = @
        auth.createUserWithEmailAndPassword(inputEmail, inputPassword).then((newUser) ->
          console.log(newUser)
          # Successfully create user
          console.log('user created')
          Ember.set(this_page, 'successMsg', true)

          newUserProfile.uid= newUser.uid
          newUserProfile.save()

          this_page.transitionToRoute('login')

        , ((response) ->

          # Unsuccessfully created user
          console.log('user not created')
          registerErrors.push response.message
          Ember.set(@, 'errorMsgs', registerErrors)
          console.log(@get('errorMsgs'))

        ).bind(@))

`export default RegisterController;`
