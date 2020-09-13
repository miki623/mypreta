class SellersController < ApplicationController
  @item = Item.find(params[:id])
  @user = @item.user
  @items = Item.where(user_id: @user.id)
end
