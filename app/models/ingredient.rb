class Ingredient < ApplicationRecord
  belongs_to :ingredient_unit
  belongs_to :recipe
  validates :name, :value, :ingredient_unit_id, presence: true
end
