class AddTipoEnvioToProducts < ActiveRecord::Migration
  def change
    add_column :products, :tipo_envio, :string
  end
end
