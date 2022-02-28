class MessageBroadcastJob < ApplicationJob
    queue_as :default
  
    def perform(message)
      payload = {
        room_id: message.conversation.id,
        content: message.content,
        sender: message.sender,
        participants: message.conversation.users.collect(&:id)
      }
      ActionCable.server.broadcast(build_room_id(message.conversation.id), payload)
    end
    
    def build_room_id(id)
      "ChatRoom-#{id}"
    end
  end