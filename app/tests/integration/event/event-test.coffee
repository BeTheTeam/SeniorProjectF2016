`import page from '../../pages/event'`
`import loginPage from '../../pages/login'`
`import Ember from 'ember'`

describe "Integration: EventPage", ->
  before ->
    @page = page
    @loginPage = loginPage

    @addPlayer = (playerName) ->
      @page.setPlayerName(playerName)
      @page.addPlayer()


  # beforeEach ->
  #   @timeout 10000
  #   @loginPage.visit()
  #   @loginPage.enterEmail('test@bethe.team')
  #   @loginPage.enterPassword('testPassw0rd')
  #   @loginPage.login()

  #   andThen =>
  #     @store.findAll('player').then((players) ->
  #       players.forEach((player) ->
  #         player.destroyRecord()
  #         player.save()
  #       )
  #     )

  #     @page.visit()


  # afterEach ->
  #   @loginPage.visit()
  #   @loginPage.logout()


  # describe "adding players", ->
  #   it "can add a new player", ->
  #     expect(@page.players().toArray().length).to.equal 0

  #     @addPlayer("derp")

  #     andThen =>
  #       expect(@page.players().toArray().length).to.equal 1
  #       expect(@page.playerInputValue).to.equal ""


  # describe "adding heats", ->
  #   it "can generate basic heats", ->
  #     console.log(@page.heats().toArray().length)
  #     expect(@page.heats().toArray().length).to.equal 0

  #     for i in [1..6]
  #       @addPlayer("derp#{i}")

  #     @page.generateHeats()

  #     andThen =>
  #       expect(@page.heats().toArray().length).to.equal 2
  #       expect(@page.heatsPlayers().toArray().length).to.equal 6
  #       #TODO Expect unique players for the heats


  # describe "dynamic number of players per heat", ->
  #   it "changes number of players per heat", ->
  #     expect(@page.heats().toArray().length).to.equal 0

  #     @page.setHeatSize(2)

  #     for i in [1..6]
  #       @addPlayer("derp#{i}")

  #     @page.generateHeats()

  #     andThen =>
  #       expect(@page.heats().toArray().length).to.equal 3
  #       expect(@page.heatsPlayers().toArray().length).to.equal 6


  # describe "dynamic number of heats", ->
  #   it "generates a specified number of heats", ->
  #     expect(@page.heats().toArray().length).to.equal 0

  #     @page.setNumberOfHeats(2)
  #     @page.generateNumberOfHeats()

  #     andThen =>
  #       expect(@page.heats().toArray().length).to.equal 2
