`import Ember from 'ember';`

PlayerStatModalComponent = Ember.Component.extend
  statTypeOptions: ['60 m','100 m','200 m','400 m','Long jump','High jump','Pole vault','Shot put','Discus throw']

  store: Ember.inject.service()

  expose: (() ->
      app_controller = @get('targetObject')
      exposedName = "comp-" + @get('id')
      app_controller.set(exposedName, @)
    ).on('init')

  actions:
    toggleModal: ->
      @toggleProperty('enabled')
    recordStat: ->
      if @get('newStatType') == undefined
        st = @get('statTypeOptions')[0]
      else
        st = @get('newStatType')
      store = @.get('store')
      this_player = @get('player')
      newSI = {
        stattype: st
        statval: parseFloat(@get('newStatValue').replace(/[^0-9.,]/g,''))
        player: this_player
      }
      newStat = store.createRecord('stat', newSI)
      newStat.save().then((()->
        this_player.get('stats').pushObject(newStat)
        this_player.save().then((()->
            @send('toggleModal')
          ).bind(@))
      ).bind(@))

`export default PlayerStatModalComponent;`