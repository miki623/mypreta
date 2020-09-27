class CategoriesController < ApplicationController

  def show
    @items = Item.where(category_id: params[:id]).includes(:seller)
    @category = Category.find(params[:id])
  end



end
