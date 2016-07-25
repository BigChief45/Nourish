require 'rails_helper'

RSpec.describe MealReview, type: :model do
    
    it "has a valid factory" do
        expect(FactoryGirl.create(:meal_review)).to be_valid
    end
    
    it "is invalid without a comment" do
        expect(FactoryGirl.build(:meal_review, comment: nil)).to_not be_valid 
    end
    
    it "is invalid without a rating" do
        expect(FactoryGirl.build(:meal_review, rating: nil)).to_not be_valid
    end
    
end
