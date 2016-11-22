`import User from './user'`

PlayerModel = User.extend

  only_player_thing: DS.attr('string')
  team_memberships: DS.hasMany('teammembers')

  save: () ->
    @_super().then((() ->
      @store.createRecord('user', (
        id: @id,
        role: 'player'
      )).save().then()
    ).bind(@))

`export default PlayerModel;`
