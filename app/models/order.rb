class Order < ApplicationRecord
    has_one :situation
    has_many :order_meals
    belongs_to :user
    before_create :set_order_status
    before_save :update_subtotal


    def subtotal
        order_meals.collect {|x| x.valid ? (x.quantity * x.unit_price) : 0}.sum
    end

    private 
        def set_order_status
            self.situation_id = 1
        end

    def update_subtotal
        self[:subtotal] = subtotal
    end

end
