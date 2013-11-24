$ ->
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
  index = 0
  jQuery("#player").tubeplayer
    width: 600 
    height: 450 
    allowFullScreen: "true" 
    initialVideo: gon.videos[index].yid 
    preferredQuality: "default" 
    showControls: true
    showRelated: false
    autoPlay: true
    autoHide: true
    theme: "light"
    annotations: false
    loop: 0
    onPlay: () -> # after the play method is called

    onPause: -> # after the pause method is called

    onStop: -> # after the player is stopped

    onSeek: (time) -> # after the video has been seeked to a defined point

    onMute: -> # after the player is muted

    onUnMute: -> # after the player is unmuted

    onPlayerEnded: () -> #after the player ends
      if index < gon.videos.length
        index += 1
        jQuery("#player").tubeplayer "play", gon.videos[index].yid
      else
        index = 0
        jQuery("#player").tubeplayer "stop"


