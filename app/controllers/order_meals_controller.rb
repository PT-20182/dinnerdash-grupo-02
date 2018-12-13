class OrderMealsController < ApplicationController
	before_action :verify_user
	before_action :verify_acess, only:[:show, :edit,:update]
	before_action :verify_cart
	def verify_acess
		redirect_to root_path
	end
	def verify_cart
		if session[:cart] == nil or session[:cart] == []
			redirect_to root_path, alert: "pedido vazio!"
		end
	end

	def verify_user

    if (user_signed_in? == false)
      redirect_to root_path, alert: "voce deve estar logado"

    end

  end

	def index
	  @order_meals = OrderMeal.all
	end
  
	def show
	end
  
	def new
		@order_meal = OrderMeal.new
	end
	
	def create_order
		@order = Order.new
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
		session[:cart] = nil
    redirect_to pedidos_path

	end


	def create
	  order_meal = OrderMeal.new(order_meal_params)
	  
	  redirect_to order_meals_path
	end
	
	def edit
	end
  
	def update
	  @order_meal.update(order_meal_params)
  
	  redirect_to order_meals_path
	end
  
	def destroy 
	  @order_meal.destroy
  
	  redirect_to order_meals_path
	end
	
	private
  
	def order_meal_params
	  params.require(:order_meal).permit(:quantity, :order_id, :meal_id)
	end
  
	def current_meal
	  @order_meal = OrderMeal.find(params[:id])
	end
end
