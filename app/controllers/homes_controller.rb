class HomesController < ApplicationController
  def index
    @meals = Meal.all
    @categories = Category.all
    @users = User.all

  end
  def add_meal
    redirect_to root_path, notice: "prato adicionado ao carrinho"
  end
  def delete_meal
    redirect_to root_path, notice: "prato removido"
  end
end
