class ApplicationController < ActionController::Base
  layout 'application'
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :organization_id) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :organization_id,  :email, :password, :current_password) }
  end
end
