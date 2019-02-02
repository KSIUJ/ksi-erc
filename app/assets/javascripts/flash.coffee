$ ->
  alert_msg = $('#alert').val()
  if alert_msg
    M.toast({html: alert_msg, displayLength: 6000})
  notice_msg = $('#notice').val()
  if notice_msg
    M.toast({html: notice_msg})
