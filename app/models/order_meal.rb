class OrderMeal < ApplicationRecord
	validades: :quantity precense: true, numericality: { only_integer:true, greater_than: 0 }

	belongs_to :meal
	belongs_to :order


	def unit_price
		if persisted?
			self[]
end
