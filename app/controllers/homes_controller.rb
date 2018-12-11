class HomesController < ApplicationController
  def index
    @meals = Meal.all
    @categories = Category.all

  end

  def delete_meal
    redirect_to root_path, notice: "prato removido"
  end
end
