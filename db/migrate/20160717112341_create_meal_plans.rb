class CreateMealPlans < ActiveRecord::Migration
  def change
    create_table :meal_plans do |t|
      t.string :name
      t.integer :monday_breakfast_meal_id, :references => "meal"
      t.integer :monday_lunch_meal_id, :references => "meal"
      t.integer :monday_dinner_meal_id, :references => "meal"
      t.integer :tuesday_breakfast_meal_id, :references => "meal"
      t.integer :tuesday_lunch_meal_id, :references => "meal"
      t.integer :tuesday_dinner_meal_id, :references => "meal"
      t.integer :wednesday_breakfast_meal_id, :references => "meal"
      t.integer :wednesday_lunch_meal_id, :references => "meal"
      t.integer :wednesday_dinner_meal_id, :references => "meal"
      t.integer :thursday_breakfast_meal_id, :references => "meal"
      t.integer :thursday_lunch_meal_id, :references => "meal"
      t.integer :thursday_dinner_meal_id, :references => "meal"
      t.integer :friday_breakfast_meal_id, :references => "meal"
      t.integer :friday_lunch_meal_id, :references => "meal"
      t.integer :friday_dinner_meal_id, :references => "meal"
      t.integer :user_id
      t.string :state

      t.timestamps null: false
    end
  end
end
