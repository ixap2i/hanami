class MessageBroadcastJob < ApplicationJob
  def perform(message)
    ActionCable.server.broadcast 'chat_channel', message: render_message(message)
  end

  def notification
    # Somewhere in your app this is called, perhaps from a NewCommentJob
    ActionCable.server.broadcast "web_notifications_#{current_user.id}", { title: 'New things!', body: 'All the news that is fit to print' }
  end
  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'rooms/messages', locals: { message: message })
    end
end
