class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = AddressPurchase.new
  end

  def create
    @purchase = AddressPurchase.new(purchases_params)
     if @purchase.valid?
       @purchase.save
       return redirect_to root_path
     else
      render "index"
     end
  end

  private

  def purchases_params
    params.require(:address_purchase).permit(:post_code, :city, :prefecture_id, :building_name, :phone_number, :address, :purchase)
  end
end
