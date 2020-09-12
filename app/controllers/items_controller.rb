class ItemsController < ApplicationController
  def index
    @items = Item.all
    @category1 = Category.find(1)
    @category2 = Category.find(2)
    @category3 = Category.find(3)
    @category4 = Category.find(4)

  end
end
