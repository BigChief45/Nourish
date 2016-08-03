require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
    
    before :each do
        # Sign in with Devise as an admin user
        sign_in FactoryGirl.create(:user, :admin)
        
        # Bypass CanCan's authorization
        allow_any_instance_of(CanCan::ControllerResource).to receive(:load_and_authorize_resource){ nil }
    end
    
    describe "GET #index" do
        it "renders the :index template" do
            get :index
            expect(response).to render_template :index
        end
    end
    
    describe "GET #show" do
        let(:order) { FactoryGirl.create(:order) }
        
        it "assigns the requested order to @order" do
            get :show, id: order
            expect(assigns(:order)).to eq(order)
        end
        
        it "renders the :show template" do
            get :show, id: order
            expect(response).to render_template :show
        end
    end
    
    describe "DELETE #destroy" do
        let!(:order) { FactoryGirl.create(:order) }
        
        it "deletes the order" do
            expect { delete :destroy, id: order }.to change(Order, :count).by(-1)
        end
        
        it "redirects to :index view" do
            delete :destroy, id: order
            expect(response).to redirect_to orders_path
        end
        
    end
    
end
