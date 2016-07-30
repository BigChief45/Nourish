desc "Create Monday breakfasts orders"
task :create_monday_breakfast_orders => :environment do
    puts "Creating Monday breakfast orders..."
    @users = User.all
    
    
    @users.each do |user|
        # Use the user's active meal plan, if there is one
        @meal_plan = user.active_meal_plan
        
        if !@meal_plan.blank?
            # Create the order for the Monday Breakfast meal
            Order.create(token: SecureRandom.urlsafe_base64(16), user: user, meal_plan: @meal_plan, meal: @meal_plan.monday_breakfast_meal)
        end
    end
    
    puts "DONE!"
end