class AddColumnToIngredientUnits < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredient_units, :shortcut, :string
  end
end
