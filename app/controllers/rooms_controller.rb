class RoomsController < ApplicationController
  
  before_action :authenticate_user!

  def room
    @user = current_user
    #@messages = Message.all
    @messages = Message.where(room_id: User.find(current_user.id).entries.first.room.id)
    @message = Message.new
  end

end