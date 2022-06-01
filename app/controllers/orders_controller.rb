class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  def index
    @order_address = OrderAddress.new
    if (@item.order != nil) || (@item.user.id == current_user.id )
      redirect_to root_path
   
    end
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  private
  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefectures_id, :municipalities, :address, :building, :number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp.api_key = "sk_test_4886513ed51660c9baf93092"  
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],    
      currency: 'jpy'                 
    )
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end


end
