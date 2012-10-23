class Product < ActiveRecord::Base
  belongs_to :user
  has_many :paintings
  	
  attr_accessible :color, :description, :material, :picture, :quantity, :refund_policy, :size, :title, :user_id
  attr_accessible :name, :image
  attr_accessible :tag_list
  
  acts_as_taggable
  
  
  
end
