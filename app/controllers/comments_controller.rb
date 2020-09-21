class CommentsController < ApplicationController

  before_action :set_item
  before_action :set_deal

  
  def create
    Comment.create!(comment_params)
    redirect_to item_deal_path(@item, @deal)
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_deal
    @deal = Deal.find(params[:deal_id])
  end

  def comment_params
    if current_buyer
      params.require(:comment).permit(:text, :image).merge(deal_id: @deal.id, buyer_id: current_buyer.id)
    elsif current_seller
      params.require(:comment).permit(:text, :image).merge(deal_id: @deal.id, seller_id: current_seller.id)
    end
  end

end
