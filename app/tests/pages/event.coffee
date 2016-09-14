`import PageObject from 'ember-cli-page-object'`

{ collection, visitable, clickable, isHidden, count, fillable} = PageObject

EventPage = PageObject.create
  visit: visitable('/event')
  addPlayer: clickable('.player-add')
  setPlayerName: fillable('.player-name-input')
  numPlayers: count('.players')
  players: collection
    itemScope: '.players'

`export default EventPage`
