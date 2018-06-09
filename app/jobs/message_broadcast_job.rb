class MessageBroadcastJob < ApplicationJob
  queue_as :default
  
  def perform(message)
    RoomChannel.broadcast_to(message: render_message(message))
    binding.pry
    ActionCable.server.broadcast 'room_channel', message: render_message(message), locals: { message: message })
  end


  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    end
end
