class Product < ActiveRecord::Base
  belongs_to :user
  	
  attr_accessible :color, :description, :material, :picture, :quantity, :refund_policy, :size, :title, :user_id
end
