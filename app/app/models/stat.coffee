`import DS from 'ember-data'`
is_dist_series_data = (stat) ->
  (['Long jump','High jump','Pole vault','Shot put','Discus throw'].indexOf(stat.get('stattype')) > -1)
is_time_series_data = (stat) ->
  (['60 m','100 m','200 m','400 m'].indexOf(stat.get('stattype')) > -1)

StatModel = DS.Model.extend
  stattype: DS.attr('string')
  statval: DS.attr('number')
  player: DS.belongsTo('player')

  stat_series: Ember.computed('stattype', () ->
    is_time_series_data(@) && 'time_based' || is_dist_series_data(@) && 'dist_based' || 'unbased'
  )

  stat_unit: Ember.computed('stattype', () ->
    is_time_series_data(@) && 's' || is_dist_series_data(@) && 'ft' || ''
  )

`export default StatModel;`
