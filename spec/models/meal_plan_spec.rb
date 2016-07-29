require 'rails_helper'

RSpec.describe MealPlan, type: :model do

    # Attribute validations
    it "has a valid factory" do
        expect(FactoryGirl.create(:meal_plan)).to be_valid
    end
    
    it "is invalid without a name" do
        expect(FactoryGirl.build(:meal_plan, name: nil)).to_not be_valid
    end
    
    # Associations & Assocation Validations
    context "Associations" do
        before { FactoryGirl.create(:meal_plan) }
        
        it { is_expected.to(belong_to :user) }
        
        it { is_expected.to(validate_presence_of(:user)) }
    end
end
