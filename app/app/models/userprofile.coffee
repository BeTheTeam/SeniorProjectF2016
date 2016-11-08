`import DS from 'ember-data'`

UserProfileModel = DS.Model.extend

  uid: DS.attr('string')
  name: DS.attr('string')
  role: DS.attr('string')

`export default UserProfileModel;`
