class Situation < ApplicationRecord
    validates :status, presence: true, numericality: { greater_than: 0 }
    has_many :orders

end
