# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#memberships').DataTable()
  
$(document).ready ->
  $('#member a.add_fields').data('association-insertion-position', 'before').data 'association-insertion-node', 'this'
  $('#member').bind 'cocoon:after-insert', ->
    $('#member_from_list').hide()
    $('#member a.add_fields').hide()
    return
  $('#member').bind 'cocoon:after-remove', ->
    $('#member_from_list').show()
    $('#member a.add_fields').show()
    return
  return
