# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#book_leases').DataTable({
    "language": {
      "url": "//cdn.datatables.net/plug-ins/1.10.10/i18n/Polish.json"
    }
  })
  $('#book_lease_member_id').select2 theme: 'bootstrap'
  $('#book_lease_book_id').select2 theme: 'bootstrap'