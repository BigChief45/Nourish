class MealPlan < ActiveRecord::Base
    
    # Validations
    validates :name, :presence => true
    
    # Associations
    belongs_to :user
    
    # http://stackoverflow.com/questions/2166613/multiple-foreign-keys-referencing-the-same-table-in-ror
    belongs_to :monday_breakfast_meal, :class_name => "Meal"
    belongs_to :monday_lunch_meal, :class_name => "Meal"
    belongs_to :monday_dinner_meal, :class_name => "Meal"
    
    belongs_to :tuesday_breakfast_meal, :class_name => "Meal"
    belongs_to :tuesday_lunch_meal, :class_name => "Meal"
    belongs_to :tuesday_dinner_meal, :class_name => "Meal"
    
    belongs_to :wednesday_breakfast_meal, :class_name => "Meal"
    belongs_to :wednesday_lunch_meal, :class_name => "Meal"
    belongs_to :wednesday_dinner_meal, :class_name => "Meal"
    
    belongs_to :thursday_breakfast_meal, :class_name => "Meal"
    belongs_to :thursday_lunch_meal, :class_name => "Meal"
    belongs_to :thursday_dinner_meal, :class_name => "Meal"
    
    belongs_to :friday_breakfast_meal, :class_name => "Meal"
    belongs_to :friday_lunch_meal, :class_name => "Meal"
    belongs_to :friday_dinner_meal, :class_name => "Meal"
    
end
