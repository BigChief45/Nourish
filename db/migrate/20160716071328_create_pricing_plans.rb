class CreatePricingPlans < ActiveRecord::Migration
  def change
    create_table :pricing_plans do |t|
      t.string :name
      t.decimal :price, :presicion => 10
      t.string :stripe_name
      t.string :state, :default => 'active'

      t.timestamps null: false
    end
  end
end
