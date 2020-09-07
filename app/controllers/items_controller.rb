class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :edit]
  before_action :set_item, only: [:edit ,:update,:show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
    redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    item = Item.find(params[:id])
    if item.destroy
       redirect_to root_path
    else
      render :show
    end
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

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
