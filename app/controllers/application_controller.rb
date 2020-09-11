class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

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
end
