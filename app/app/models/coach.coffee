`import User from './user'`

CoachModel = User.extend

  teams: DS.hasMany('teams')

  save: () ->
    @_super().then((() ->
      @store.createRecord('user', (
        id: @id,
        role: 'coach'
      )).save().then()
    ).bind(@))

`export default CoachModel;`