class CreateIngredientUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredient_units do |t|
      t.string :name

      t.timestamps
    end
  end
end
