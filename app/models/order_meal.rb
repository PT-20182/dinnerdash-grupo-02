class OrderMeal < ApplicationRecord
	validates :quantity, presence: true, numericality: { only_integer:true, greater_than: 0 }
	validate :meal_present
	validate :order_present

	belongs_to :meal
	belongs_to :order


	def unit_price
		meal.price	
	end

	def total_price
		unit_price*quantity
	end

	private

	def meal_present
		if meal.nil?
		  errors.add(:meal, "is not valid or is not active.")
		end
	end
	
	def order_present
		if order.nil?
		  	errors.add(:order, "is not a valid order.")
		end
	end

end
