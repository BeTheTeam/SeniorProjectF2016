`import DS from 'ember-data'`

TeamModel = DS.Model.extend

  name: DS.attr('string')
  teamOwner: DS.belongsTo('coach')
  teamMembers: DS.hasMany('teammembers')

`export default TeamModel;`
