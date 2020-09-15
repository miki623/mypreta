class BuyersController < ApplicationController

  def show
    # binding.pry
    @buyer = Buyer.find(params[:id])
    # deals = @buyer.deal_ids
    @deals = @buyer.deals.all
  end
end
