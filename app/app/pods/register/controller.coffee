`import Ember from 'ember';`

RegisterController = Ember.Controller.extend

  firebaseApp: Ember.inject.service()
  roleOptions: ['Coach', 'Organizer', 'Scout', 'Player']
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
        this_c = @
        auth.createUserWithEmailAndPassword(inputEmail, inputPassword).then((newUser) ->
          console.log(newUser)
          # Successfully create user
          console.log('user created')
          Ember.set(this_c, 'successMsg', true)

          this_c.store.createRecord(inputRole.toLowerCase(), (
            id: newUser.uid
            name: inputName,
          )).save().then(() -> this_c.transitionToRoute('login'))

        , ((response) ->

          # Unsuccessfully created user
          console.log('user not created')
          registerErrors.push response.message
          Ember.set(@, 'errorMsgs', registerErrors)
          console.log(@get('errorMsgs'))

        ).bind(@))

`export default RegisterController;`
