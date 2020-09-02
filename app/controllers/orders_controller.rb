class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @purchase = ItemPurchase.new
  end

  def create
    @purchase = ItemPurchase.new(purchase_params)
    @purchase.save
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(:post_code, :city, :prefecture, :building_name, :phone_number, :address, :purchase)
  end
end
