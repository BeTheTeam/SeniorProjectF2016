`import User from './user'`

CoachModel = User.extend

  teams: DS.hasMany('team', {embedded: 'always'})

  save: () ->
    if @get('isNew')
      @_super().then((() ->
        @store.createRecord('user', (
          id: @id,
          role: 'coach'
        )).save()
      ).bind(@))
    else
      @_super()

`export default CoachModel;`