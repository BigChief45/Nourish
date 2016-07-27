class MealPlansController < ApplicationController
    
    respond_to :html, :json
    
    before_action :authenticate_user!
    load_and_authorize_resource param_method: :meal_plan_params
    
    before_action :find_meal_plan, only: [:show, :edit, :update, :destroy]
    
    def index
        @meal_plans = current_user.meal_plans
    end
    
    def new
        @meal_plan = current_user.meal_plans.build
    end
    
    def create
        @meal_plan = current_user.meal_plans.build(meal_plan_params)
        @meal_plan.save
        
        # Check if the user already has an active plan
        if current_user.active_meal_plan.blank?
            # Set this plan to be active
            current_user.active_meal_plan = @meal_plan
            current_user.save
        end
        
        respond_with @meal_plan, location: -> { meal_plan_path(@meal_plan) }
    end
    
    def edit
    end
    
    def update
        @meal_plan.update(meal_plan_params)
        respond_with @meal_plan, location: -> { meal_plan_path(@meal_plan)}
    end
    
    def destroy
        @meal_plan.destroy
        respond_with @meal_plan, location: -> { meal_plans_path }
    end
    
    def meals_json
        # JSON data for JQuery TokenInput
        @meals_json = Meal.all.where("name LIKE ?", "%#{params[:q]}%")
        respond_with @meals_json.map { |model| {:id => model.id, :name => model.name } } 
    end
    
    def set_active
        @meal_plan = MealPlan.find(params[:id])
        
        current_user.active_meal_plan = @meal_plan
        current_user.save
        
        respond_with @meal_plan, location: -> { meal_plans_path }
    end
    
    private
    
        def find_meal_plan
           @meal_plan = MealPlan.find(params[:id]) 
        end
        
        def meal_plan_params
            params.require(:meal_plan).permit(:name, :user_id,
                :monday_breakfast_meal_id, :monday_lunch_meal_id, :monday_dinner_meal_id,
                :tuesday_breakfast_meal_id, :tuesday_lunch_meal_id, :tuesday_dinner_meal_id,
                :wednesday_breakfast_meal_id, :wednesday_lunch_meal_id, :wednesday_dinner_meal_id,
                :thursday_breakfast_meal_id, :thursday_lunch_meal_id, :thursday_dinner_meal_id,
                :friday_breakfast_meal_id, :friday_lunch_meal_id, :friday_dinner_meal_id
            ) 
        end
    
end
