class CreateMealReviews < ActiveRecord::Migration
  def change
    create_table :meal_reviews do |t|
      t.integer :rating
      t.text :comment
      t.integer :user_id
      t.integer :meal_id

      t.timestamps null: false
    end
  end
end
