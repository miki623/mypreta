class BuyersController < ApplicationController

  before_action :set_buyer


  def show
    @deals = @buyer.deals.all.order("created_at DESC")
  end

  private


  def set_buyer
    @buyer = Buyer.find(params[:id])
  end


end
