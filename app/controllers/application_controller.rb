class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
    # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
      mypage_path(resource)
  end
  
  private
        def sign_in_required
            redirect_to new_user_session_url unless user_signed_in?
        end
        
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:profile_image,:self_introduction,:area,:genre,:age,:gender,:career,:country,:organization])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:profile_image,:self_introduction,:area,:genre,:age,:gender,:career,:country,:organization])
    end
end