`import DS from 'ember-data'`

StatModel = DS.Model.extend
  stattype: DS.attr('string')
  statval: DS.attr('number')
  player: DS.belongsTo('player')

`export default StatModel;`
