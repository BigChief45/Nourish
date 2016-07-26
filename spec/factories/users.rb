FactoryGirl.define do
    factory :user do
        email { Faker::Internet.email }
        password "password"
        password_confirmation "password"
        pricing_plan { FactoryGirl.create(:pricing_plan) }
    end
    
    trait :user do
      after(:create) {|user| user.add_role(:user)}
    end
    
    trait :admin do
      after(:create) {|user| user.add_role(:admin)}
    end
    
    trait :chef do
      after(:create) {|user| user.add_role(:chef)}
    end

end
