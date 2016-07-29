FactoryGirl.define do
    factory :meal_plan do
        name 'Ultimate Cuts'
        user { FactoryGirl.create(:user, :user) }

        monday_breakfast_meal_id 1
        monday_lunch_meal_id 1
        monday_dinner_meal_id 1
        
        tuesday_breakfast_meal_id 1
        tuesday_lunch_meal_id 1
        tuesday_dinner_meal_id 1
        
        wednesday_breakfast_meal_id 1
        wednesday_lunch_meal_id 1
        wednesday_dinner_meal_id 1
        
        thursday_breakfast_meal_id 1
        thursday_lunch_meal_id 1
        thursday_dinner_meal_id 1
        
        friday_breakfast_meal_id 1
        friday_lunch_meal_id 1
        friday_dinner_meal_id 1
    end
    
    factory :invalid_meal_plan, parent: :meal_plan do
        name nil 
    end
end
