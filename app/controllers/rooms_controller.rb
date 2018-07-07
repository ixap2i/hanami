class RoomsController < ApplicationController
  def show
    # @room = Room.find(params[:id])
    @messages = Message.order(created_at: :desc).limit(10)
    # @messages = @room.messages
  end

  # def create
  #   ActionCable.server.broadcast "rooms",
  #     body: params[:message][:body],
  #     username: params[:message][:username]

  #   head :ok
  # end
end
