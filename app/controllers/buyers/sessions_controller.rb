class Buyers::SessionsController < Devise::SessionsController
  def new_guest
    buyer = Buyer.guest
    sign_in buyer
    redirect_to root_path
  end
end