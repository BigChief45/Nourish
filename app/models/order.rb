class Order < ActiveRecord::Base
    # Status Enum
    enum status: [:pending, :delivering, :completed, :cancelled]
    
    # Validations
    
    
    # Associations
    belongs_to :user
    belongs_to :meal_plan
end
