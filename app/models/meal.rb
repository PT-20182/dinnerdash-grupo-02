class Meal < ApplicationRecord
    belongs_to :category , required: false
    has_one_attached :image
end
