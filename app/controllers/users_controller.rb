class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  # マイページ
  def show
    @user = User.find(params[:id])
    @user=User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
  
  def following
      @user  = User.find(params[:id])
      @users = @user.following_user
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.follower_user
    render 'show_follower'
  end
  
  
  
  private

    def set_user
      @user = User.find(params[:id])
    end
end