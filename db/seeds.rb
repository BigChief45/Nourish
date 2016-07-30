## Create Pricing Plans
PricingPlan.create(name: 'Basic', price: 100.00, state: 'active')

# Create Users
admin = User.new(first_name: 'Admin', last_name: 'User', address: 'California', email: 'admin@admin.com', password: '12345678', password_confirmation: '12345678', pricing_plan_id: PricingPlan.first.id)
admin.add_role :admin
admin.save

user = User.new(first_name: 'Test', last_name: 'User', address: 'New York', email: 'test@test.com', password: '12345678', password_confirmation: '12345678', pricing_plan_id: PricingPlan.first.id)
user.add_role :user
user.save

# Create Meals
## Seeds + Carrierwave: 
# - http://stackoverflow.com/questions/3910162/seeding-file-uploads-with-carrierwave-rails-3
# - https://github.com/carrierwaveuploader/carrierwave/wiki/How-to:-%22Upload%22-from-a-local-file
Meal.create(name: 'Chicken Paillard', 
    description: Faker::Lorem.paragraph(5), 
    calories: 800, 
    protein: 60, 
    fat: 36, 
    carbohydrates: 60, 
    image: Rails.root.join("app/assets/images/meals/chicken_paillard.jpg").open)
    
Meal.create(name: 'Tuscan Bean, Chicken, and Italian Sausage Soup', 
    description: Faker::Lorem.paragraph(5), 
    calories: 750, 
    protein: 40, 
    fat: 25, 
    carbohydrates: 90, 
    image: Rails.root.join("app/assets/images/meals/tuscan_pasta.jpg").open)
    
Meal.create(name: "Mom Moak's Chicken Noodle Soup", 
    description: Faker::Lorem.paragraph(5), 
    calories: 600, 
    protein: 20, 
    fat: 22, 
    carbohydrates: 40, 
    image: Rails.root.join("app/assets/images/meals/chicken_noodle_soup.jpg").open)

Meal.create(name: 'Meatball Nirvana',
    description: Faker::Lorem.paragraph(5),
    calories: 900,
    protein: 35,
    fat: 40,
    carbohydrates: 30,
    image: Rails.root.join("app/assets/images/meals/meatball_nirvana.jpg").open)

Meal.create(name: 'Swedish Meatball Casserole',
    description: "A rich and filling casserole that DOESN'T use chicken! A Home-Cooking favorite that's sure to please the whole family! Serve with your favorite vegetable side dish and enjoy!",
    calories: 1300,
    protein: 60,
    fat: 90,
    carbohydrates: 70,
    image: Rails.root.join("app/assets/images/meals/swedish_meatball_casserole.jpg").open)
    
Meal.create(name: 'Greek Lemon Chicken and Potato Bake',
    description: Faker::Lorem.paragraph(4),
    calories: 1000,
    protein: 90,
    fat: 80,
    carbohydrates: 100,
    image: Rails.root.join("app/assets/images/meals/greek_lemon_chicken.jpg").open)
    
Meal.create(name: 'Crispy Chicken Nuggets',
    description: Faker::Lorem.paragraph(3),
    calories: 600,
    protein: 35,
    fat: 40,
    carbohydrates: 20,
    image: Rails.root.join("app/assets/images/meals/crispy_chicken_nuggets.jpg").open)
    
Meal.create(name: "Chef John's Gazpacho",
    description: Faker::Lorem.paragraph(4),
    calories: 550,
    protein: 25,
    fat: 20,
    carbohydrates: 30,
    image: Rails.root.join("app/assets/images/meals/chef_johns_gazpacho.jpg").open)
    
## Meal Reviews
Meal.all.each do |meal|
    Faker::Number.between(1, 5).times do
        review = meal.meal_reviews.build(comment: Faker::Lorem.paragraph(5), rating: Faker::Number.between(1, 5), user_id: User.first)
        
        review.save
    end
end

## Create Meal Plans
meal_plan = user.meal_plans.build(name: 'Summer Diet Plan', monday_breakfast_meal: Meal.first, monday_lunch_meal: Meal.last, monday_dinner_meal: Meal.second)
user.active_meal_plan = meal_plan
meal_plan.save
current_user.save

## Create Orders [ONLY FOR DEVELOPMENT ENVIRONMENT]
if Rails.env == "development"
    Order.create(token: SecureRandom.urlsafe_base64(16), user: user, meal_plan: meal_plan, meal: meal_plan.monday_breakfast_meal)
end