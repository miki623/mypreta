class CategoriesController < ApplicationController

  def show
    @items = Item.where(category_id: params[:id])
    @category = Category.find(params[:id])
  end



end
