`import page from '../../pages/event'`

describe "Integration: EventPage", ->
  before ->
    @page = page

    @addPlayer = (playerName) ->

      @page.setPlayerName(playerName)
      @page.addPlayer()

  beforeEach ->
    @page.visit()

  describe "adding players", ->
    it "can add a new player", ->
      expect(@page.numPlayers).to.equal 3

      @addPlayer("derp")

      andThen =>
        expect(@page.numPlayers).to.equal 4
        expect(@page.playerInputValue).to.equal ""

  describe.only "adding heats", ->
    it "can generate basic heats", ->
      expect(@page.heats().toArray().length).to.equal 0

      for i in [1..3]
        @addPlayer("derp#{i}")

      @page.generateHeats()

      andThen =>
        expect(@page.heats().toArray().length).to.equal 2
        expect(@page.heatsPlayers().toArray().length).to.equal 6
        #TODO Expect unique players for the heats
