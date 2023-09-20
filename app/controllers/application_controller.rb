class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    categories_index_path # Redirect to categories#index
  end

  protected

  # Override Devise's authenticate_user! method to allow access to the login form
  def authenticate_user!
    return if user_signed_in?

    super
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:fullname])
  end
end
