`import Ember from 'ember';`

stat1 =
  type: "int"
  dataTime: 1479420255
  data: 3

stat2 =
  type: "int"
  dateTime: 1479420291
  data: 5

stat3 =
  type: "int"
  dateTime: 1479420306
  data: 1

event =
  label: "Babby's First Event"
  stats:
    [ stat1, stat2, stat3 ]


UserStatsRoute = Ember.Route.extend
  model: ->
    [event]

`export default UserStatsRoute;`
