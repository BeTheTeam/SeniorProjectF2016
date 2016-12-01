`import User from './user'`

PlayerModel = User.extend

  only_player_thing: DS.attr('string')
  teams: DS.hasMany('team', {embedded: 'always'})

  save: () ->
    if @get('isNew')
      @_super().then((() ->
        @store.createRecord('user', (
          id: @id,
          role: 'player'
        )).save().then()
      ).bind(@))
    else
      @_super()

`export default PlayerModel;`
