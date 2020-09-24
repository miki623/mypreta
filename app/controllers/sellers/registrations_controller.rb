class Sellers::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only:[:destroy]

  def check_guest
    if resource.email == 'sellers_guest@example.com'
      redirect_to root_path
    end
  end

end