class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_many :products, :dependent => :destroy
  has_many :evaluations, class_name: "RSEvaluation", as: :source
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
          :username, :picture, :location, :website, :bio, :role_ids
  # attr_accessible :title, :body

  has_many :authentications, :dependent => :delete_all

  has_reputation :votes, source: {reputation: :votes, of: :products}, aggregated_by: :sum
  
  def voted_for?(haiku)
      evaluations.where(target_type: haiku.class, target_id: haiku.id).present?
  end

  def apply_omniauth(auth)
	  # In previous omniauth, 'user_info' was used in place of 'raw_info'
    self.username = auth['extra']['raw_info']['first_name']
    self.picture = auth['info']['image']
	  self.email = auth['extra']['raw_info']['email']
    self.password = Devise.friendly_token[0,20]
	  # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
	  authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
  end

  def role?(role)
    return self.roles.find_by_name(role).try(:name) == role.to_s
    #return self.roles.exists?(:name => role.to_s) #ALTERNATIVE
  end
end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  username               :string(255)
#  picture                :string(255)
#  location               :string(255)
#  website                :string(255)
#  bio                    :text