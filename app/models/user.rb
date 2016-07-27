class User < ActiveRecord::Base
    rolify
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable
    
    # Validations
    validates :first_name, :presence => true
    validates :last_name, :presence => true
    validates :address, :presence => true
    validates :pricing_plan, :presence => true #, inclusion: { in: PricingPlan.pluck(:name) }
    
    # Associations
    belongs_to :pricing_plan
    has_many :meal_plans, dependent: :destroy
    
    def name
        [first_name, last_name].join " " 
    end
end
