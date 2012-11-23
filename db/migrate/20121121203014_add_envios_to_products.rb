class AddEnviosToProducts < ActiveRecord::Migration
  def change
    add_column :products, :envio_int, :decimal
    add_column :products, :cp, :string
    add_column :products, :peso, :int
    add_column :products, :alto, :int
    add_column :products, :largo, :int
    add_column :products, :ancho, :int
  end
end
