class Ability
  include CanCan::Ability
 
  def initialize(user)

    user ||= User.new # guest user

    if user.role? :admin
      can :manage, :all
    elsif user.role? :designer
      #can :update, User, :id => user.id  #Edit its profile info
      can :manage, :all
    end
  end
end