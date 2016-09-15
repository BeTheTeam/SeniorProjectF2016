`import page from '../../pages/event'`

describe "Integration: EventPage", ->
  before ->
    @page = page

  beforeEach ->
    @page.visit()

  describe "adding players", ->

    it "can add a new player", ->
      expect(@page.numPlayers).to.equal 3

      @page.setPlayerName('Derp')
      @page.addPlayer()

      andThen =>
        expect(@page.numPlayers).to.equal 4
        expect(@page.playerInputValue)
