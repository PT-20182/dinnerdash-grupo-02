class OrdersController < ApplicationController
  before_action :current_order, only:[:show, :edit, :update, :destroy]
  before_action :verify_user, only: [:index]
  
  
  def verify_user

    if (user_signed_in? == false)
      redirect_to root_path, alert: "voce deve estar logado"
    elsif (current_user.admin == false)
      redirect_to root_path, alert: "voce não possui permissão"
    end

  end

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    
  end
  
  def edit
    @situations = Situation.all
  end

  def update
    @order.update(order_params)

    redirect_to orders_path
  end

  def destroy
    orders = OrderMeal.all
    orders.each do |order|
      if order.order_id == @order.id
        order.destroy
      end
    end
    @order.destroy

    redirect_to orders_path
  end
  
  private

  def order_params
    params.require(:order).permit(:situation_id)
  end

  def current_order
    @order = Order.find(params[:id])
  end
end
