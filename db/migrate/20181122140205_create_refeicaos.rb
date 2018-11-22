class CreateRefeicaos < ActiveRecord::Migration[5.2]
  def change
    create_table :refeicaos do |t|
      t.string :name
      t.text :description
      t.float :price
      t.bytea :image
      t.boolean :avaliable

      t.timestamps
    end
  end
end
