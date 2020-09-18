class TransactionsController < ApplicationController

  before_action :set_item, only:[:index, :create, :pay_item]

  def index
    if buyer_signed_in?
      @transaction = DealTransaction.new
    else
      redirect_to new_buyer_registration_path
    end
  end

  def create
    @transaction = DealTransaction.new(transaction_params)
    if @transaction.valid?
      pay_item
      @transaction.save
      # redirect_to item_transaction_path(@item, @transaction)
      @buyer = current_buyer
      redirect_to buyer_path(@buyer)

    else
      render :index
    end
  end

  def show
    @item = Item.find(params[:id])
    @transaction = DealTransaction.find(params[:id])
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def transaction_params
    params.require(:deal_transaction).permit(:postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number).merge(item_id: @item.id,seller_id: @item.seller_id, buyer_id: current_buyer.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

end
