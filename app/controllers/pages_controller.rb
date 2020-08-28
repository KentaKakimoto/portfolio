class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show]
  include Pagy::Backend
  def index
     @pagy, @users = pagy(User.all)
  end

  
end
