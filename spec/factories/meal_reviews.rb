FactoryGirl.define do
    factory :meal_review do
        comment { Faker::Lorem.paragraph(5) }
        rating 4
        user { create(:user, :user) }
        meal { create(:meal) }
    end
    
    factory :invalid_meal_review, parent: :meal_review do
        comment nil 
    end
end
