class HomesController < ApplicationController
  def index
    @meals = Meal.all
    @categories = Category.all
    @users = User.all
  end
  
end
