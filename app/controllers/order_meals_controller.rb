class OrderMealsController < ApplicationController
	before_action :current_order_meal, only:[:show, :edit, :update, :destroy]


	def index
	  @order_meals = Order_Meal.all
	end
  
	def show
	end
  
	def new
		@order_meal = Order_Meal.new
	end
  
	def create
	  order_meal = Order_Meal.create(order_meal_params)
	  
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
	  params.require(:order_meal).permit(:quantity)
	end
  
	def current_meal
	  @order_meal = Order_Meal.find(params[:id])
	end
end
