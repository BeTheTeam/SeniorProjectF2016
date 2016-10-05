`import Ember from 'ember';`
`import Firebase from 'firebase';`

UserCreateController = Ember.Controller.extend

  loginEmail: undefined
  loginPassword: undefined

  actions:
    createUser: ->
     firebase.auth().createUserWithEmailAndPassword(@loginEmail, @loginPassword).catch((error) ->
       console.log(error.code)
       console.log(error.message))

`export default UserCreateController;`
