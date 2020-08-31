class ItemsController < ApplicationController

  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def destoroy
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :postage_id, :area_id ,:category_id, :status_id, :price, :shipping_charges_id, :info).merge(user_id: current_user.id)
  end
end
