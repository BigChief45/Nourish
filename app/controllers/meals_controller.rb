class MealsController < ApplicationController
    
    respond_to :html, :json
    
    before_action :authenticate_user!, except: [:index, :show]
    load_and_authorize_resource
    before_action :find_meal, only: [:show, :edit, :update, :destroy]
    
    
    def index
        @meals = Meal.all.order('created_at DESC')
    end
    
    def new
        @meal = Meal.new
    end
    
    def create
        @meal = Meal.create(meal_params)
        respond_with @meal, location: -> { meal_path(@meal) }
    end
    
    def show
        @reviews = @meal.meal_reviews.order('created_at DESC')
        
        # For adding new Reviews
        @review = MealReview.new
        
        # Other meals (PostgreSQL Specific)
        @other_meals = Meal.order("RANDOM()").first(5)
    end
    
    def edit
    end
    
    def update
        @meal.update(meal_params)
        respond_with @meal, location: -> { meal_path(@meal)}
    end
    
    def destroy
       @meal.destroy
       respond_with @meal, location: -> { meals_path }
    end
    
    private
        
        def find_meal
            @meal = Meal.find(params[:id])
        end
        
        def meal_params
            params.require(:meal).permit(:name, :description, :calories, :protein, :fat, :carbohydrates, :image) 
        end

end
