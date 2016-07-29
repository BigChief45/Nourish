class Order < ActiveRecord::Base
    # Status Enum
    enum status: [:pending, :delivering, :completed, :cancelled]
    
    # Validations
    validates :token, :presence => true, :uniqueness => true
    validates :status, :presence => true
    validates :user, :presence => true
    validates :meal_plan, :presence => true
    validates :meal, :presence => true
    
    # Associations
    belongs_to :user
    belongs_to :meal_plan
    belongs_to :meal

end
