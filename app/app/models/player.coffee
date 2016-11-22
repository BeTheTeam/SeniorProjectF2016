`import DS from 'ember-data';`
`import Ember from 'ember'`

PlayerModel = DS.Model.extend

  name: DS.attr('string')
  team: DS.belongsTo('team', async: false)
  teamName: Ember.computed.alias('team.name')
  uid: DS.attr('string')

`export default PlayerModel;`
