`import PageObject from 'ember-cli-page-object'`

{ collection, visitable, clickable, isHidden, count, fillable, value } = PageObject

EventPage = PageObject.create
  visit: visitable('/event')
  addPlayer: clickable('.add-player')
  setPlayerName: fillable('.player-name-input')
  playerInputValue: value('.player-name-input')
  numPlayers: count('.players')
  players: collection
    itemScope: '.players'

`export default EventPage`
