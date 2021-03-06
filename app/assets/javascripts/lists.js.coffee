$ ->
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

  #Show all tags button
  $("#all_tags").on "click", ->
    if $("#all_tags").text() is "Show all"
      $("#tag_bar").children(".hide_again").removeClass "tag_hidden"
      $("#all_tags").text "Show less"
    else
      $("#tag_bar").children(".hide_again").addClass "tag_hidden"
      $("#all_tags").text "Show all"

  # On show_list view
  if $("#player").length > 0
    #Youtube player
    window.index = 0
    jQuery("#player").tubeplayer
      width: 600 
      height: 450 
      allowFullScreen: "true" 
      initialVideo: gon.videos[window.index].yid 
      preferredQuality: "default" 
      showControls: true
      showRelated: false
      autoPlay: false
      autoHide: true
      theme: "light"
      annotations: false
      loop: 0
      onPlay: () -> # after the play method is called

      onPlayerPlaying: () -> #while player is playing
        selector = "#" + gon.videos[window.index].yid
        $(selector).addClass 'active_video'

      onPause: -> # after the pause method is called

      onStop: -> # after the player is stopped

      onSeek: (time) -> # after the video has been seeked to a defined point

      onMute: -> # after the player is muted

      onUnMute: -> # after the player is unmuted

      onPlayerEnded: () -> #after the player ends
        selector = "#" + gon.videos[window.index].yid
        $(selector).removeClass 'active_video'
        if window.index < gon.videos.length
          window.index += 1
          jQuery("#player").tubeplayer "play", gon.videos[window.index].yid
        else
          window.index = 0
          jQuery("#player").tubeplayer "stop"

    $("#add_video_field").on "click", ->
      $("#add_video_field").val ""

    $(".video_data").on "click", ->
      unless $(this).hasClass 'active_video'
        $('div[rel="' + window.index + '"]').removeClass 'active_video'
        window.index = parseInt $(this).attr("rel")
        jQuery("#player").tubeplayer "play", gon.videos[window.index].yid

    #Activate tooltips
    $(".playlist-fan-avatar").tooltip({})

    #Activate the scrolling list
    $("#playlist_box").perfectScrollbar({
      minScrollbarLength: 20,
      useBothWheelAxes: false,
      useKeyboard: true
      })

  #On new_list view
  if $("#tag_list").length > 0
    $("#tag_list").tokenInput "/tags/index.json",
      theme: "facebook"
      hintText: "Tipea un género musical o algo..."
      searchingText: "Buscando tags existentes..."
      preventDuplicate: true
      deleteText: "&#10060;"

    $("#tag_list").tokenInput "add",
      name: "algún estilo shuer loco"
        
