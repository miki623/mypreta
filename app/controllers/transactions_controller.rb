class TransactionsController < ApplicationController

  before_action :set_item, only:[:index, :create, :pay_item]

  def index
    @transaction = DealTransaction.new

  end

  def create
    @transaction = DealTransaction.new(transaction_params)
    if @transaction.valid?
      pay_item
      @transaction.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def transaction_params
    params.require(:deal_transaction).permit(:postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number).merge(item_id: @item.id, buyer_id: current_buyer.id, token: params[:token])
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
