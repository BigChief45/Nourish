class MealReviewsController < ApplicationController
    
    before_action :find_meal
    before_action :find_review, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    
    respond_to :html, :js
    
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
