class PricingPlan < ActiveRecord::Base
    
    # Validations
    validates :name, :presence => true
    validates :price, :presence => true
    validates :state, :presence => true
    
    # Associations
    has_many :users
end
