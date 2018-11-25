class AddMealToOrderMeals < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_meals, :meal, foreign_key: true
  end
end
