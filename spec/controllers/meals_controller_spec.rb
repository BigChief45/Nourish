require 'rails_helper'

RSpec.describe MealsController, type: :controller do

    describe "GET #index" do
        it "renders the :index view" do
            get :index
            expect(response).to render_template :index
        end
    end
    
    describe "GET #show" do
        let(:meal) { FactoryGirl.create(:meal) }
        
        it "assigns the requested meal to @meal" do
            get :show, id: meal
            expect(assigns(:meal)).to eq(meal)
        end
        
        it "renders the :show template" do
            get :show, id: meal
            expect(response).to render_template :show
        end
    end
    
    describe "GET #new" do
        before :each do
            @admin = FactoryGirl.create(:user, :admin)
            sign_in @admin
        end
        
        it "allows access to the :new template" do
            get :new
            expect(response).to render_template :new
        end
        
        it "assigns a new meal to @meal" do
            get :new
            expect(assigns(:meal)).to be_a_new(Meal)
        end
    end
    
    describe "GET #edit" do
        let(:meal) { FactoryGirl.create(:meal) }
        
        before :each do
            # Sign in with Devise as an admin user
            sign_in FactoryGirl.create(:user, :admin)
            
            # Bypass CanCan's authorization
            allow_any_instance_of(CanCan::ControllerResource).to receive(:load_and_authorize_resource){ nil }
        end
        
        it "assigns the requested meal to @meal" do
            get :edit, id: meal
            expect(assigns(:meal)).to eq(meal)
        end
        
        it "renders the :edit template" do
            get :edit, id: meal
            expect(response).to render_template :edit
        end
    end
    
    describe "POST #create" do
        before :each do
            sign_in FactoryGirl.create(:user, :admin)
            allow_any_instance_of(CanCan::ControllerResource).to receive(:load_and_authorize_resource){ nil }
        end
        
        context "with valid attributes" do
            it "creates the meal" do
                expect {post :create, meal: FactoryGirl.attributes_for(:meal)}.to change(Meal, :count).by(1)
            end
            
            it "redirects to the new meal" do
                post :create, meal: FactoryGirl.attributes_for(:meal)
                expect(response).to redirect_to Meal.last 
            end
        end
        
        context "with invalid attributes" do
            it "does not create the new meal" do
                expect { post :create, meal: FactoryGirl.attributes_for(:invalid_meal) }.to_not change(Meal, :count)
            end
            
            it "re-renders the :new template" do
                post :create, meal: FactoryGirl.attributes_for(:invalid_meal)
                expect(response).to render_template :new
            end
        end
    end

    describe "PUT #update" do
        let(:meal) { FactoryGirl.create(:meal) }
        
        before :each do
            sign_in FactoryGirl.create(:user, :admin)
            allow_any_instance_of(CanCan::ControllerResource).to receive(:load_and_authorize_resource){ nil }
        end
        
        context "with valid attributes" do
            it "locates the requested @meal" do
                put :update, id: meal, meal: FactoryGirl.attributes_for(:meal, name: 'Pasta')
                expect(assigns(:meal)).to eq(meal)
            end
            
            it "changes @meal 's attributes" do
                put :update, id: meal, meal: FactoryGirl.attributes_for(:meal, name: 'Pasta')
                meal.reload
                expect(meal.name).to eq('Pasta')
            end
            
            it "redirects to the updated meal" do
                put :update, id: meal, meal: FactoryGirl.attributes_for(:meal, name: 'Pasta')
                expect(response).to redirect_to meal
            end
        end
        
        context "with invalid attributes" do
            it "locates the requested @meal" do
                put :update, id: meal, meal: FactoryGirl.attributes_for(:invalid_meal, name: 'Pasta')
                expect(assigns(:meal)).to eq(meal)
            end
            
            it "does not change @meal 's attributes" do
                put :update, id: meal, meal: FactoryGirl.attributes_for(:meal, name: 'Pasta', description: nil)
                meal.reload
                expect(meal.name).not_to eq('Pasta')
            end
            
            it "re-renders the :edit template" do
                put :update, id: meal, meal: FactoryGirl.attributes_for(:invalid_meal)
                expect(response).to render_template :edit
            end
        end
    end
    
    describe "DELETE #destroy" do
        let!(:meal) { FactoryGirl.create(:meal) }
        
        before :each do
            sign_in FactoryGirl.create(:user, :admin)
            allow_any_instance_of(CanCan::ControllerResource).to receive(:load_and_authorize_resource){ nil }
        end
        
        it "deletes the meal" do
            expect { delete :destroy, id: meal }.to change(Meal, :count).by(-1) 
        end
        
        it "redirects to meals#index" do
            delete :destroy, id: meal
            expect(response).to redirect_to meals_path
        end
    end

end
