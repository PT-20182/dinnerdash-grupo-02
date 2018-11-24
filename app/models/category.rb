class Category < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2}
    validates :name, uniqueness: true
    has_many :meals
end
