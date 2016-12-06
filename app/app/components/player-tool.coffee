`import Ember from 'ember';`

PlayerToolComponent = Ember.Component.extend

  actions:
    showStatModal: (id) ->
      m = @get('comp-'+id)
      console.log('comp-'+id)
      m.send('toggleModal')

`export default PlayerToolComponent;`