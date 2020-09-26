class SellersController < ApplicationController
  
  before_action :set_seller

  
  def show
    @items = @seller.items
  end

  def history
    @deals = @seller.deals.all.order("created_at DESC")

  end

  private

  def set_seller
    @seller = Seller.find(params[:id])
  end

end
