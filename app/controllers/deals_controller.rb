class DealsController < ApplicationController

  before_action :set_user

  def show
    @item = Item.find(params[:item_id])
    @deal = Deal.find(params[:id])
    @comment = Comment.new
    @comments = @deal.comments.includes(:seller, :buyer)
    transactions = Transaction.joins(:deal)
    @transaction = transactions.find(params[:id])


    unless (current_seller == @deal.seller) || (current_buyer == @deal.buyer)
      redirect_to root_path
    end
  end

  private

  def set_user
    if seller_signed_in?
      @seller = current_seller
    elsif buyer_signed_in?
      @buyer = current_buyer
    end
  end

end
