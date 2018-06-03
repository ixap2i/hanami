class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    current_user.appear
  end

  def unsubscribed
    current_user.disappear
    # Any cleanup needed when channel is unsubscribed
  end


  def appear(data)
    current_user.appear on: data['appearing_on']
  end

  def away
    current_user.away
  end
  # def create_message(data)
  #   ActionCable.server.broadcast 'all', {name: current_user.name,
  #     content: data['message']}
  # end

  # def put_message
  #   ChatChannel.broadcast_to('message', 'hello')
  # end
  def speak(data)
    Message.create! message: data['message']
    ActionCable.server.broadcast "room_channel", message: data
  end


end
