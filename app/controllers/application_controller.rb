class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  protected

  def configure_permitted_parameters
    added_attrs = [ :username, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
   	devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
  end

  def set_search
    @q = Hotel.ransack(params[:q])
    @hotels = @q.result(distinct: true)
  end
end
