$ ->
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
  $("#all_tags").on "click", ->
    if $("#all_tags").text() is "Show more"
      $("#tag_bar").children(".hide_again").removeClass "tag_hidden"
      $("#all_tags").text "Show less"
    else
      $("#tag_bar").children(".hide_again").addClass "tag_hidden"
      $("#all_tags").text "Show more"

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