class MessagesController < ApplicationController
  
  before_action :authenticate_user!

  def create
    message = Message.new(message_params)
    message.user_id = current_user.id
    if message.save
      @message = Message.new()
      @messages = Message.where(room_id: User.find(current_user.id).entries.first.room.id)
      @room = User.find(current_user.id).entries.first.room
      @room_id = @room.id
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  
  def message_params
    params.require(:message).permit(:room_id, :body)
  end
end 