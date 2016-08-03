class Ability
    include CanCan::Ability

    def initialize(user)
        user ||= User.new # guest user (not logged in)
        
        # Administrators
        if user.has_role? :admin
            can :manage, :all
            
        # Regular Users
        elsif user.has_role? :user
            can :manage, MealPlan
            can :read, Meal
            
            can :create, MealReview
        # Guest
        else
            can :read, Meal
        end
    end
    
end
