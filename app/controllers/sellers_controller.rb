class SellersController < ApplicationController
  
  before_action :set_seller
  before_action :set_user

  
  def show
    @items = @seller.items
  end

  def history
    @seller = Seller.find(params[:id])
    @deals = @seller.deals.all.order("created_at DESC")

  end

  private

  def set_seller
    @seller = Seller.find(params[:id])
  end

  def set_user
    if seller_signed_in?
      @seller = current_seller
    elsif buyer_signed_in?
      @buyer = current_buyer
    end
  end

end
