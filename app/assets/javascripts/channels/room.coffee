App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # alert "orx"

    # Called when the subscription has been terminated by the server

  received: (data) -> 
    # IDで振ってある要素の後ろにメッセージをdataパラメータ内のメッセージをappend
    $('#messages').append data['message']

  speak: (data) ->
    # channelコントローラにdataを丸ごと渡す、
    # パラメータからmessageだけを取り出す作業はchannelで処理する
    @perform 'speak', message: data

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()