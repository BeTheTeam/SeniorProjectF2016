`import PageObject from 'ember-cli-page-object'`

{ collection, visitable, clickable, isHidden, count, fillable, value } = PageObject

EventPage = PageObject.create
  visit: visitable('/event')
  addPlayer: clickable('.add-player')
  generateHeats: clickable('.generate-heats')
  setPlayerName: fillable('.player-name-input')
  playerInputValue: value('.player-name-input')

  players: collection
    itemScope: '.players'
  heats: collection
    itemScope: '.heat'
  heatsPlayers: collection
    itemScope: '.heat-player'

`export default EventPage`
