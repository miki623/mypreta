class Buyers::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only:[:destroy]


  def check_guest
    if resource.email == 'buyer_guest@example.com'
      redirect_to root_path
    end
  end

end