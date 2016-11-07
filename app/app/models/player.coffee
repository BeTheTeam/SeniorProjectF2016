`import DS from 'ember-data';`
`import Ember from 'ember'`

PlayerModel = DS.Model.extend

  name: DS.attr('string')
  team: DS.belongsTo('team')
  teamName: Ember.computed.alias('team.name')

`export default PlayerModel;`
