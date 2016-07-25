require 'rails_helper'

RSpec.describe MealPlan, type: :model do

    it "has a valid factory" do
        FactoryGirl.create(:meal_plan).should be_valid
    end
    
    it "is invalid without a name" do
        FactoryGirl.build(:meal_plan, name: nil).should_not be_valid
    end

end
