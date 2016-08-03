class MealReviewsController < ApplicationController
    
    respond_to :html, :js    
    
    before_action :authenticate_user!
    load_and_authorize_resource param_method: :review_params
    
    before_action :find_meal
    before_action :find_review, only: [:show, :edit, :update, :destroy]
    
    def create
        @review = MealReview.new(review_params)
        @review.user_id = current_user.id
        @review.meal_id = @meal.id
        
        @review.save
        respond_with @review, location: -> { meal_path(@meal) }
    end
    
    private
    
        def find_review
           @review = Review.find(params[:id]) 
        end
    
        def find_meal
           @meal = Meal.find(params[:meal_id]) 
        end
    
        def review_params
            params.require(:meal_review).permit(:comment, :rating)
        end
    
end
