`import DS from 'ember-data';`

TeamModel = DS.Model.extend

  name: DS.attr('string')
  players: DS.hasMany('player')

`export default TeamModel;`
