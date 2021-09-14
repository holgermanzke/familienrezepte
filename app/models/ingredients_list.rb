class IngredientsList < ApplicationRecord
  belongs_to :ingredient_unit
  belongs_to :recipe
end
