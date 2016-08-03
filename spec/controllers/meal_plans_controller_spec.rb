require 'rails_helper'

RSpec.describe MealPlansController, type: :controller do
    
    before :each do
        # Sign in with Devise as an admin user
        sign_in FactoryGirl.create(:user, :admin)
        
        # Bypass CanCan's authorization
        allow_any_instance_of(CanCan::ControllerResource).to receive(:load_and_authorize_resource){ nil }
    end
    
    describe "GET #index" do
        it "renders the :index view" do
            get :index
            expect(response).to render_template :index
        end
    end
    
    describe "GET #show" do
        let(:meal_plan) { FactoryGirl.create(:meal_plan) }
        
        it "assigns the requested meal plan to @meal_plan" do
            get :show, id: meal_plan
            expect(assigns(:meal_plan)).to eq(meal_plan)
        end
        
        it "renders the :show template" do
            get :show, id: meal_plan
            expect(response).to render_template :show
        end
    end
    
    describe "GET #new" do
        it "allows access to the :new template" do
            get :new
            expect(response).to render_template :new
        end
        
        it "assigns a new meal plan to @meal_plan" do
            get :new
            expect(assigns(:meal_plan)).to be_a_new(MealPlan)
        end
    end
    
    describe "GET #edit" do
        let(:meal_plan) { FactoryGirl.create(:meal_plan) }
        
        it "assigns the requested meal plan to @meal_plan" do
            get :edit, id: meal_plan
            expect(assigns(:meal_plan)).to eq(meal_plan)
        end
        
        it "renders the :edit template" do
            get :edit, id: meal_plan
            expect(response).to render_template :edit
        end
    end
    
    describe "GET #meals_json" do
        before :each do
            FactoryGirl.create(:meal)
            get :meals_json, format: :json
            @parsed_response = JSON.parse(response.body)
        end
        
        it "returns all the meals in JSON format" do
            expect(@parsed_response.length).to eq(Meal.count)
        end
        
        it "returns the JSON data with the id attribute" do
            expect(@parsed_response[0]['id']).to eq(Meal.first.id)
        end
        
        it "returns the JSON data with the name attribute" do
            expect(@parsed_response[0]['name']).to eq(Meal.first.name)
        end
    end
    
    describe "POST #create" do
        context "with valid attriutes" do
            it "creates the new meal plan" do
                expect { post :create, meal_plan: FactoryGirl.attributes_for(:meal_plan) }.to change(MealPlan, :count).by(1) 
            end
            
            it "redirects to the new meal plan" do
                post :create, meal_plan: FactoryGirl.attributes_for(:meal_plan)
                expect(response).to redirect_to MealPlan.last
            end
        end
        
        context "with invalid attributes" do
            it "does not create the new meal plan" do
                expect { post :create, meal_plan: FactoryGirl.attributes_for(:invalid_meal_plan) }.to_not change(MealPlan, :count) 
            end
            
            it "re renders the :new template" do
                post :create, meal_plan: FactoryGirl.attributes_for(:invalid_meal_plan)
                expect(response).to render_template :new
            end
        end
    end
    
    describe "PUT #update" do
        let(:meal_plan) { FactoryGirl.create(:meal_plan) }
        
        context "with valid attributes" do
            it "locates the requested @meal_plan" do
                put :update, id: meal_plan, meal_plan: FactoryGirl.attributes_for(:meal_plan, name: 'Winter Plan')
                expect(assigns(:meal_plan)).to eq(meal_plan)
            end
            
            it "updates the meal plan's attributes" do
                put :update, id: meal_plan, meal_plan: FactoryGirl.attributes_for(:meal_plan, name: 'Winter Plan')
                meal_plan.reload
                expect(meal_plan.name).to eq('Winter Plan')
            end
            
            it "redirects to the updated meal plan" do
                put :update, id: meal_plan, meal_plan: FactoryGirl.attributes_for(:meal_plan, name: 'Winter Plan')
                expect(response).to redirect_to meal_plan
            end
        end
        
        context "with invalid attributes" do
            it "locates the requested @meal_plan" do
                put :update, id: meal_plan, meal_plan: FactoryGirl.attributes_for(:invalid_meal_plan, monday_breakfast_meal_id: 2)
                expect(assigns(:meal_plan)).to eq(meal_plan)
            end
            
            it "does not update the meal plan's attributes" do
                put :update, id: meal_plan, meal_plan: FactoryGirl.attributes_for(:invalid_meal_plan, monday_breakfast_meal_id: 2)
                meal_plan.reload
                expect(meal_plan.monday_breakfast_meal_id).not_to eq(2)
            end
            
            it "re-renders the :edit template" do
                put :update, id: meal_plan, meal_plan: FactoryGirl.attributes_for(:invalid_meal_plan, monday_breakfast_meal_id: 2)
                meal_plan.reload
                expect(response).to render_template :edit
            end
            
        end
    end
    
    describe "DELETE #destroy" do
        let!(:meal_plan) { FactoryGirl.create(:meal_plan) }
        
        it "deletes the meal plan" do
            expect { delete :destroy, id: meal_plan }.to change(MealPlan, :count).by(-1) 
        end
        
        it "redirects to meal_plans#index" do
            delete :destroy, id: meal_plan
            expect(response).to redirect_to meal_plans_path
        end
    end
end
