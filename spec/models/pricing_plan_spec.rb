require 'rails_helper'

RSpec.describe PricingPlan, type: :model do
    it "has a valid factory" do
        expect(FactoryGirl.create(:pricing_plan)).to be_valid 
    end
    
    it "is invalid without a name" do
        is_expected.to validate_presence_of(:name)
    end
    
    it "is invalid without a price" do
        is_expected.to validate_presence_of(:price)
    end
    
    it "is invalid without a state" do
        is_expected.to validate_presence_of(:state)
    end
end
