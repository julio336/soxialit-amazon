class Painting < ActiveRecord::Base
  attr_accessible :image, :name, :product_id
  mount_uploader :image, ImageUploader
  
  belongs_to :product
end
