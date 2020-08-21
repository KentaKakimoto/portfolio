class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  # マイページ
  def show
    @user = User.find(params[:id])
  end
  
  private

    def set_user
      @user = User.find(params[:id])
    end
end