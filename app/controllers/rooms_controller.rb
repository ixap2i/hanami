class RoomsController < ApplicationController
  def show
    # ActionCable.server.broadcast('chat_channel', @room.message)
    # ChatChannel.broadcast_to('message', 'hello')
    @messages = Message.all
  end
end
