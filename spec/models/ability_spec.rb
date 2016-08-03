require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
    
    describe "User" do
        describe "abilities" do
            let(:user) { FactoryGirl.create(:user) }
            subject(:ability) { Ability.new(user) }
            
            # Administrators
            context "when user is an ADMIN" do
                let(:user) { FactoryGirl.create(:user, :admin) }
                
                it "should be able to manage all" do
                    is_expected.to be_able_to :manage, :all
                end
            end
            
            # Regular Users
            context "when user is a REGULAR USER" do
                let(:user) { FactoryGirl.create(:user, :user) }
                
                it "should be able to manage meal plans which they own" do
                    is_expected.to be_able_to :manage, MealPlan, :user_id => user.id
                end
                
                it "should NOT be able to manage other user's meal plans" do
                    other_user = FactoryGirl.create(:user, :user)
                    meal_plan = FactoryGirl.create(:meal_plan, user: other_user)
                    is_expected.not_to be_able_to :manage, meal_plan
                end
                
                it "should be able to create meal reviews" do
                    is_expected.to be_able_to :create, MealReview 
                end
                
                it "should NOT be able to create meals" do
                    is_expected.not_to be_able_to :create, Meal 
                end
                
                it "should NOT be able to manage orders" do
                    is_expected.not_to be_able_to :manage, Order 
                end
                
                it "should NOT be able to manage pricing plans" do
                    is_expected.not_to be_able_to :manage, PricingPlan
                end
            end
            
            # Guest User
            context "when user is a GUEST" do
                let(:user) { FactoryGirl.build(:user) }
                
                it "should be able to view meals" do
                    is_expected.to be_able_to :read, Meal 
                end
                
                it "should NOT be able to manage meal plans" do
                    is_expected.not_to be_able_to :manage, MealPlan
                end
                
                it "should NOT be able to manage meals" do
                    is_expected.not_to be_able_to :manage, Meal 
                end
                
                it "should NOT be able to manage orders" do
                    is_expected.not_to be_able_to :manage, Order 
                end
                
                it "should NOT be able to create meal reviews" do
                    is_expected.not_to be_able_to :create, MealReview 
                end
                
            end
        end
    end
end
