class ItemsController < ApplicationController


  def index
    @items = Item.all

    @category1 = Category.find(1)
    @category2 = Category.find(2)
    @category3 = Category.find(3)
    @category4 = Category.find(4)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @p = @item.price.to_s.reverse.gsub( /(\d{3})(?=\d)/, '\1,').reverse
  end


  private

  def item_params
    params.require(:item).permit(:image, :overview, :info, :category_id, :delivery_fee_id, :shipping_area_id, :price).merge(seller_id: current_seller.id)
  end

end
