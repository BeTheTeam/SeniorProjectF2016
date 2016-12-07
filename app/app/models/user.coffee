`import DS from 'ember-data'`

UserModel = DS.Model.extend

  name: DS.attr('string')
  role: DS.attr('string')
  profilePhotoName: DS.attr('string')

`export default UserModel;`
