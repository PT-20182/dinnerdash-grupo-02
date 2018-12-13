class Order < ApplicationRecord
    validates :price, presence: true, numericality: { greater_than: 0 }
    belongs_to :situation
    has_many :order_meals
    belongs_to :user
    #before_create :set_order_status
    before_save :update_subtotal


    def subtotal
        order_meals.collect {|x| x.valid ? (x.quantity * x.unit_price) : 0}.sum
    end

    private 
        def set_order_status
            self.situation_id = 1
        end

    def update_subtotal
        self[:price] = price
    end

end
