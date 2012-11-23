class AddCpToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_cp, :text
  end
end
