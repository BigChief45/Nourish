class MealReview < ActiveRecord::Base
    # Validations
    validates :comment, :presence => true
    validates :rating, :presence => true
    
    # Associations
    belongs_to :user
    belongs_to :meal
end
