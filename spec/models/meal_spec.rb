require 'rails_helper'

include ActionDispatch::TestProcess

RSpec.describe Meal, type: :model do
    it "has a valid factory" do
        expect(FactoryGirl.create(:meal)).to be_valid  
    end
    
    it "is invalid without a name" do
        expect(FactoryGirl.build(:meal, name: nil)).not_to be_valid 
    end
    
    it "is invalid without a description" do
        expect(FactoryGirl.build(:meal, description: nil)).not_to be_valid
    end
    
    # Calories
    it "is invalid without calories" do
        expect(FactoryGirl.build(:meal, calories: nil)).not_to be_valid 
    end
    
    it "is invalid with negative calories" do
       expect(FactoryGirl.build(:meal, calories: -100)).not_to be_valid 
    end
    
    # Protein
    it "is invalid without protein" do
        expect(FactoryGirl.build(:meal, protein: nil)).not_to be_valid  
    end
    
    it "is invalid with negative protein" do
        expect(FactoryGirl.build(:meal, protein: -100)).not_to be_valid
    end
    
    # Fat
    it "is invalid without fat" do
        expect(FactoryGirl.build(:meal, fat: nil)).not_to be_valid  
    end
    
    it "is invalid with negative fat" do
        expect(FactoryGirl.build(:meal, fat: -100)).not_to be_valid
    end
    
    it "is invalid without carbohydrates" do
        expect(FactoryGirl.build(:meal, carbohydrates: nil)).not_to be_valid 
    end
    
    # Image
    it "is invalid without an image" do
        expect(FactoryGirl.build(:meal, image: nil)).not_to be_valid
    end
    
    it "has a valid image file type" do
        meal = FactoryGirl.build(:meal)
        expect(['jpg', 'jpeg', 'png']).to include meal.image.file.extension
    end
    
    # Associations
    context "Associations" do
        it { is_expected.to(have_many :meal_reviews) } 
    end
end
