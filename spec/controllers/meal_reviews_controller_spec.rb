require 'rails_helper'

RSpec.describe MealReviewsController, type: :controller do
    
    let(:meal) { FactoryGirl.create(:meal) }
    
    before :each do
        # Sign in with Devise as an admin user
        sign_in FactoryGirl.create(:user, :admin)
        
        # Bypass CanCan's authorization
        allow_any_instance_of(CanCan::ControllerResource).to receive(:load_and_authorize_resource){ nil }
    end
    
    describe "POST #create" do
        context "with valid attributes" do
            it "creates a new review" do
                expect { post :create, { meal_id: meal, format: 'js', meal_review: FactoryGirl.attributes_for(:meal_review)} }.to change(MealReview, :count).by(1)
            end
            
            it "redirects to the meal view" do
                post :create, { meal_id: meal, meal_review: FactoryGirl.attributes_for(:meal_review) }
                expect(response).to redirect_to meal
            end
        end
        
        context "with invalid attributes" do
            it "does not create a new review" do
                expect { post :create, { meal_id: meal, format: 'js', meal_review: FactoryGirl.attributes_for(:invalid_meal_review)} }.to_not change(MealReview, :count) 
            end
        end
    end
end
