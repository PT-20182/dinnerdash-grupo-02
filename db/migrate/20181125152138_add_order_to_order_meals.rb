class AddOrderToOrderMeals < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_meals, :order, foreign_key: true
  end
end
