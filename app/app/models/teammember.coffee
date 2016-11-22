`import DS from 'ember-data'`

TeamMemberModel = DS.Model.extend

  team: DS.belongsTo('team')
  player: DS.belongsTo('player')
  approved: DS.attr('boolean', { defaultValue: false })

`export default TeamMemberModel;`