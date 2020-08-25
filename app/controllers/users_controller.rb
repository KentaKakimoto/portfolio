class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  # マイページ
  def show
    @user = User.find(params[:id])
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