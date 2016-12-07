`import Ember from 'ember';`

format_data_to_graph = (series) ->
  randomColor()
  datasets = []
  for k,v of series.series
    rc = randomColor({
       luminosity: 'bright',
       format: 'rgbArray',
       hue: 'blue'
    }).join()
    datasets = datasets.concat({
        type: 'line',
        label: k,
        data: v,
        borderColor: 'rgba('+rc+',0.7)',
        backgroundColor: 'rgba('+rc+',0.1)'
      })
  return {
    labels: Array.apply(null, {length: series.max_records}).map((v, i, a) -> a[i]=i+1)
    datasets: datasets
  }
PlayersRoute = Ember.Route.extend


  store: Ember.inject.service()

  beforeModel: () ->
    @set('store.page_title', "Player Profile")

  model: (params) ->
    this_player = @store.findRecord('player', params.player_id)
    return this_player.then((p) ->
      return p.get('chart_data_series').then((ptcs) ->
        return Ember.RSVP.hash({
          player: p
          time_chart_stats: format_data_to_graph(ptcs.time_based)
          time_chart_labels: {
            yAxes: [{
              scaleLabel: {
                display: true,
                labelString: 'Seconds'
              }
            }],
            xAxes: [{
              scaleLabel: {
                display: true,
                labelString: 'Tries'
              }
            }]
          }
          dist_chart_stats: format_data_to_graph(ptcs.dist_based)
          dist_chart_labels: {
            yAxes: [{
              scaleLabel: {
                display: true,
                labelString: 'Feet'
              }
            }],
            xAxes: [{
              scaleLabel: {
                display: true,
                labelString: 'Tries'
              }
            }]
          }
        })
      )
    )


`export default PlayersRoute;`
