class CartsController < ApplicationController
	
	def add_item
		quatity = params[:quantity]
		@meal = params[:id]
		current_cart.push(quantity: quantity,meal: @meal)

		redirect_to root_path
	end

	def remove_item
		@meal = params[:id]
		session[:cart].delet(@meal)
		redirect_to root_path
	end

	private
	
	def current_cart
		session[:cart] || = []	
	end
end
