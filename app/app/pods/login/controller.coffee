`import Ember from 'ember';`
`import Firebase from 'firebase';`

LoginController = Ember.Controller.extend

  loginEmail: undefined
  loginPassword: undefined

  setInput: (isValid)  ->
    if isValid
      $('input').removeClass('is-danger')
      Ember.set(@, 'loginEmail', undefined)
      Ember.set(@, 'loginPassword', undefined)
    else
      $('input').addClass('is-danger')


`export default LoginController;`
