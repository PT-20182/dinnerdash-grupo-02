class AddSittuationToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :situation, foreign_key: true
  end
end
