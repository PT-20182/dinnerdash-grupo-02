class OrderMealsController < ApplicationController
	before_action :current_order_meal, only:[:show, :edit, :update, :destroy]


	def index
		@order_meals = OrderMeal.all
	end

	def show
	end

	def new
	end

	def create
		@order = current_order
		@order_meal = @order.order_meals.new(order_meal_params)
		@order.save
		session[:order_id] = @order.id
	end

	def edit
	end

	def update
		@order = current_order
		@order_meal = @order.order_meals.find(params[:id])
		@order_meal.update_attributes(order_meals_params)
		@order_meals = @order.order_meals
	end

	def destroy 
		@order = current_order
		@order_meal = @order.order_meals.find(params[:id])
		@order_meal.destroy
		@order_items = @order.order_items
	end

	private

	def order_meal_params
		params.require(:order_meal).permit(:quantity, :meal_id)
	end
	
end
