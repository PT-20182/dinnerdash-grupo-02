class MealsController < ApplicationController
	before_action :current_meal, only:[:show, :edit, :update, :destroy]
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
		@meal = Meal.new
		@categories = Category.all
	end
  
	def create
		meal = Meal.create(meal_params)
		flag = 0
		alert ||= []
	  if meal.name.length <= 2
			alert.push("nome invalido! pequeno demais")
			flag = 1
		end
		if meal.price == nil 
			alert.push("preço invalido! campo vazio")
			flag = 1
		elsif meal.price <= 0
			alert.push("preço invalido! nao existe preço negativo")
			flag = 1
		end
		if meal.category  == nil
			alert.push("a refeição deve ter uma categoria")
			flag = 1
		end
		if meal.available == nil
			alert.push("marque a caixa de disponibilidade!")
			flag = 1
		end
		if flag == 0
			redirect_to meals_path, notice: "refeição criada com sucesso"
		else
			redirect_to meals_path, alert: alert
		end

	end
	
	def edit
		@categories = Category.all
	end
  
	def update
		@meal.update(meal_params)
		flag = 0
		alert ||= []
	  if @meal.name.length <= 2
			alert.push("nome invalido! pequeno demais")
			flag = 1
		end
		if @meal.price == nil 
			alert.push("preço invalido! campo vazio")
			flag = 1
		elsif @meal.price <= 0
			alert.push("preço invalido! nao existe preço negativo")
			flag = 1
		end
		if @meal.category  == nil
			alert.push("a refeição deve ter uma categoria")
			flag = 1
		end
		if @meal.available == nil
			alert.push("marque a caixa de disponibilidade!")
			flag = 1
		end
		if flag == 0
			redirect_to meals_path, notice: "refeição criada com sucesso"
		else
			redirect_to meals_path, alert: alert
		end
	end
  
	def destroy 
	  @meal.destroy
  
	  redirect_to meals_path, notice: "refeição removida com sucesso"
	end
	
	private
  
	def meal_params
	  params.require(:meal).permit(:name,:description,:price,:available,:image,:category_id)
	end
  
	def current_meal
	  @meal = Meal.find(params[:id])
	end
end
