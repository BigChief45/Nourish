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
        
    # Pricing Plan
    it "is invalid without a pricing plan"
    
    it "is invalid with a non existing pricing plan"
end
