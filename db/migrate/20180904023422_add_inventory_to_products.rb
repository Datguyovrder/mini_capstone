class AddInventoryToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :is_in_stock, :boolean
  end
end
