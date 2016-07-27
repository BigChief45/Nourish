require 'rails_helper'

RSpec.describe User, type: :model do

    it "has a valid factory" do
        expect(FactoryGirl.create(:user)).to be_valid 
    end
    
    it "is invalid without an email" do
        expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
    end
    
    it "is invalid without a password" do
        expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
    end
    
    it "is invalid without matching passwords" do
        expect(FactoryGirl.build(:user, password: 'password', password_confirmation: 'please')).to_not be_valid
    end
    
    it "is invalid without a name" do
        expect(FactoryGirl.build(:user, first_name: nil)).to_not be_valid 
    end
    
    it "is invalid without a last name" do
        expect(FactoryGirl.build(:user, last_name: nil)).to_not be_valid 
    end
    
    it "returns the user's full name as a string" do
        user = FactoryGirl.create(:user, first_name: "John", last_name: "Doe")
        expect(user.name).to eq("#{user.first_name} #{user.last_name}")
    end
    
    it "is invalid without an address" do
        expect(FactoryGirl.build(:user, address: nil)).to_not be_valid 
    end
        
    # Pricing Plan
    it "is invalid without a pricing plan" do
        expect(FactoryGirl.build(:user, pricing_plan: nil)).to_not be_valid
    end
    
    it "is invalid with a non existing pricing plan"
    
end
