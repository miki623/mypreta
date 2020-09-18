class SellersController < ApplicationController
  def show
    @seller = Seller.find(params[:id])
    @items = @seller.items
  end

  def history
    @seller = Seller.find(params[:id])
    @deals = @seller.deals.all

  end
end
