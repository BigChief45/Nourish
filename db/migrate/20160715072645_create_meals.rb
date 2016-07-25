class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.integer :calories
      t.integer :protein
      t.integer :fat
      t.integer :carbohydrates
      t.string :image

      t.timestamps null: false
    end
  end
end
