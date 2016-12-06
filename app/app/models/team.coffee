`import DS from 'ember-data'`

TeamModel = DS.Model.extend

  name: DS.attr('string')
  coach: DS.belongsTo('coach')
  players: DS.hasMany('player', {embedded: 'always'})

`export default TeamModel;`
