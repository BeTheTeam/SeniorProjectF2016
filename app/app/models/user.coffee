`import DS from 'ember-data'`

UserModel = DS.Model.extend
  
  email: DS.attr('string')
  name: DS.attr('string')
  role: DS.attr('string')

`export default UserModel;`
