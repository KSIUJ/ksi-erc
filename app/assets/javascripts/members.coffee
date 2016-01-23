# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('body').on 'click', '#update_card_id', ->
    card_id = $('#last_card_id').data("card-id")
    $('#member_card_id').val(card_id)
    return
  
$(document).ready ->
  $('#members').DataTable({
    "language": {
      "url": "//cdn.datatables.net/plug-ins/1.10.10/i18n/Polish.json"
    }
  })