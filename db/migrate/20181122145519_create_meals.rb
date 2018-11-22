class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.binary :image
      t.boolean :avaliable
      t.float :price

      t.timestamps
    end
  end
end
