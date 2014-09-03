class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all
    elsif user.role? :member
     can :read, :all
      can :create, :all
     else
      can :create, User
      can :read, :all 
    end
  end
end