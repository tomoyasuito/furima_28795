class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: :index
  def index
    @item = Item.find(params[:item_id])
    @purchase = AddressPurchase.new
  end

  def create
    @purchase = AddressPurchase.new(purchases_params)
     if @purchase.valid?
      pay_item
       @purchase.save
       return redirect_to root_path
     else
      @item = Item.find(params[:item_id])
      @purchase
      render "index"
     end
  end

  private

  def purchases_params
    params.permit(:post_code, :city, :prefecture_id, :building_name, :phone_number, :address, :purchase, :price).merge(user_id: current_user.id).merge(item_id: params[:item_id]).merge(token: params[:token])
  end
  
  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchases_params[:token],
      currency:'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
     if @item.purchase != nil || current_user.id != @item.user_id 
        redirect_to root_path
     end
   end
end
