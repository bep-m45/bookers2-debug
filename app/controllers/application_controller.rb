class ApplicationController < ActionController::Base
   protect_from_forgery with: :null_session
	#before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
   root_path
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "Signed out successfully."
    redairect_to root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
