class CategoriesController < ApplicationController
  helper CategoriesHelper
  helper ApplicationHelper
  before_action :current_category, only:[:show, :edit, :update, :destroy]
  before_action :verify_user


	def verify_user

    if (user_signed_in? == false)
      redirect_to root_path, alert: "voce deve estar logado"
    elsif (current_user.admin == false)
      redirect_to root_path, alert: "voce não possui permissão"
    end

  end

  def index
    @meals = Meal.all
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
	  category = Category.create(category_params)
    if category.name.length <= 2
      redirect_to categories_path, alert: "nome invalido! pequeno demais"
    else
      redirect_to categories_path, notice: "Categoria criada com sucesso"
    end
  end

  def edit
  end

  def update
    @category.update(category_params)
    if @category.name.length <= 2
      redirect_to categories_path, alert: "nome invalido! pequeno demais"
    else
      redirect_to categories_path, notice: "Categoria atualizada com sucesso"
    end
  end

  def destroy
    meals = Meal.all
    meals.each do |meal|
      if meal.category_id == @category.id
        meal.destroy
      end
    end
    @category.destroy

    redirect_to categories_path, notice: "Categoria removida, com sucesso"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def current_category
    @category = Category.find(params[:id])
  end

end
