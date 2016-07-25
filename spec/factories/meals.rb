FactoryGirl.define do
    factory :meal do
        name 'Chicken Paillard'
        description { Faker::Lorem.paragraph(5) }
        calories { Faker::Number.number(3) }
        protein { Faker::Number.number(2) }
        fat { Faker::Number.number(2) }
        carbohydrates { Faker::Number.number(2) }
        image { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'app/assets/images/meals/chicken_paillard.jpg'))) }
    end
    
    
    factory :invalid_meal, parent: :meal do
        name nil
    end
end
