window.addEventListener 'load', ->
  vote_info = new PouchDB("vote-info")
  vote_data = new PouchDB("vote-data")

  vote_info.put(
    _id: "1",
    name: "Brand1",
    colorByPoint: true,
    _rev: vote_info._rev

  ).then (response) ->
    console.log "response: " + response
  .catch (err) ->
    console.log "error : " + err
  data = [
    {
      _id: "data_1",
      name: 'Microsoft Internet Explorer',
      y: 56.33
    },
    {
      _id: "data_2",
      name: 'Chrome',
      y: 24.03,
      sliced: true,
      selected: true
    },
    {
      _id: "data_3",
      name: 'Firefox',
      y: 10.38
    },
    {
      _id: "data_4",
      name: 'Safari',
      y: 4.77
    },
    {
      _id: "data_5",
      name: 'Opera',
      y: 0.91
    }
  ]

  vote_data.put(data[0])
    .then (response) ->
      console.log "response: " + response
    .catch (err) ->
      console.log "error : " + err
  vote_data.put(data[1])
    .then (response) ->
      console.log "response: " + response
    .catch (err) ->
      console.log "error : " + err
  vote_data.put(data[2])
    .then (response) ->
      console.log "response: " + response
    .catch (err) ->
      console.log "error : " + err
  vote_data.put(data[3])
    .then (response) ->
      console.log "response: " + response
    .catch (err) ->
      console.log "error : " + err
  vote_data.put(data[4])
    .then (response) ->
      console.log "response: " + response
    .catch (err) ->
      console.log "error : " + err

  Highcharts.chart 'chart-container',
    chart:
      plotBackgroundColor: null
      plotBorderWidth: null
      plotShadow: false
      type: 'pie'
    title: text: 'title'
    tooltip: pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    plotOptions: pie:
      allowPointSelect: true
      cursor: 'pointer'
      dataLabels:
        enabled: true
        format: '<b>{point.name}</b>: {point.percentage:.1f} %'
        style: color: Highcharts.theme and Highcharts.theme.contrastTextColor or 'black'
    series: [ {
      name: 'Brands'
      colorByPoint: true
      data: [
        {
          name: 'Microsoft Internet Explorer'
          y: 56.33
        }
        {
          name: 'Chrome'
          y: 24.03
          sliced: true
          selected: true
        }
        {
          name: 'Firefox'
          y: 10.38
        }
        {
          name: 'Safari'
          y: 4.77
        }
        {
          name: 'Opera'
          y: 0.91
        }
        {
          name: 'Proprietary or Undetectable'
          y: 0.2
        }
      ]
    } ]
  window.vote_info = vote_info
  window.vote_data = vote_data
