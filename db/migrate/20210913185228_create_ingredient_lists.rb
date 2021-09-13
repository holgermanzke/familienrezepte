class CreateIngredientLists < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredient_lists do |t|
      t.string :name
      t.integer :value
      t.references :ingredient_unit, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
