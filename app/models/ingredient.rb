class Ingredient < ApplicationRecord
  has_many :ingredient_units
  belongs_to :recipe
end
