class Meal < ActiveRecord::Base
    
    attr_accessor :avg_review
    
    # Validations
    validates :name, :presence => true
    validates :description, :presence => true
    validates :calories, :presence => true, numericality: { only_integer: true, greater_than: 0 }
    validates :protein, :presence => true, numericality: { only_integer: true, greater_than: 0 }
    validates :fat, :presence => true, numericality: { only_integer: true, greater_than: 0 }
    validates :carbohydrates, :presence => true, numericality: { only_integer: true, greater_than: 0}
    validates_presence_of :image
    
    # Carrierwave Uploader
    mount_uploader :image, MealImageUploader
    
    # Associations
    has_many :meal_reviews, dependent: :destroy
    
    def avg_review
        # Get all reviews for this Meal
        reviews = self.meal_reviews
        
        # Get the average, if there are any reviews
        reviews.blank? ? avg_review = 0 : avg_review = reviews.average(:rating).round(2)
        
        return avg_review
    end
end
