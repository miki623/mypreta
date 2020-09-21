class BuyersController < ApplicationController

  before_action :set_buyer
  before_action :set_user


  def show
    @deals = @buyer.deals.all.order("created_at DESC")
    transactions = Transaction.joins(:deal)
    @transaction = transactions.find(params[:id])
  end

  private


  def set_buyer
    @buyer = Buyer.find(params[:id])
  end

  def set_user
    if seller_signed_in?
      @seller = current_seller
    elsif buyer_signed_in?
      @buyer = current_buyer
    end
  end


end
