App.room = App.cable.subscriptions.create "ChatChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    alert data['message']

  put_message: () ->
    @perform('put_message')
    return

  speak: (message)->
    @perform 'speak', message: message