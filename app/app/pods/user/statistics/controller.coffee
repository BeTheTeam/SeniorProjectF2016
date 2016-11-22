`import Ember from 'ember';`

UserStatisticsController = Ember.Controller.extend
  statsLabel: "Main"

  mainStats: Ember.computed 'model', 'statsLabel', ->
    
    @get('model.mainStats')

`export default UserStatisticsController;`
