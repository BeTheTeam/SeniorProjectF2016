`import User from './user'`

PlayerModel = User.extend

  only_player_thing: DS.attr('string')
  teams: DS.hasMany('team', {embedded: 'always'})
  stats: DS.hasMany('stat', {embedded: 'always'})

  time_chart_stats: Ember.computed(() ->
    return @get('stats').then(((s)->
        time_series_data = s.filter((s)->
          (['60 m','100 m','200 m','400 m'].indexOf(s.get('stattype')) > -1)
        )
        console.log(time_series_data)
        @set('time_series_data_sorted',{
          labels: ['hey'],
          datasets: [20]
        })
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
        console.log("sorted here");
        console.log(time_series_data_sorted)

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
        # time_series_data_sorted.forEach((sn,sv) ->
        #   console.log(sn);
        #   console.log(sv);
        # )
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
