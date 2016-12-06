`import DS from 'ember-data'`

UserModel = DS.Model.extend

  name: DS.attr('string')
  role: DS.attr('string')

`export default UserModel;`
