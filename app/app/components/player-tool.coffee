`import Ember from 'ember';`

PlayerToolComponent = Ember.Component.extend

  session: Ember.inject.service()

  canAddStat: Ember.computed('session', () ->
    ObjectPromiseProxy = Ember.ObjectProxy.extend(Ember.PromiseProxyMixin)
    isThisCoachPromise = @player.get('coaches').then(((cs) ->
      return {isThisCoach: (cs.map((c) -> c.get('id')).indexOf(@get('session.uid')) > -1)}
    ).bind(@))

    return ObjectPromiseProxy.create({
      promise: isThisCoachPromise
    })
  )

  actions:
    sneakCanAddStat: () ->
      console.log("IMHEREYO")
      console.log(@get('canAddStat.content'))
    showStatModal: (id) ->
      m = @get('comp-'+id)
      console.log('comp-'+id)
      m.send('toggleModal')

`export default PlayerToolComponent;`