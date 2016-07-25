class AddPlanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pricing_plan_id, :integer
  end
end
