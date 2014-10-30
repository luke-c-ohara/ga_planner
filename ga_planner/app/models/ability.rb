class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
      if user.role? :admin
        can :manage, :all
        can :read, :admins
      elsif user.role? :member
        can :read, :all
        cannot :read, :admin
        can :create, :all
        can :edit, User, id: user.id
      # can :manage, Course, user_id: user.id
      # can :manage, Contract, user_id: user.id
      else
        can :read, Course
        can :create, User
      end
  end
end

