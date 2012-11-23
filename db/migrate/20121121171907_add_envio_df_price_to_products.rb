class AddEnvioDfPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :envio_df, :decimal
  end
end
