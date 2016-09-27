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

  # dependent on previous test until we can figure out how to reset the model/controller
  describe "dynamic number of players per heat", ->
    it "changes number of players per heat", ->
      expect(@page.heats().toArray().length).to.equal 2

      @page.setHeatSize(2)
      @page.generateHeats()

      andThen =>
        expect(@page.heats().toArray().length).to.equal 3
        expect(@page.heatsPlayers().toArray().length).to.equal 6

  # yet again, this test depends on the previous one because of the reset thing
  describe "dynamic number of heats", ->
    it "generates a specified number of heats", ->
      expect(@page.heats().toArray().length).to.equal 3

      @page.setNumberOfHeats(2)
      @page.generateNumberOfHeats()

      andThen =>
        expect(@page.heats().toArray().length).to.equal 2
