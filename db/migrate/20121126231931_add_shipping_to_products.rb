class AddShippingToProducts < ActiveRecord::Migration
  def change
    add_column :products, :shipping, :decimal
  end
end
