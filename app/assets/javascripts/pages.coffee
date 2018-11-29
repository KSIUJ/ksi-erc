# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ -> 
  new Chartist.Line('.ct-chart', {
      labels: ['January', 'February', 'March', 'April', 'May'],
      series: [
        [12, 34, 40, 45, 62]
      ]
    }, {
      fullWidth: true,
      chartPadding: {
        right: 40
      }
    })

  $(document).ready ->
    $('.tabs').tabs()
    $('select').formSelect()
