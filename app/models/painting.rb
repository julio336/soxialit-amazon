class Painting < ActiveRecord::Base
  attr_accessible :image, :name, :product_id
  mount_uploader :image, ImageUploader
  
  belongs_to :product
  
  validates_presence_of :image
  
end
