`import DS from 'ember-data'`

TeamMemberModel = DS.Model.extend

  team: DS.belongsTo('team', {embedded: 'always'})
  player: DS.belongsTo('player', {embedded: 'always'})
  approved: DS.attr('boolean', { defaultValue: false })

`export default TeamMemberModel;`