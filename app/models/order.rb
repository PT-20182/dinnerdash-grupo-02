class Order < ApplicationRecord
    has_one :situation
    has_many :order_meals
    belongs_to :user
end
