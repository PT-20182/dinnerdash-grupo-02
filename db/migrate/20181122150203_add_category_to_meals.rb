class AddCategoryToMeals < ActiveRecord::Migration[5.2]
  def change
    add_reference :meals, :category, foreign_key: true
  end
end
