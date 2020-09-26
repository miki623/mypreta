class DealsController < ApplicationController

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


end
