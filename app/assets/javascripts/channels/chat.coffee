App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log data['message'] #logs on all channel consumers

  speak: (message) ->
    @perform 'speak', message: message


$(document).on 'keypress', '[data-behavior="chat_speak"]', (event) ->
  if event.keyCode is 13
    # console.log event.target.value #logs only on the user console
    App.chat.speak event.target.value
    event.target.value = ""
    event.preventDefault()
