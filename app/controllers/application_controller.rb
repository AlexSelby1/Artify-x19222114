class ApplicationController < ActionController::Base
  
protect_from_forgery with: :exception

before_action :configure_permitted_parameters, if: :devise_controller?


def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password, :userImage])
  devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :seller, :userImage]) 
  devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password, :seller, :userImage])
end
end