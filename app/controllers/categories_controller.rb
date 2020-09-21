class CategoriesController < ApplicationController

  before_action :set_user


  def show
    @items = Item.where(category_id: params[:id])
    @category = Category.find(params[:id])
  end

  private

  def set_user
    if seller_signed_in?
      @current_seller = current_seller
    elsif buyer_signed_in?
      @current_buyer = current_buyer
    end
  end


end
