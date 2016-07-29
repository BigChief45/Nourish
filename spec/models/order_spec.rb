require 'rails_helper'

RSpec.describe Order, type: :model do

    it "has a valid factory" do
        expect(FactoryGirl.create(:order)).to be_valid 
    end
    
    # Attribute Validations
    context "Attribute Validations" do
        it "should be invalid without a token string" do
            expect(FactoryGirl.build(:order, token: nil)).to_not be_valid
        end
        
        it "should be invalid without status" do
            expect(FactoryGirl.build(:order, status: nil)).to_not be_valid 
        end
        
        it { is_expected.to validate_uniqueness_of :token }
    end
    
    # Associations
    context "Associations" do
        
        it { is_expected.to belong_to :user }
        it { is_expected.to validate_presence_of :user }
        
        
        it { is_expected.to belong_to :meal_plan }
        it { is_expected.to validate_presence_of :meal_plan }
        
        it { is_expected.to belong_to :meal }
        it { is_expected.to validate_presence_of :meal }
        
    end
end
