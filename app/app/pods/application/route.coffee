`import Ember from 'ember';`

AppRoute = Ember.Route.extend

  beforeModel: () ->
    console.log("I WAS CALLED")
    @get('session').fetch().then((a) ->
      console.log(a)
    , (e) ->
      console.log(e)
    )

`export default AppRoute;`