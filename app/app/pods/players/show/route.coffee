`import Ember from 'ember';`

PlayersRoute = Ember.Route.extend

  model: (params) ->
    this_player = @store.findRecord('player', params.player_id)
    console.log("look at me!!!")
    return this_player.then((p) ->
      return p.get('time_chart_stats').then((ptcs) ->
        console.log("HEWYEEYWHEWHE")
        console.log(ptcs)
        return Ember.RSVP.hash({
          player: p
          time_chart_stats: ptcs
          axis_labels: {
            scales: {
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
          }
        })
      )
    )


`export default PlayersRoute;`
