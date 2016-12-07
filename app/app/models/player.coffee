`import User from './user'`

PlayerModel = User.extend

  only_player_thing: DS.attr('string')
  teams: DS.hasMany('team', {embedded: 'always'})
  stats: DS.hasMany('stat', {embedded: 'always'})

  coaches: Ember.computed('teams', () ->
    return @get('teams').then(((teams) ->
      return teams.map((t) -> t.get('coach.content')).filter((i,p,s) ->
        return s.indexOf(i) == p)
      ).bind(@))
  )
  chart_data_series: Ember.computed('stats', () ->
    return @get('stats').then(((stats)->
        is_dist_series_data = (stat) ->
          (['Long jump','High jump','Pole vault','Shot put','Discus throw'].indexOf(stat.get('stattype')) > -1)
        is_time_series_data = (stat) ->
          (['60 m','100 m','200 m','400 m'].indexOf(stat.get('stattype')) > -1)
        stat_series_type = (stat) ->
          is_time_series_data(stat) && 'time_based' || is_dist_series_data && 'dist_based' || 'unbased'

        organized_data_series = {
          time_based: {
            max_records: 0,
            series: {}
          }
          dist_based: {
            max_records: 0,
            series: {}
          }
          unbased: {
            series: {}
          }
        }

        stats.forEach((stat) ->
          sst = stat_series_type(stat)
          st = stat.get('stattype')
          if organized_data_series[sst].series[st] == undefined
            organized_data_series[sst].series[st] = []
          organized_data_series[sst].series[st] = organized_data_series[sst].series[st].concat(stat.get('statval'))
          organized_data_series[sst].series[st].length > organized_data_series[sst].max_records && organized_data_series[sst].max_records = organized_data_series[sst].series[st].length
        )

        return organized_data_series
      ).bind(@))
  )

  dist_chart_stats: Ember.computed(() ->
    return @get('stats').then(((s)->
        time_series_data = s.filter((s)->
          (['60 m','100 m','200 m','400 m'].indexOf(s.get('stattype')) > -1)
        )

        largest_series = 0
        time_series_data_sorted = {}

        time_series_data.forEach((s) ->
          console.log(s.get('stattype'))
          if time_series_data_sorted[s.get('stattype')] == undefined
            time_series_data_sorted[s.get('stattype')] = []
          time_series_data_sorted[s.get('stattype')] = time_series_data_sorted[s.get('stattype')].concat(s.get('statval'))
          if time_series_data_sorted[s.get('stattype')].length > largest_series
            largest_series = time_series_data_sorted[s.get('stattype')].length
        )

        prep_to_go = []

        for k,v of time_series_data_sorted
          prep_to_go = prep_to_go.concat({
            type: 'line',
            label: k,
            data: v,
            borderColor: 'rgba('+(Math.floor(Math.random() * 255) + 0)+','+(Math.floor(Math.random() * 255) + 0)+','+(Math.floor(Math.random() * 255) + 0)+',0.2)',
            fill: false
            })
          console.log(prep_to_go)
        return {
          labels: Array.apply(null, {length: largest_series}).map((v, i, a) -> a[i]=i+1),
          datasets: prep_to_go
        }
      ).bind(@))
  )
  save: () ->
    if @get('isNew')
      @_super().then((() ->
        @store.createRecord('user', (
          id: @id,
          role: 'player'
        )).save().then()
      ).bind(@))
    else
      @_super()

`export default PlayerModel;`
