class RoomsController < ApplicationController
  def show
    # @room = Room.find(params[:id])
    @messages = Message.all
    # @messages = @room.messages
  end

  def create
    ActionCable.server.broadcast "rooms",
      body: params[:message][:body],
      username: params[:message][:username]

    head :ok
  end
end
