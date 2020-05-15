class ApplicationController < ActionController::Base
  layout 'application'
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :organization_id,  :email, :password, :current_password])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :organization_id,  :email, :password, :current_password])
    else
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :current_password])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :current_password])
    end
  end
end
