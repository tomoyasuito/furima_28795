class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = AddressPurchase.new
  end

  def create
    #binding.pry
    @purchase = AddressPurchase.new(purchases_params)
    #binding.pry
     if @purchase.valid?
      pay_item
       @purchase.save
       return redirect_to root_path
     else
      render "index"
     end
  end

  private

  def purchases_params
    params.permit(:post_code, :city, :prefecture_id, :building_name, :phone_number, :address, :purchase, :price).merge(user_id: current_user.id).merge(item_id: params[:item_id]).merge(token: params[:token])
   #item: purchases_params[:item_id]
  end
  
  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_402b70b7b2ba2f0c988e5668" #テスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: purchases_params[:token],
      currency:'jpy'
    )
  end
end
