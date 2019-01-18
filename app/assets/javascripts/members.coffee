# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('body').on 'click', '#update_card_id', ->
    $.ajax(url: '/lock/last_card_id', cache: false, type: 'GET', dataType: 'JSON').done (json) ->
      $('#member_card_id').val(json.last_card_id)
    return false
