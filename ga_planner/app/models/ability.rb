    class Ability
      include CanCan::Ability

      def initialize(user)
        user ||= User.new
        if user.role? :admin
          can :manage, :all
        elsif user.role? :member
         can :read, :all
         can :create, :all
        can :manage, User, id: user.id
         # can :manage, Course, user_id: user.id
         # can :manage, Contract, user_id: user.id

       else
         can :read, Course
         can :create, User
       end
      end
    end



#   def initialize(user)
#         user ||=User.new
#         if user.role? :admin # admin users
#             can :manage, :all
#             cannot :report, Comment

#         elsif user.persisted? # logged in users
#             can :read, User
            
#             can :read, Track
#             can :create, Track
#             can :manage, Track, user_id: user.id

#             can :create, Comment
#             can :destroy , Comment, user_id: user.id
#             can :report, Comment do |comment|
#               comment.user != user && !user.reported_comments.include?(comment)
#             end

#         else # non-logged-in users
#             can :read, User
#             can :read, Track
#         end
#     end
# end