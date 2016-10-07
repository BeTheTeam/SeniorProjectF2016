`import PageObject from 'ember-cli-page-object'`

{ collection, visitable, clickable, isHidden, count, fillable, value } = PageObject

EventPage = PageObject.create
  visit: visitable('/login')

  enterEmail: fillable('.login-email')
  enterPassword: fillable('.login-password')

  emailValue: value('.login-email')
  passwordValue: value('.login-password')

  login: clickable('.btn-login')
  logout: clickable('.btn-logout')

  isLoggedIn: isHidden('.login-container')
  isLoggedOut: isHidden('.logout-container')


`export default EventPage`
