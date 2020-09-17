class DealsController < ApplicationController
  def show
    @item = Item.find(params[:item_id])
    @deal = Deal.find(params[:id])
    @comment = Comment.new
    @comments = @deal.comments
  end
end
