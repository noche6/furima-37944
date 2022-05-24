class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new( items_params )
    if  @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def items_params
    params.require(:item).permit(:price, :item_name, :description, :image, :category_id,:situation_id,:burden_id,:prefectures_id,:delivery_id).merge(user_id: current_user.id)
  end

end
