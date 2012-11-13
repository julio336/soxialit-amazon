class Product < ActiveRecord::Base
  belongs_to :user
  has_many :paintings
  
  attr_reader :tag_list
  attr_accessible :color, :description, :material, :picture, :quantity, :refund_policy, :size, :title, :user_id
  attr_accessible :name, :image
  attr_accessible :tag_list
 # validates :color, :description, :tag_list, :material, :quantity, :refund_policy, :size, :title, :presence => true, :allow_blank => true, :on => :update
 # validates :color, :description, :material, :title, :refund_policy, :format => {:with => /^[a-zA-Z\d\s]*$/}
  acts_as_taggable
  
  has_reputation :votes, source: :user, aggregated_by: :sum
  
  def mercadopago_url(datos)
     client_id = '4268569064335968'
     client_secret = 'pa6nV2JXuGee00YUoXaHsI3fPGhUfNTc'
     mp_client = MercadoPago::Client.new(client_id, client_secret)
     payment = mp_client.create_preference(datos) 
   end
  
end
