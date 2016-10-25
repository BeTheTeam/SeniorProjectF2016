`import page from '../../pages/login'`

describe "Integration: LoginPage", ->
  before ->
    @page = page

  beforeEach ->
    @page.visit()

  describe "Login", ->
    it "Log in successfully", ->
      expect(@page.emailValue, undefined)
      expect(@page.passwordValue, undefined)

      @page.enterEmail('test@bethe.team')
      @page.enterPassword('testPassw0rd')

      @page.login()

      andThen =>
        expect(@isLoggedIn, 1)
        expect(@isLoggedOut, 0)
        @page.logout()

    it "Fails to log in", ->
      expect(@page.emailValue, undefined)
      expect(@page.passwordValue, undefined)

      @page.enterEmail('dummy@dumdum.com')
      @page.enterPassword('verysecurewow')

      @page.login()

      andThen =>
        expect(@isLoggedIn, 0)
        expect(@isLoggedOut, 1)
