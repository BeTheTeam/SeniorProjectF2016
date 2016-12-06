`import User from './user'`

ScoutModel = User.extend

  for: DS.attr('string')

  save: () ->
    @_super().then((() ->
      @store.createRecord('user', (
        id: @id,
        role: 'scout'
      )).save().then()
    ).bind(@))

`export default ScoutModel;`