class PricingPlansController < ApplicationController
    
    respond_to :html
    
    before_action :authenticate_user!
    load_and_authorize_resource param_method: :plan_params
    
    before_action :find_plan, only: [:show, :edit, :update, :destroy]
    
    def index
        @plans = PricingPlan.all.order('created_at DESC')
    end
    
    def new
        @plan = PricingPlan.new
    end
    
    def create
        @plan = PricingPlan.create(plan_params)
        respond_with @plan, location: -> { pricing_plans_path }    
    end
    
    def edit
    end
    
    def update
       @plan.update(plan_params)
       respond_with @plan, location: -> { pricing_plans_path }
    end
    
    def destroy
       @plan.destroy
       respond_with @plan, location: -> { pricing_plans_path }
    end
    
    private
    
        def find_plan
            @plan = PricingPlan.find(params[:id])
        end
    
        def plan_params
           params.require(:pricing_plan).permit(:name, :price, :state, :stripe_name) 
        end
end
