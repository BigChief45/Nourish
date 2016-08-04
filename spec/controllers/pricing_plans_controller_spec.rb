require 'rails_helper'

RSpec.describe PricingPlansController, type: :controller do
    let(:user) { FactoryGirl.create(:user, :admin) }
    
    before :each do
        # Sign in with Devise as an admin user
        @request.env["devise.mapping"] = Devise.mappings[:admin]
        sign_in user
        
        # Bypass CanCan's authorization
        allow_any_instance_of(CanCan::ControllerResource).to receive(:load_and_authorize_resource){ nil }
    end
    
    describe "GET #index" do
        it "renders the :index view" do
            get :index
            expect(response).to render_template :index
        end
    end
    
    describe "GET #new" do
        it "renders the :new template" do
            get :new
            expect(response).to render_template :new 
        end
        
        it "assigns a new pricing plan to @plan" do
            get :new
            expect(assigns(:plan)).to be_a_new(PricingPlan)
        end
    end
    
    describe "GET #edit" do
        let(:pricing_plan) { FactoryGirl.create(:pricing_plan) }
        
        it "renders the :edit template" do
            get :edit, id: pricing_plan
            expect(response).to render_template :edit
        end
        
        it "assigns the requested pricing plan to @plan" do
            get :edit, id: pricing_plan
            expect(assigns(:plan)).to eq(pricing_plan)
        end
    end
    
    describe "POST #create" do
        context "with valid attributes" do
            it "creates a new pricing plan" do
                expect { post :create, pricing_plan: FactoryGirl.attributes_for(:pricing_plan) }.to change(PricingPlan, :count).by(1)
            end
            
            it "redirects to the pricing plans :index view" do
                post :create, pricing_plan: FactoryGirl.attributes_for(:pricing_plan)
                expect(response).to redirect_to pricing_plans_path
            end
        end
        
        context "with invalid attributes" do
            it "does not create a new pricing plan" do
                expect { post :create, pricing_plan: FactoryGirl.attributes_for(:pricing_plan, name: nil) }.not_to change(PricingPlan, :count) 
            end
            
            it "re-renders the :new template" do
                post :create, pricing_plan: FactoryGirl.attributes_for(:pricing_plan, name: nil)
                expect(response).to render_template :new
            end
        end
    end
    
    describe "PUT #update" do
        let(:pricing_plan) { FactoryGirl.create(:pricing_plan) }
        
        context "with valid attributes" do
            before :each do
                put :update, id: pricing_plan, pricing_plan: FactoryGirl.attributes_for(:pricing_plan, name: 'Premium')
            end
            
            it "locates the requested pricing plan" do
                expect(assigns(:plan)).to eq(pricing_plan)
            end
            
            it "updates the pricing plan's attributes" do
                pricing_plan.reload
                expect(pricing_plan.name).to eq('Premium')
            end
            
            it "redirects to pricing plans :index view" do
                expect(response).to redirect_to pricing_plans_path
            end
        end
        
        context "with invalid attributes" do
            before :each do
                put :update, id: pricing_plan, pricing_plan: FactoryGirl.attributes_for(:pricing_plan, name: nil)
            end
            
            it "locates the requested pricing plan" do
                expect(assigns(:plan)).to eq(pricing_plan) 
            end
            
            it "does not update the pricing plan's attributes" do
                pricing_plan.reload
                expect(pricing_plan.name).not_to eq('Premium')
            end
            
            it "re-renders the :edit template" do
                expect(response).to render_template :edit 
            end
        end
    end
    
    describe "DELETE #destroy" do
        let!(:pricing_plan) { FactoryGirl.create(:pricing_plan) }
        
        it "destroys the pricing plan" do
            expect { delete :destroy, id: pricing_plan }.to change(PricingPlan, :count).by(-1)
        end
        
        it "redirects to the pricing plans :index view" do
            delete :destroy, id: pricing_plan
            expect(response).to redirect_to pricing_plans_path
        end
    end
end
