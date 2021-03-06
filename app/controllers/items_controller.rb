class ItemsController < ApplicationController

  before_action :set_item, only:[:show, :edit, :confirmation, :destroy, :update]
  before_action :search_item, only:[:index, :search, :show]

  def index
    @items = Item.all

    @category1 = Category.find(1)
    @category2 = Category.find(2)
    @category3 = Category.find(3)
    @category4 = Category.find(4)
  end

  def new
    if seller_signed_in?
      @item = Item.new
    else
      redirect_to new_seller_registration_path
    end
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
    @seller = @item.seller
    @p = @item.price.to_s.reverse.gsub( /(\d{3})(?=\d)/, '\1,').reverse
  end

  def edit
    if @item.seller.id != current_seller.id
      redirect_to :show
    end

  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def confirmation
    @seller = @item.seller
    @p = @item.price.to_s.reverse.gsub( /(\d{3})(?=\d)/, '\1,').reverse
  end

  def destroy
    @seller = @item.seller
    if @item.seller.id == current_seller.id
      @item.destroy
      redirect_to seller_path(@seller)
    else
      render :show
    end
  end

  def search
    @results = @i.result.order("created_at DESC")
  end

  private

  def item_params
    params.require(:item).permit(:image, :overview, :info, :category_id, :delivery_fee_id, :shipping_area_id, :price).merge(seller_id: current_seller.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def search_item
    @i = Item.ransack(params[:q])
  end

end
