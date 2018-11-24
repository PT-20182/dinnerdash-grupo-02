class MealsController < ApplicationController
	before_action :current_meal, only:[:show, :edit, :update, :destroy]


	def index
	  @meals = Meal.all
	end
  
	def show
	end
  
	def new
		@meal = Meal.new
		@categories = Category.All
	end
  
	def create
	  meal = Meal.create(meal_params)
	  
	  redirect_to meals_path
	end
	
	def edit
	end
  
	def update
	  @meal.update(meal_params)
  
	  redirect_to meals_path
	end
  
	def destroy 
	  @meal.destroy
  
	  redirect_to meals_path
	end
	
	private
  
	def meal_params
	  params.require(:meal).permit(:name,:description,:price,:available,:image)
	end
  
	def current_meal
	  @meal = Meal.find(params[:id])
	end
end
