`import Ember from 'ember';`
`import config from './config/environment';`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route 'event'
  @route 'login'
  @route 'user', ->
    @route 'create'
    @route 'statistics'

`export default Router;`
