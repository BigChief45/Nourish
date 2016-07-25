require 'rails_helper'

include ActionDispatch::TestProcess

RSpec.describe Meal, type: :model do
    it "has a valid factory" do
        FactoryGirl.create(:meal).should be_valid  
    end
    
    it "is invalid without a name" do
        FactoryGirl.build(:meal, name: nil).should_not be_valid 
    end
    
    it "is invalid without a description" do
        FactoryGirl.build(:meal, description: nil).should_not be_valid
    end
    
    # Calories
    it "is invalid without calories" do
        FactoryGirl.build(:meal, calories: nil).should_not be_valid 
    end
    
    it "is invalid with negative calories" do
       FactoryGirl.build(:meal, calories: -100).should_not be_valid 
    end
    
    # Protein
    it "is invalid without protein" do
        FactoryGirl.build(:meal, protein: nil).should_not be_valid  
    end
    
    it "is invalid with negative protein" do
        FactoryGirl.build(:meal, protein: -100).should_not be_valid
    end
    
    # Fat
    it "is invalid without fat" do
        FactoryGirl.build(:meal, fat: nil).should_not be_valid  
    end
    
    it "is invalid with negative fat" do
        FactoryGirl.build(:meal, fat: -100).should_not be_valid
    end
    
    it "is invalid without carbohydrates" do
        FactoryGirl.build(:meal, carbohydrates: nil).should_not be_valid 
    end
    
    # Image
    it "is invalid without an image" do
        FactoryGirl.build(:meal, image: nil).should_not be_valid
    end
    
    it "has a valid image file type" do
        meal = FactoryGirl.build(:meal)
        extension = meal.image.file.extension
       
        if ['jpg', 'jpeg', 'png'].include? extension
            meal.should be_valid
        else
            meal.should_not be_valid
        end
    end
end
