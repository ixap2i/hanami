class RoomsController < ApplicationController
  def show
    ChatChannel.broadcast_to('message', 'hello')
  end
end
