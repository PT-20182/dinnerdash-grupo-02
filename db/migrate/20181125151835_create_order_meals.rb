class CreateOrderMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :order_meals do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
