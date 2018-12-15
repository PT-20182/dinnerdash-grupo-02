class CartsController < ApplicationController
	def add_item
		quantity = params[:quantity]
		if quantity.to_i > 0 
			@meal = params[:id]
			current_cart.push(quantity: quantity,meal: @meal)
		end
		redirect_to root_path
	end

	def delete_item
		@meal = params[:id]
		session[:cart].delete_if{| x | x["meal"] == @meal}
		redirect_to root_path

	end
	
	private

	def current_cart
		session[:cart] ||= []
	end
end
