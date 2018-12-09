class HomesController < ApplicationController
	def index
		@meals = Meal.all
		@categories = Category.all
		@order_meals = current_order.order_meals
		
	end
end
