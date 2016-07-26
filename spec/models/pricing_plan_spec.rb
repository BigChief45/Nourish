require 'rails_helper'

RSpec.describe PricingPlan, type: :model do
    it "has a valid factory" do
        expect(FactoryGirl.create(:pricing_plan)).to be_valid 
    end
    
    it "is invalid without a name" do
        expect(FactoryGirl.build(:pricing_plan, name: nil)).to_not be_valid 
    end
    
    it "is invalid without a price" do
        expect(FactoryGirl.build(:pricing_plan, price: nil)).to_not be_valid 
    end
    
    it "is invalid without a state" do
        expect(FactoryGirl.build(:pricing_plan, state: nil)).to_not be_valid 
    end
end
