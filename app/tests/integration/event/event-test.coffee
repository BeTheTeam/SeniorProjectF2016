`import page from '../../pages/event'`

describe "Integration: EventPage", ->
  before ->
    @page = page
  beforeEach ->
    @page.visit()

  describe "adding players", ->
    it "can add a new player, and clears the text input", ->
      expect(@page.numPlayers).to.equal 3
      @page.setPlayerName('Derp')
      expect(@page.numPlayers).to.equal 4

