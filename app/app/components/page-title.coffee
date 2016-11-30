`import Ember from 'ember';`

PageTitleComponent = Ember.Component.extend

  store: Ember.inject.service()

  cpimgnum: Ember.computed('store.page_title', () ->
      Math.floor(Math.random() * (4)) + 1
    )


`export default PageTitleComponent;`