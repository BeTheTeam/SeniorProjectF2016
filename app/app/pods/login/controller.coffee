`import Ember from 'ember';`
`import Firebase from 'firebase';`

LoginController = Ember.Controller.extend

  loginEmail: undefined
  loginPassword: undefined
  userLoggedIn: false


  beforeModel: ->
    @get('session').fetch().catch(->)


  disableLogin: (data) ->
    $('.login-container').hide()
    $('.logout-container').show()
    Ember.set(@, 'userLoggedIn', true)

  setInput: (isValid)  ->
    if isValid
      $('input').removeClass('is-danger')
      Ember.set(@, 'loginEmail', undefined)
      Ember.set(@, 'loginPassword', undefined)
    else
      $('input').addClass('is-danger')
    

  actions:
    login: (provider) ->
      providerInfo =
        provider: 'password'
        email: @loginEmail
        password: @loginPassword

      @get('session').open('firebase', providerInfo).then(@disableLogin.bind(@))
      @setInput(@get('session.isAuthenticated'))
          

    logout: ->
      @get('session').close()
      $('.login-container').show()
      $('.logout-container').hide()
      Ember.set(@, 'userLoggedIn', false)
    

`export default LoginController;`
