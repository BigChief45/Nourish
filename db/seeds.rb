## Create Pricing Plans
PricingPlan.create(name: 'Basic', price: 100.00, state: 'active')

# Create Users
admin = User.create(email: 'admin@admin.com', password: '12345678', password_confirmation: '12345678')
admin.add_role :admin

user = User.create(email: 'test@test.com', password: '12345678', password_confirmation: '12345678', pricing_plan_id: PricingPlan.first.id)
user.add_role :user

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