class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def check_is_admin
  	if current_user.is_admin
  		return true
  	else
  		redirect_to root_path, notice:"the page you are looking for doesnt exist"
  	end
  end
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys:[:username, :moblie, :gender, :dob])
  	
  end

end
