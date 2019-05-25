class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    
    if user.nil?
        can [:index, :politica, :show], :all
        can :read, ActiveAdmin::Page, name: 'Dashboard'
    elsif user.role == 'admin'
        can [:manage], :all
    elsif user.player?
        can [:index, :user_calendar, :show], :all
        can [:edit, :create, :destroy, :update], UserActivity, user_id: user.id
        can [:update_calendar], :all, user_id: user.id
        can [:create], Activity, user_id: user.id
        can [:update, :edit], Activity, owner_id: user.id
        can [:manage], [Billing, PromoteActivity], user_id: user.id
        can [:create,:destroy], Contact, user_id: user.id
        can [:show], Collection
        can [:create, :destroy], UserCollection, user_id: user.id
        can :read, ActiveAdmin::Page, name: 'Dashboard'
        
        

    end
        
        



    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
