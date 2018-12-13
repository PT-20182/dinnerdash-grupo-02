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
    @soma=0
    session[:cart].each do |item|
      meal = Meal.find(item["meal"])
      quant = item["quantity"]

      @soma += quant.to_i * meal.price
    end
	  @order = Order.new(user_id: current_user.id, price: @soma, situation_id: 1)
    @order.save!

    session[:cart].each do |item|
      meal = Meal.find(item["meal"])
      quant = item["quantity"]
      @order_meal = OrderMeal.new(quantity: quant, order_id: @order.id, meal_id: meal.id)
      @order_meal.save!
    end
    redirect_to root_path
  end
  
  def edit
  end

  def update
    @order.update(order_params)

    redirect_to orders_path
  end

  def destroy 
    @order.destroy

    redirect_to orders_path
  end
  
  private

  def order_params
    params.require(:order).permit(:status)
  end

  def current_order
    @order = Order.find(params[:id])
  end
end
