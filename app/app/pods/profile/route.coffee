`import Ember from 'ember';`

ProfileRoute = Ember.Route.extend

  firebaseApp: Ember.inject.service()
  setupController: (c, m) ->
    storageRef = @get('firebaseApp').storage().ref()
    # build the actual URL to the profile pic
    @get('store').findRecord('user', @get('session.uid')).then((user) ->
      path = 'images/' + user.id + '/' + user.get('profilePhotoName')
      storageRef.child(path).getDownloadURL().then((url) ->
        c.set('profile_image_url', url)
      ).catch((error) ->
        c.set('profile_image_url', '/default_user.png')
      )
    )

`export default ProfileRoute;`
