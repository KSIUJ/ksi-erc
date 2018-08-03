$(function() {
    // Initialize collapse button
    $("#menu-btn").sideNav({
      menuWidth: 200,
      draggable: true
    });

    // Initialize role select
    $('select').material_select();

    // Initialize autocomplete
    $('input#member').autocomplete({
        data: {
            "Adam Piekarczyk": null,
            "Adam Pardyl": null,
            "Adam Polak": null
        },
        limit: 5,
        onAutocomplete: function(val) {},
        minLength: 2,
    });

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
    });
});