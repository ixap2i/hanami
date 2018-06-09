class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'room_channel'
    ActionCable.server.broadcast "room_channel", message: data['message']
    # current_user.appear
  end

  def unsubscribed
    current_user.disappear
    # Any cleanup needed when channel is unsubscribed
  end


  def send_message(data)
    message = Message.create!(content: data['body'])
    ActionCable.server.broadcast('room_channel',
    message: render_message(message))

  end
  # def create_message(data)
  #   ActionCable.server.broadcast 'all', {name: current_user.name,
  #     content: data['message']}
  # end

  # def put_message
  #   ChatChannel.broadcast_to('message', 'hello')
  # end
  def speak(data)
    Message.create! content: data['message']
    ActionCable.server.broadcast "room_channel", content: data['message']
    binding.pry
  end

  private
  def render_message(message)
    ActionController.render(
      partial: 'messages/message',
      locals: { message: message }
    )
  end
end
