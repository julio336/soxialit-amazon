class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :color
      t.string :material
      t.string :picture
      t.string :refund_policy
      t.string :size
      t.integer :quantity
      t.integer :user_id

      t.timestamps
    end
    add_index :products, :user_id
  end
end
