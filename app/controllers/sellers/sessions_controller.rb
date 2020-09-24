class Sellers::SessionsController < Devise::SessionsController
  def new_guest
    seller = Seller.guest
    sign_in seller
    redirect_to root_path
  end
end