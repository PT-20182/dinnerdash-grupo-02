class HomesController < ApplicationController
  def index
    @meals = Meal.all
    @categories = Category.all

  end
end
