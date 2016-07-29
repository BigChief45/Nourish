class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :meal_plan_id
      t.integer :meal_id
      t.integer :status, default: 0
      t.string :token

      t.timestamps null: false
    end
  end
end
