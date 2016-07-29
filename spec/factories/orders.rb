FactoryGirl.define do
    factory :order do
        user { FactoryGirl.create(:user, :user) }
        meal { FactoryGirl.create(:meal) }
        meal_plan { FactoryGirl.create(:meal_plan, user: user) }
        status 1
        token SecureRandom.urlsafe_base64(16)
    end
end
