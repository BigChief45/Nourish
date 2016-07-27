class AddActiveMealPlanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :active_meal_plan_id, :integer, :references => :meal_plan
  end
end
