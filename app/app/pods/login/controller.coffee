`import Ember from 'ember';`

LoginController = Ember.Controller.extend

  loginEmail: undefined
  loginPassword: undefined

  beforeModel: ->
    @get('session').fetch().catch(->)


  actions:
    signIn: (provider) ->
      providerInfo =
        provider: 'password'
        email: @loginEmail
        password: @loginPassword

      @get('session').open('firebase', providerInfo).then((data) -> console.log(data.currentUser))


    signOut: ->
      @get('session').close()

`export default LoginController;`
