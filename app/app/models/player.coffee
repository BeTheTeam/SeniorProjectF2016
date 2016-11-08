`import DS from 'ember-data'`

PlayerModel = DS.Model.extend

  name: DS.attr('string')
  uid: DS.attr('string')


`export default PlayerModel;`
