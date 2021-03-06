window.sumo_action = ->
  if $("#sumo_action")
    if $(".alert-dismissable").hasClass("alert-success")
      window.sumo_animation_success()
    else if $(".alert-dismissable").hasClass("alert-danger")
      window.sumo_animation_error()
  return

window.sumo_animation_success = ->
  $("<audio id='sumo_stomp'><source src='https://drunken-bartender.s3.amazonaws.com/misc/development/sumo_stomp.mp3' type='audio/mpeg'></audio>").appendTo "body"
  $("#sumo_stomp")[0].play()
  $("#sumo_action").show()
  $("#sumo_action").addClass("go").delay(300).queue (next) ->
    $("#sumo_action").removeClass "error"
    $("#sumo_action").addClass("back").delay(400).queue (next) ->
      $("#container").effect "shake",
        direction: "down"
        distance: "10"

      $("#sumo_hai").show().delay(700).queue (next) ->
        $("#sumo_action").fadeOut()
        next()
        return
      next()
      return
    next()
    return

window.sumo_animation_error = ->
  $("<audio id='sumo_error'><source src='https://drunken-bartender.s3.amazonaws.com/misc/development/sumo_error.mp3' type='audio/mpeg'></audio>").appendTo "body"
  $("#sumo_error")[0].play()
  $("#sumo_action").show()
  $( "#container" ).animate({backgroundColor: "#a94442"});
  $("#sumo_action").effect("shake").delay(300).queue (next) ->
    $("#sumo_no").show().delay(700).queue (next) ->
      $("#sumo_action").fadeOut()
      $("#container").animate({backgroundColor: "white"}).queue (next) ->
        $("#container").removeAttr("style")
        next()
        return
      next()
      return
    next()
    return

window.toggle_order_item = (element) ->
  $(element).next().toggle()
  sub_element = $(element).children('.toggle_icon')
  if $(sub_element).hasClass('glyphicon-chevron-up')
    sub_element.removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down')
  else
    sub_element.removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up')    

window.toggle_stats = ->
  $('#dashboard').children('.stats').toggle()
  if $('#dashboard').find('.toggle_icon').hasClass('glyphicon-chevron-up')
      $('#dashboard').find('.toggle_icon').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down')
  else
    $('#dashboard').find('.toggle_icon').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up')

window.product_quicksearch = ->
  $('.order_item_name').each (index,element) ->
    keyword = $('#quicksearch').val().toLowerCase().trim();
    sub_content = $(element).html().toLowerCase();

    if(!keyword)
      $(element).parent().parent().show()
    else if(sub_content.search(keyword) > -1 ) 
      $(element).parent().parent().show()
    else
      $(element).parent().parent().hide()

  $('.product_group').each (index,element) ->
    if (!$('#quicksearch').val().trim())
      $(element).show()
    else if($(element).find('.inline-block:visible').length > 0)
      $(element).show()
    else
      $(element).hide()


