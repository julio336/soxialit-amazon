class StaticPagesController < ApplicationController
  #before_filter :authenticate_user!  For Devise to work and only signin users can access
  #load_and_authorize_resource  CanCan authorization
  def home
  end
  
  def faq
  end
  
end