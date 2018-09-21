class RemoveQuanityFromCartedProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :carted_products, :quanity, :integer
  end
end
