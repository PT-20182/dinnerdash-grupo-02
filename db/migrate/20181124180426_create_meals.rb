class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.float :price
      t.boolean :available

      t.timestamps
    end
  end
end
