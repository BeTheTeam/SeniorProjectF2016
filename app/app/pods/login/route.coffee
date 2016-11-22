`import Ember from 'ember';`

LoginRoute = Ember.Route.extend


  model: ->

  actions:
    login: () ->
      controller = @get('controller')

      providerInfo =
        provider: 'password'
        email: controller.get('loginEmail')
        password: controller.get('loginPassword')

      @get('session').open('firebase', providerInfo).then(((u)->
        @transitionTo('home')
        return
      ).bind(@))

`export default LoginRoute;`
