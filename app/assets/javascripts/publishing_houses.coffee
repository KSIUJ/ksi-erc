# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#publishing_houses').DataTable({
    "language": {
      "url": "//cdn.datatables.net/plug-ins/1.10.10/i18n/Polish.json"
    }
  })