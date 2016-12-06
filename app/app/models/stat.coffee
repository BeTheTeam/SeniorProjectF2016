`import DS from 'ember-data'`

StatModel = DS.Model.extend
  type: DS.attr('string')
  statval: DS.attr('number')
  player: DS.belongsTo('player')

`export default StatModel;`
