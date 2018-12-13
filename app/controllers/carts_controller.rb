class CartsController < ApplicationController
	def add_item
		quantity = params[:quantity]
		if quantity.to_i > 0 
			@meal = params[:id]
			current_cart.push(quantity: quantity,meal: @meal)
		end
		respond_to do |format|
			format.js {render inline: "location.reload();" }
		end
	end

	def delete_item
		@meal = params[:id]
		session[:cart].delete_if{| x | x["meal"] == @meal}
		respond_to do |format|
			format.js {render inline: "location.reload();" }
		end

	end
	
	private

	def current_cart
		session[:cart] ||= []
	end
end
