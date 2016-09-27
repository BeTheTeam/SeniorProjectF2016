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
      expect(@page.players().toArray().length).to.equal 3

      @addPlayer("derp")

      andThen =>
        expect(@page.players().toArray().length).to.equal 4
        expect(@page.playerInputValue).to.equal ""

  describe "adding heats", ->
    it "can generate basic heats", ->
      expect(@page.heats().toArray().length).to.equal 0

      for i in [1..3]
        @addPlayer("derp#{i}")

      @page.generateHeats()

      andThen =>
        expect(@page.heats().toArray().length).to.equal 2
        expect(@page.heatsPlayers().toArray().length).to.equal 6
        #TODO Expect unique players for the heats

  describe "removing players", ->
    it "can remove a player from the list", ->
      expect(@page.players().toArray().length).to.equal 7

      for i in @page.players().toArray().length - 1
        @removePlayer(i)

      andThen =>
        expect(@page.players().toArray().length).to.equal 1