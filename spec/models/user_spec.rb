require 'rails_helper'

RSpec.describe User, type: :model do

    it "has a valid factory" do
        FactoryGirl.create(:user).should be_valid 
    end
    
    it "is invalid without an email" do
        FactoryGirl.build(:user, email: nil).should_not be_valid
    end
    
    it "is invalid without a password" do
        FactoryGirl.build(:user, password: nil).should_not be_valid
    end
    
    it "is invalid without matching passwords" do
        FactoryGirl.build(:user, password: 'password', password_confirmation: 'please').should_not be_valid
    end
        
    # Pricing Plan
    it "is invalid without a pricing plan"
    
    it "is invalid with a non existing pricing plan"
end
