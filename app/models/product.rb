class Product < ActiveRecord::Base
  belongs_to :user
  has_many :paintings
  has_many :sizes
  
  attr_reader :tag_list
  attr_reader :size_tokens
  attr_reader :tag_tokens
  attr_accessible :color, :description, :material, :picture, :quantity, :refund_policy, :size, :title, :user_id, :brand, :price  
  attr_accessible :name, :image
  attr_accessible :tag_list
  attr_accessible :size_tokens
  attr_accessible :tag_tokens
  
  
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}, :on => :update
  validates :color, :description, :material, :quantity, :refund_policy, :title, :brand, :presence => { :message => "*dato requerido" }, :allow_blank => true, :on => :update
  #validates :description, :material, :title, :refund_policy, :format => {:with => /^[a-zA-Z\d\s]*$/}
  acts_as_taggable
  
  has_reputation :votes, source: :user, aggregated_by: :sum
  
  def mercadopago_url(datos)
     client_id = '4268569064335968'
     client_secret = 'pa6nV2JXuGee00YUoXaHsI3fPGhUfNTc'
     mp_client = MercadoPago::Client.new(client_id, client_secret)
     payment = mp_client.create_preference(datos) 
   end
   
   def size_tokens=(tokens)
       self.size_ids = Size.ids_from_tokens(tokens)
   end
   
  
end
