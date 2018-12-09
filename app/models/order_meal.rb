class OrderMeal < ApplicationRecord
    validates :quantity, presence: true, numericality: { only_integer:true, greater_than: 0 }
	belongs_to :meal
	belongs_to :order
end
