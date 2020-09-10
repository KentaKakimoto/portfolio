class RoomsController < ApplicationController
before_action :authenticate_user!, :only => [:create, :show, :index] 
  def index
    @entries = current_user.entries
    @rooms = current_user.rooms.includes(:messages).order("messages.updated_at desc")
  end
  
  def create
    @room = Room.create
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.messages
      @messages_read_flag = Message.where.not(user_id: current_user).where(room_id: @room.id)
      @messages_read_flag.each do |message|
       if message.read_flag == false
        message.read_flag = true
       end
       message.save
      end
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
end