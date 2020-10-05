class ApplicationController < ActionController::Base
  # before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user

  private

  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
  #   end
  # end

  protected

  def configure_permitted_parameters
    if resource_class == Seller
      devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date, :jender, :info, :schedule])
    elsif resource_class == Buyer
      devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date, :jender])
    else
      super
    end
  end

  def set_user
    if seller_signed_in?
      @current_seller = current_seller
    elsif buyer_signed_in?
      @current_buyer = current_buyer
    end
  end
  
end
