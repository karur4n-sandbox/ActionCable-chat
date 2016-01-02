App.room = App.cable.subscriptions.create "RoomChannel",
  collection: -> $("[data-channel='comments']")

  connected: ->
    # Called when the subscription is ready for use on the server
    setTimeout =>
      roomId = @collection().data('room-id')
      @perform 'follow', room_id: roomId
    , 1000

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    @collection().append('<li>' + data.comment + '</li>')

  speak: (comment) ->
    @perform 'speak', comment

$(document).on 'click', '[data-behavior~=speak_button]', (event) ->
  App.room.speak $('#comment-body').value
  event.preventDefault()
