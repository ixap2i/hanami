class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from 'chat:message'
    stream_from 'chat_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def put_message
    ChatChannel.broadcast_to('message', 'hello')
  end

  def speak(data)
    ActionCable.server.broadcast 'chat_channel', message: data['message']
  end
end
